package com.teksands.utils;

//https://www.woolha.com/tutorials/java-sending-email-using-mandrill-example
//https://stackoverflow.com/questions/4486787/jackson-with-json-unrecognized-field-not-marked-as-ignorable

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.http.client.HttpClient;
import org.apache.http.impl.client.DefaultHttpClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;

import com.cribbstechnologies.clients.mandrill.exception.RequestFailedException;
import com.cribbstechnologies.clients.mandrill.model.MandrillAttachment;
import com.cribbstechnologies.clients.mandrill.model.MandrillHtmlMessage;
import com.cribbstechnologies.clients.mandrill.model.MandrillMessageRequest;
import com.cribbstechnologies.clients.mandrill.model.MandrillRecipient;
import com.cribbstechnologies.clients.mandrill.model.response.message.SendMessageResponse;
import com.cribbstechnologies.clients.mandrill.request.MandrillMessagesRequest;
import com.cribbstechnologies.clients.mandrill.request.MandrillRESTRequest;
import com.cribbstechnologies.clients.mandrill.util.MandrillConfiguration;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.itextpdf.text.pdf.codec.Base64;
import com.teksands.user.response.UserAnswerResponse;

import freemarker.template.SimpleHash;


public class SendEmailUtil 
{
	@Autowired
	ServletContext servletContext;
	
	@Autowired
	Properties properties;
	
	@Autowired
	HttpServletRequest httpServletRequest;
	
	@Async
	public void sendMail(MailMessage mailMessage)
	{
		try {
			
			MandrillRESTRequest request = new MandrillRESTRequest();
			MandrillConfiguration config = new MandrillConfiguration();
			MandrillMessagesRequest messagesRequest = new MandrillMessagesRequest();
			ObjectMapper mapper = new ObjectMapper().configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
			
			HttpClient client = new DefaultHttpClient();
			request.setHttpClient(client);
			
			config.setApiKey("29p0v41a9IZr1PyR65__iw");
			config.setApiVersion("1.0");
			config.setBaseURL("https://mandrillapp.com/api");
			
			request.setConfig(config);
			request.setObjectMapper(mapper);
			messagesRequest.setRequest(request);
			
			MandrillMessageRequest mmr = new MandrillMessageRequest();
			MandrillHtmlMessage message = new MandrillHtmlMessage();
			Map<String, String> headers = new HashMap<String, String>();
			
			message.setFrom_email(mailMessage.getFrom());
			message.setFrom_name(mailMessage.getSenderName());
			message.setHeaders(headers);
			message.setHtml(mailMessage.getMessage());
			message.setSubject(mailMessage.getSubject());
			
			int recipient_size = mailMessage.getToList().size() + mailMessage.getCcList().size() + mailMessage.getBccList().size();
			MandrillRecipient[] recipients = new MandrillRecipient[recipient_size];
			int i = 0;
			
			// add To recipients
			List<String> toRecip = mailMessage.getToList();
			if (toRecip.size() > 0)
			{
				for (String email : toRecip) 
				{
					recipients[i++] = new MandrillRecipient("", email, "to");
				}
			}
			
			// add CC recipients
			List<String> ccRecip = mailMessage.getCcList();
			if (ccRecip.size() > 0)
			{
				for (String email : ccRecip) 
				{
					recipients[i++] = new MandrillRecipient("", email, "cc");
				}
			}
			
			// add CC recipients
			List<String> bccRecip = mailMessage.getBccList();
			if (bccRecip.size() > 0)
			{
				for (String email : bccRecip) 
				{
					recipients[i++] = new MandrillRecipient("", email, "bcc");
				}
			}
						
			message.setTo(recipients);
			message.setTrack_clicks(true);
			message.setTrack_opens(true);
			
			// Add Attachments
			List<String> attachments_arr = mailMessage.getAttachmentFiles();
			if (attachments_arr.size() > 0)
			{
				List<MandrillAttachment> messageContentList = new ArrayList<MandrillAttachment>();
				for (String fileName : attachments_arr) 
				{					
					File file = new File(fileName);
					String name = file.getName();
					String type = httpServletRequest.getServletContext().getMimeType(name);
					String content = Base64.encodeFromFile(file.getPath());
					
				    MandrillAttachment messageContent = new MandrillAttachment(type, name, content);
				    messageContentList.add(messageContent);
				}
				message.setAttachments(messageContentList);
			}		
			mmr.setMessage(message);
			SendMessageResponse response = messagesRequest.sendMessage(mmr);
			
			String toList = "";
			for(int k = 0; k < toRecip.size(); k++)
			{
				if(k == (toRecip.size()-1))
				{
					toList += toRecip.get(k);
				}else{
					toList += toRecip.get(k) + ",";
				}
			}
			
			String ccList = "";
			for(int k = 0; k < ccRecip.size(); k++)
			{
				if(k == (ccRecip.size()-1))
				{
					ccList += ccRecip.get(k);
				}else{
					ccList += ccRecip.get(k) + ",";
				}
			}
			
			String bccList = "";
			for(int k = 0; k < bccRecip.size(); k++)
			{
				if(k == (bccRecip.size()-1))
				{
					bccList += bccRecip.get(k);
				}else{
					bccList += bccRecip.get(k) + ",";
				}
			}
			
			
		} catch (RequestFailedException e) {
			e.printStackTrace();
		}
	}
		
	public void sendCourseBroucherFromLandingPage(String name, String email, String email_content, String subject, String attachment_path) throws Exception 
	{
		try 
		{			
			SimpleHash simpleHash = new SimpleHash();
			simpleHash.put("name", name);
			simpleHash.put("email_content", email_content);
			String host = properties.getHostDomainUrl();
			simpleHash.put("host", host);
			
			String message = FTLHelper.getMailBody(simpleHash, "dataattachment.ftl", servletContext);
			MailMessage mailMessage = new MailMessage(subject, message);
			
			mailMessage.setSenderName(properties.getSupport_email());
			mailMessage.setFrom(properties.getSupport_email());
			
			List<String> toAddress = new ArrayList<String>();
			toAddress.add(email);
			mailMessage.setToList(toAddress);
			
			List<String> attachmentList = new ArrayList<String>();
			attachmentList.add(attachment_path);
			mailMessage.setAttachmentFiles(attachmentList);
			
			sendMail(mailMessage);
		} 
		catch (Exception ex) 
		{
			ex.printStackTrace();
		}
	}
	
	public void sendEbooks(String name, String email, String email_content, String subject, String attachment_path) throws Exception 
	{
		try 
		{			
			SimpleHash simpleHash = new SimpleHash();
			simpleHash.put("name", name);
			simpleHash.put("email_content", email_content);
			String host = properties.getHostDomainUrl();
			simpleHash.put("host", host);
			
			String message = FTLHelper.getMailBody(simpleHash, "welcomeuser.ftl", servletContext);
			MailMessage mailMessage = new MailMessage(subject, message);
			
			mailMessage.setSenderName(properties.getSupport_email());
			mailMessage.setFrom(properties.getSupport_email());
			
			List<String> toAddress = new ArrayList<String>();
			toAddress.add(email);
			mailMessage.setToList(toAddress);
			
			List<String> attachmentList = new ArrayList<String>();
			attachmentList.add(attachment_path);
			mailMessage.setAttachmentFiles(attachmentList);
			
			sendMail(mailMessage);
		} 
		catch (Exception ex) 
		{
			ex.printStackTrace();
		}
	}
	
	public void schedulecallToCandidate(String name, String email, String call_date, String call_time, String call_reason) throws Exception 
	{
		try 
		{			
			String subject = "Call Scheduled from Teksands";

			SimpleHash simpleHash = new SimpleHash();
			simpleHash.put("name", name);
			simpleHash.put("call_time", call_time);
			simpleHash.put("call_date", call_date);
			simpleHash.put("call_reason", call_reason);
			
			String message = FTLHelper.getMailBody(simpleHash, "candidatecallschedule.ftl", servletContext);
			MailMessage mailMessage = new MailMessage(subject, message);
			
			mailMessage.setSenderName(properties.getMail_support_name());
			mailMessage.setFrom(properties.getMail_support_email());
			
			List<String> toAddress = new ArrayList<String>();
			toAddress.add(email);
			mailMessage.setToList(toAddress);
			
			List<String> bccAddress = new ArrayList<String>();
			bccAddress.add(properties.getSupport_email());
			mailMessage.setBccList(bccAddress);
			
			sendMail(mailMessage);
		} 
		catch (Exception ex) 
		{
			ex.printStackTrace();
		}
	}
	
	public void candidateCallCancelled(String name, String email) throws Exception 
	{
		try 
		{			
			String subject = "Call was Cancenlled - Teksands";
			
			SimpleHash simpleHash = new SimpleHash();
			simpleHash.put("name", name);
			
			String message = FTLHelper.getMailBody(simpleHash, "call-cancell.ftl", servletContext);
			MailMessage mailMessage = new MailMessage(subject, message);
			
			mailMessage.setSenderName(properties.getMail_support_name());
			mailMessage.setFrom(properties.getMail_support_email());
			
			List<String> toAddress = new ArrayList<String>();
			toAddress.add(email);
			mailMessage.setToList(toAddress);
			
			List<String> bccAddress = new ArrayList<String>();
			bccAddress.add(properties.getSupport_email());
			mailMessage.setBccList(bccAddress);

			sendMail(mailMessage);
		} 
		catch (Exception ex) 
		{
			ex.printStackTrace();
		}
	}
	
	public void sendUserEmailAndPassword(String name, String email, String password, String url) throws Exception 
	{
		try 
		{		
			String subject = "Teksands Bootcamp - Login Credentials";
			
			SimpleHash simpleHash = new SimpleHash();
			simpleHash.put("name", name);
			simpleHash.put("email", email);
			simpleHash.put("password", password);
			simpleHash.put("url", url);
			
			String message = FTLHelper.getMailBody(simpleHash, "welcome-user.ftl", servletContext);
			MailMessage mailMessage = new MailMessage(subject, message);
			
			mailMessage.setSenderName(properties.getSupport_email());
			mailMessage.setFrom(properties.getSupport_email());
			
			List<String> toAddress = new ArrayList<String>();
			toAddress.add(email);
			mailMessage.setToList(toAddress);
			
			sendMail(mailMessage);
		} 
		catch (Exception ex) 
		{
			ex.printStackTrace();
		}
	}
	
	public void sendAckenowledgementEmailToEnquirer(String name, String email) throws Exception 
	{
		try 
		{		
			String subject = "Thanks for Contacting Teksands";
			
			SimpleHash simpleHash = new SimpleHash();
			simpleHash.put("name", name);
			
			String message = FTLHelper.getMailBody(simpleHash, "user_acknowledgement.ftl", servletContext);
			MailMessage mailMessage = new MailMessage(subject, message);
			
			mailMessage.setSenderName(properties.getSupport_name());
			mailMessage.setFrom(properties.getSupport_email());
			
			List<String> toAddress = new ArrayList<String>();
			toAddress.add(email);
			mailMessage.setToList(toAddress);
			
			sendMail(mailMessage);
		} 
		catch (Exception ex) 
		{
			ex.printStackTrace();
		}
	}
	
	public void sendLeadsEmailToAdmin(String name,String company, String email, String mobile, String enquiry_type) throws Exception 
	{
		try 
		{		
			String subject = "Teksands - New Equiry Notification";
			
			SimpleHash simpleHash = new SimpleHash();
			simpleHash.put("name", name);
			simpleHash.put("company", company);
			simpleHash.put("email", email);
			simpleHash.put("mobile", mobile);
			simpleHash.put("enquiry_type", enquiry_type);
			
			String message = FTLHelper.getMailBody(simpleHash, "contactdetails.ftl", servletContext);
			MailMessage mailMessage = new MailMessage(subject, message);
			
			mailMessage.setSenderName(properties.getSupport_name());
			mailMessage.setFrom(properties.getSupport_email());
			
			List<String> toAddress = new ArrayList<String>();
			toAddress.add("richa@teksands.ai");
			toAddress.add("manas@teksands.ai");
			mailMessage.setToList(toAddress);
			
			sendMail(mailMessage);
		} 
		catch (Exception ex) 
		{
			ex.printStackTrace();
		}
	}
	
	public void sendVerificationCode(String name,String email, String v_code) throws Exception 
	{
		try 
		{
			String subject = "Teksands - Verification Code";
			
			SimpleHash simpleHash = new SimpleHash();
			simpleHash.put("v_code", v_code);
			simpleHash.put("name", name);
			
			String message = FTLHelper.getMailBody(simpleHash, "verificationCode.ftl", servletContext);
			MailMessage mailMessage = new MailMessage(subject, message);
		
			mailMessage.setSenderName(properties.getMail_support_name());
			mailMessage.setFrom(properties.getMail_support_email());
			
			List<String> toAddress = new ArrayList<String>();
			toAddress.add(email);
			mailMessage.setToList(toAddress);
			
			sendMail(mailMessage);
		} 
		catch (Exception ex) 
		{
			ex.printStackTrace();
		}
	}
	
	public void sendBrandAdminLoginDetails(String name,String email, String password) throws Exception 
	{
		try 
		{
			String subject = "Teksands - Your Account Username & Password";
			
			SimpleHash simpleHash = new SimpleHash();
			simpleHash.put("name", name);
			simpleHash.put("email", email);
			simpleHash.put("password", password);
			
			String message = FTLHelper.getMailBody(simpleHash, "sendBrandAdminLoginDetails.ftl", servletContext);
			MailMessage mailMessage = new MailMessage(subject, message);
		
			mailMessage.setSenderName(properties.getMail_support_name());
			mailMessage.setFrom(properties.getMail_support_email());
			
			List<String> toAddress = new ArrayList<String>();
			toAddress.add(email);
			mailMessage.setToList(toAddress);
			
			sendMail(mailMessage);
		} 
		catch (Exception ex) 
		{
			ex.printStackTrace();
		}
	}	

	public void sendTestResult(String name, String email, String testName, Date created_date, Integer mcQtotal, Integer mcQcorrect, Integer mcQWrong, Integer mcPercetage, List<UserAnswerResponse> testuserresponseList) throws Exception 
	{ 
		try 
		{
			String subject = "Teksands - Test Results";
			
			SimpleHash simpleHash = new SimpleHash();			
			simpleHash.put("name", name);
			simpleHash.put("email", email);
			simpleHash.put("testName", testName);
			simpleHash.put("test_date", created_date);
			simpleHash.put("mcQtotal", mcQtotal);
			simpleHash.put("mcQcorrect", mcQcorrect);
			simpleHash.put("mcQWrong", mcQWrong);
			simpleHash.put("mcPercetage", mcPercetage);			
			simpleHash.put("testanswerList", testuserresponseList);
			
			String message = FTLHelper.getMailBody(simpleHash, "test_result.ftl", servletContext);
			MailMessage mailMessage = new MailMessage(subject, message);
		
			mailMessage.setSenderName(properties.getMail_support_name());
			mailMessage.setFrom(properties.getMail_support_email());
			
			List<String> toAddress = new ArrayList<String>();
			toAddress.add(email);
			mailMessage.setToList(toAddress);
			
			sendMail(mailMessage);
		} 
		catch (Exception ex) 
		{
			ex.printStackTrace();
		}
	}
	
}