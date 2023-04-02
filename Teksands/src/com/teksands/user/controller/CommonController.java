package com.teksands.user.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.mysql.cj.util.Util;
import com.teksands.user.dao.CommonDAO;
import com.teksands.user.model.Career;
import com.teksands.user.model.Contactus;
import com.teksands.user.model.Contributor;
import com.teksands.user.model.HomeEnquiry;
import com.teksands.user.model.Internship;
import com.teksands.user.model.Leads;
import com.teksands.user.model.Trainers;
import com.teksands.user.response.CommonResponse;
import com.teksands.utils.Properties;
import com.teksands.utils.SendEmailUtil;
import com.teksands.utils.StatusMessage;
import com.teksands.utils.Utils;
import com.teksands.utils.ViewHelper;

@Controller
public class CommonController {

	@Autowired
	CommonDAO commonDAO;
	
	@Autowired
	Properties properties;
	
	@Autowired
	SendEmailUtil sendEmailUtil;
	
	@RequestMapping(value="/saveContacts")
	public void saveContacts(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;	
		try 
   		{
			commonResponse = new CommonResponse();
    		gson = new Gson();	
    		
    		String name = request.getParameter("name");
    		String mobile = request.getParameter("mobile");
    		String email = request.getParameter("email");
    		Date date = new Date();
    		String company = request.getParameter("company");
    		String requirements = request.getParameter("requirements");
    		
    		if(name == null) {name = "";}
    		if(mobile == null) {mobile = "";}
    		if(email == null) {email = "";}
    		if(company == null) {company = "";}
    		if(requirements == null) {requirements = "";}
    		
    		name = name.trim();
    		mobile = mobile.trim();
    		email = email.trim();
    		company = company.trim();
    		requirements = requirements.trim();
    		
    		Contactus contacts = new Contactus();
    		contacts.setName(name);
    		contacts.setEmail(email);
    		contacts.setMobile(mobile);
    		contacts.setDate(date);
    		contacts.setCompany(company);
    		contacts.setRequirements(requirements);
    		
    		boolean result = commonDAO.saveContacts(contacts);
    		if(result) {
    			commonResponse.setStatus("SUCCESS");
    			commonResponse.setStatus_code(200);
    			writer.print(gson.toJson(commonResponse));
    			writer.close();
    			return;
    		} else {
    			commonResponse.setStatus("FAILURE");
    			commonResponse.setStatus_code(400);
    			writer.print(gson.toJson(commonResponse));
    			writer.close();
    			return;
    		}
   		}
		catch(Exception ex)
       	{
       		ex.printStackTrace();
       		
       		commonResponse.setStatus("FAILURE");
			commonResponse.setStatus_code(400);
			writer.print(gson.toJson(commonResponse));
			writer.close();
			return;
       	}
	}
	
	@RequestMapping(value="/saveTrainers")
	public void saveTrainers(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;	
		try 
   		{
			commonResponse = new CommonResponse();
    		gson = new Gson();	
    		
    		String name = request.getParameter("name");
    		String mobile = request.getParameter("mobile");
    		String email = request.getParameter("email");
    		String gender = request.getParameter("gender");
    		String address1 = request.getParameter("address1");
    		String address2 = request.getParameter("address2");
    		String city = request.getParameter("city");
    		String state = request.getParameter("state");
    		String country = request.getParameter("country");
    		String technologies = request.getParameter("technologies");
    		String contribute = request.getParameter("contribute");
    		String con_description = request.getParameter("con_description");
    		String tech_description = request.getParameter("tech_description");
    		String resume = request.getParameter("resume");
    		Date date = new Date();

    		if(name == null) {name = "";}
    		if(mobile == null) {mobile = "";}
    		if(email == null) {email = "";}
    		if(gender == null) {gender = "";}
    		if(address1 == null) {address1 = "";}
    		if(address2 == null) {address2 = "";}
    		if(city == null) {city = "";}
    		if(state == null) {state = "";}
    		if(country == null) {country = "";}
    		if(technologies == null) {technologies = "";}
    		if(contribute == null) {contribute = "";}
    		if(con_description == null) {con_description = "";}
    		if(tech_description == null) {tech_description = "";}
    		if(resume == null) {resume = "";}
    		
    		name = name.trim();
    		mobile = mobile.trim();
    		email = email.trim();
    		gender = gender.trim();
    		address1 = address1.trim();
    		address2 = address2.trim();
    		city = city.trim();
    		state = state.trim();
    		country = country.trim();
    		technologies = technologies.trim();
    		contribute = contribute.trim();
    		con_description = con_description.trim();
    		tech_description = tech_description.trim();
    		resume = resume.trim();
    		
    		Trainers trainers = new Trainers();
    		trainers.setName(name);
    		trainers.setMobile(mobile);
    		trainers.setEmail(email);
    		trainers.setGender(gender);
    		trainers.setAddress1(address1);
    		trainers.setAddress2(address2);
    		trainers.setCity(city);
    		trainers.setState(state);
    		trainers.setCountry(country);
    		trainers.setTechnologies(technologies);
    		trainers.setContribute(contribute);
    		trainers.setCon_description(con_description);
    		trainers.setTech_description(tech_description);
    		trainers.setDate(date);
    		trainers.setResume(resume);
 
    		boolean result = commonDAO.saveTrainers(trainers);
    		if(result) {
    			commonResponse.setStatus("SUCCESS");
    			commonResponse.setStatus_code(200);
    			writer.print(gson.toJson(commonResponse));
    			writer.close();
    			return;
    		} else {
    			commonResponse.setStatus("FAILURE");
    			commonResponse.setStatus_code(400);
    			writer.print(gson.toJson(commonResponse));
    			writer.close();
    			return;
    		}
   		}
		catch(Exception ex)
       	{
       		ex.printStackTrace();
       		
       		commonResponse.setStatus("FAILURE");
			commonResponse.setStatus_code(400);
			writer.print(gson.toJson(commonResponse));
			writer.close();
			return;
       	}
	}
	@RequestMapping(value="/saveContributor")
	public void saveContributor(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;	
		try 
   		{
			commonResponse = new CommonResponse();
    		gson = new Gson();	
    		
    		String name = request.getParameter("name");
    		String mobile = request.getParameter("mobile");
    		String email = request.getParameter("email");
    		String gender = request.getParameter("gender");
    		String address1 = request.getParameter("address1");
    		String address2 = request.getParameter("address2");
    		String city = request.getParameter("city");
    		String state = request.getParameter("state");
    		String country = request.getParameter("country");
    		String pincode = request.getParameter("pincode");
    		Date date = new Date();
    		String core_skills = request.getParameter("core_skills");
    		String experience = request.getParameter("experience");
    		String resume = request.getParameter("resume");
    		
    		Contributor contributor = new Contributor();
    		contributor.setName(name);
    		contributor.setMobile(mobile);
    		contributor.setEmail(email);
    		contributor.setGender(gender);
    		contributor.setAddress1(address1);
    		contributor.setAddress2(address2);
    		contributor.setCity(city);
    		contributor.setState(state);
    		contributor.setCountry(country);
    		contributor.setPincode(pincode);
    		contributor.setDate(date);
    		contributor.setCore_skills(core_skills);
    		contributor.setExperience(experience);
    		contributor.setResume(resume);  		
    		
    		boolean result = commonDAO.saveContributor(contributor);
    		if(result) {
    			commonResponse.setStatus("SUCCESS");
    			commonResponse.setStatus_code(200);
    			writer.print(gson.toJson(commonResponse));
    			writer.close();
    			return;
    		} else {
    			commonResponse.setStatus("FAILURE");
    			commonResponse.setStatus_code(400);
    			writer.print(gson.toJson(commonResponse));
    			writer.close();
    			return;
    		}
   		}
		catch(Exception ex)
       	{
       		ex.printStackTrace();
       		
       		commonResponse.setStatus("FAILURE");
			commonResponse.setStatus_code(400);
			writer.print(gson.toJson(commonResponse));
			writer.close();
			return;
       	}
	}
	
	@RequestMapping(value="/uploadCVDocument")
	public void uploadCVDocument(HttpServletRequest request, HttpServletResponse response) throws IOException 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = new CommonResponse();
		Gson gson = new Gson();
				
		try 
		{
        	String resume_mobile = "";
    		
			boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		    DiskFileItemFactory factory = new DiskFileItemFactory();
		    ServletFileUpload upload = new ServletFileUpload(factory);
	        try
	        { 
	           List fileItems = upload.parseRequest(request);
	           Iterator i = fileItems.iterator();
	           while ( i.hasNext () ) 
	           {
	              FileItem fi = (FileItem)i.next();
	              if (!fi.isFormField())	
	              {
	            	  System.out.println("resume_mobile--->"+resume_mobile);
	            	  
	            	 String file_name_original = fi.getName();
	            	 System.out.println("file_name_original--->"+file_name_original);
	            	 String extension = file_name_original.substring(file_name_original.lastIndexOf(".") + 1, file_name_original.length());
	            	 System.out.println("extension--->"+extension);
	            	 long timeMilli = new Date().getTime();
	            	 
					 System.out.println(timeMilli);
					 
	            	 String fileName = "resume_" + timeMilli + "."+extension;
	            	 System.out.println("fileName--->"+fileName);
	        		 String root_path = properties.getResumeDir();
	        		 System.out.println("root_path--->"+root_path);
	        		 String imagePath = ViewHelper.createFile(fi, root_path, fileName);
	        		 System.out.println("imagePath--->"+imagePath);
					
          		       commonResponse.setStatus_code(StatusMessage.SuccessCode);
	     	    	   commonResponse.setStatus(StatusMessage.SuccessMessage);
	     	    	   commonResponse.setMsg(fileName);	
	     	    	   writer.print(gson.toJson(commonResponse));
	     	    	   writer.close();
	     	    	   return;
	              }else
	              {
	            	  String fieldName = fi.getFieldName();
	            	  if(fieldName.equalsIgnoreCase("txt_resume_mobile"))
	            	  {
	            		  resume_mobile = fi.getString().trim();
	            	  }
	              }
	           }
	        }
	        catch(Exception ex)
	        {
				ex.printStackTrace();
				   commonResponse.setStatus_code(StatusMessage.FailureCode);
		    	   commonResponse.setStatus(StatusMessage.FailureMessage);
		    	   commonResponse.setMsg("File Upload Failure");	
		    	   writer.print(gson.toJson(commonResponse));
		    	   writer.close();
		    	   return;
	        }
		} 
		catch (Exception ex) 
		{
			ex.printStackTrace();
			   commonResponse.setStatus_code(StatusMessage.FailureCode);
	    	   commonResponse.setStatus(StatusMessage.FailureMessage);
	    	   commonResponse.setMsg("File Upload Failure");	
	    	   writer.print(gson.toJson(commonResponse));
	    	   writer.close();
	    	   return;
		}    
	}
	
	@RequestMapping(value="/uploadResume")
	public void uploadResume(HttpServletRequest request, HttpServletResponse response) throws IOException 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = new CommonResponse();
		Gson gson = new Gson();
				
		try 
		{
        	String jobs_mobile = "";
    		
			boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		    DiskFileItemFactory factory = new DiskFileItemFactory();
		    ServletFileUpload upload = new ServletFileUpload(factory);
	        try
	        { 
	           List fileItems = upload.parseRequest(request);
	           Iterator i = fileItems.iterator();
	           while ( i.hasNext () ) 
	           {
	              FileItem fi = (FileItem)i.next();
	              if (!fi.isFormField())	
	              {
	            	  System.out.println("jobs_mobile--->"+jobs_mobile);
	            	  
	            	 String file_name_original = fi.getName();
	            	 System.out.println("file_name_original--->"+file_name_original);
	            	 String extension = file_name_original.substring(file_name_original.lastIndexOf(".") + 1, file_name_original.length());
	            	 System.out.println("extension--->"+extension);
	            	 long timeMilli = new Date().getTime();

	            	 String fileName = "resume_" + timeMilli + "."+extension;
	            	 System.out.println("fileName--->"+fileName);
	        		 String root_path = properties.getResumeDir();
	        		 System.out.println("root_path--->"+root_path);
	        		 String imagePath = ViewHelper.createFile(fi, root_path, fileName);
	        		 System.out.println("imagePath--->"+imagePath);
					
          		       commonResponse.setStatus_code(StatusMessage.SuccessCode);
	     	    	   commonResponse.setStatus(StatusMessage.SuccessMessage);
	     	    	   commonResponse.setMsg(fileName);	
	     	    	   writer.print(gson.toJson(commonResponse));
	     	    	   writer.close();
	     	    	   return;
	              }else
	              {
	            	  String fieldName = fi.getFieldName();
	            	  if(fieldName.equalsIgnoreCase("txt_resume_mobile"))
	            	  {
	            		  jobs_mobile = fi.getString().trim();
	            	  }
	              }
	           }
	        }
	        catch(Exception ex)
	        {
				ex.printStackTrace();
				   commonResponse.setStatus_code(StatusMessage.FailureCode);
		    	   commonResponse.setStatus(StatusMessage.FailureMessage);
		    	   commonResponse.setMsg("File Upload Failure");	
		    	   writer.print(gson.toJson(commonResponse));
		    	   writer.close();
		    	   return;
	        }
		} 
		catch (Exception ex) 
		{
			ex.printStackTrace();
			   commonResponse.setStatus_code(StatusMessage.FailureCode);
	    	   commonResponse.setStatus(StatusMessage.FailureMessage);
	    	   commonResponse.setMsg("File Upload Failure");	
	    	   writer.print(gson.toJson(commonResponse));
	    	   writer.close();
	    	   return;
		}    
	}
	
	@RequestMapping(value="/saveLeads")
	public void saveLeads(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{		
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;	
    	try 
   		{
    		commonResponse = new CommonResponse();
    		gson = new Gson();
    		
    		String name = request.getParameter("name");
    		String mobile = request.getParameter("mobile");
    		String email = request.getParameter("email");
    		String course = request.getParameter("course");
    		String device_name = request.getHeader("User-Agent");
    		String ipAddress = request.getHeader("X-FORWARDED-FOR");  
			
    		if (ipAddress == null) {  
			    ipAddress = request.getRemoteAddr();  
			}
    		
    		/*String dev_ops_path = request.getServletContext().getRealPath("") + "resources" + File.separator + "landing-pages" + File.separator + "pdf" + File.separator + "THIS-DevOps-Mastery_v1.1.pdf";
    		String machine_ln_path = request.getServletContext().getRealPath("") + "resources" + File.separator + "landing-pages" + File.separator + "pdf" + File.separator + "THIS-ML-Mastery_v1.0.pdf";
    		String data_science_path = request.getServletContext().getRealPath("") + "resources" + File.separator + "landing-pages" + File.separator + "pdf" + File.separator + "THIS-DS-PA-Mastery_v1.0.pdf";
    		String data_science_new_path = request.getServletContext().getRealPath("") + "resources" + File.separator + "landing-pages" + File.separator + "pdf" + File.separator + "TEKS-RISE-BROCHURE_V10.pdf";
    		String Deep_Learning_CNN = request.getServletContext().getRealPath("") + "resources" + File.separator + "landing-pages" + File.separator + "pdf" + File.separator + "Deep-Learning-CNN.pdf";*/
    		
    		String domain = properties.getHostDomainUrl();
    		String path = "resources/landing-pages/pdf/";
    		
    		String devOpsPDF = domain+path+"THIS-DevOps-Mastery_v1.1.pdf";
    		String machineLnPDF = domain+path+"THIS-ML-Mastery_v1.0.pdf";
    		String dataSciencePDF = domain+path+"THIS-DS-PA-Mastery_v1.0.pdf";
    		String dataScienceNewPDF = domain+path+"TEKS-RISE-BROCHURE_V10.pdf";
    		String deepLnPDF = domain+path+"Deep-Learning-CNN.pdf";
    		
    		if(course.equalsIgnoreCase("DevOps Mastery Program")) {
    			sendEmailUtil.sendCourseBroucherFromLandingPage(name, email , "Please find the attached Brochure", "Teksands - Brochure", devOpsPDF);
    		}
    		
    		if(course.equalsIgnoreCase("Machine Learning Mastery using Python")) {
    			sendEmailUtil.sendCourseBroucherFromLandingPage(name, email, "Please find the attached Brochure", "Teksands - Brochure", machineLnPDF);
    		}
    		
    		if(course.equalsIgnoreCase("Data Science and Predictive Analytics Mastery using Python")) {
    			sendEmailUtil.sendCourseBroucherFromLandingPage(name, email, "Please find the attached Brochure", "Teksands - Brochure", dataSciencePDF);
    		}
    		
    		if(course.equalsIgnoreCase("Post Graduate Program on Applied Data Science with Deep Learning and Specialisation")) {
    			sendEmailUtil.sendCourseBroucherFromLandingPage(name, email, "Please find the attached Brochure", "Teksands - Brochure", dataScienceNewPDF);
    		}
    		
    		if(course.equalsIgnoreCase("Deep Learning - CNN for Image Processing using TensorFlow and Keras")) {
    			sendEmailUtil.sendCourseBroucherFromLandingPage(name, email, "Please find the attached Brochure", "Teksands - Brochure", deepLnPDF);
    		}
    		
    		Leads leads = new Leads();
			leads.setName(name);
			leads.setMobile(mobile);
			leads.setEmail(email);
			leads.setDate(new Date());
			leads.setCourse(course);
			leads.setDevice_name(device_name);
			leads.setIp_address(ipAddress);
			
			boolean result = commonDAO.saveLeads(leads);
    		if(result) {
    			commonResponse.setStatus("SUCCESS");
    			commonResponse.setStatus_code(200);
    			writer.print(gson.toJson(commonResponse));
    			writer.close();
    			return;
    		} else {
    			commonResponse.setStatus("FAILURE");
    			commonResponse.setStatus_code(400);
    			writer.print(gson.toJson(commonResponse));
    			writer.close();
    			return;
    		}
   		}
       	catch(Exception ex)
       	{
       		ex.printStackTrace();
       		
       		commonResponse.setStatus("FAILURE");
			commonResponse.setStatus_code(400);
			writer.print(gson.toJson(commonResponse));
			writer.close();
			return;
       	}
	}
	
	@RequestMapping(value="/saveCareer")
	public void saveCareer(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;	
		try 
   		{
			commonResponse = new CommonResponse();
    		gson = new Gson();	
    		
    		String name = request.getParameter("name");
    		String mobile = request.getParameter("mobile");
    		String email = request.getParameter("email");
    		String gender = request.getParameter("gender");
    		String address1 = request.getParameter("address1");
    		String address2 = request.getParameter("address2");
    		String city = request.getParameter("city");
    		String state = request.getParameter("state");
    		String country = request.getParameter("country");
    		String pincode = request.getParameter("pincode");
    		String core_skills = request.getParameter("core_skills");
    		String experience = request.getParameter("experience");
    		String role = request.getParameter("role");
    		String resume = request.getParameter("resume");
    		
    		Career career = new Career();
    		career.setName(name);
    		career.setMobile(mobile);
    		career.setEmail(email);
    		career.setGender(gender);
    		career.setAddress1(address1);
    		career.setAddress2(address2);
    		career.setCity(city);
    		career.setState(state);
    		career.setCountry(country);
    		career.setPincode(pincode);
    		career.setDate(new Date());
    		career.setCore_skills(core_skills);
    		career.setExperience(experience);
    		career.setResume(resume); 
    		career.setRole(role);
    		
    		boolean result = commonDAO.saveCareer(career);
    		
    		if(result) {
    			commonResponse.setStatus("SUCCESS");
    			commonResponse.setStatus_code(200);
    			writer.print(gson.toJson(commonResponse));
    			writer.close();
    			return;
    		} else {
    			commonResponse.setStatus("FAILURE");
    			commonResponse.setStatus_code(400);
    			writer.print(gson.toJson(commonResponse));
    			writer.close();
    			return;
    		}
   		}
		catch(Exception ex)
       	{
       		ex.printStackTrace();
       		
       		commonResponse.setStatus("FAILURE");
			commonResponse.setStatus_code(400);
			writer.print(gson.toJson(commonResponse));
			writer.close();
			return;
       	}
	}
	@RequestMapping(value="/saveInternship")
	public void saveInternship(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;	
		try 
   		{
			commonResponse = new CommonResponse();
    		gson = new Gson();	
    		
    		String first_name = request.getParameter("first_name");
    		String last_name = request.getParameter("last_name");
    		String mobile = request.getParameter("mobile");
    		String email = request.getParameter("email");
    		String skills = request.getParameter("skills");
    		String college = request.getParameter("college");
    		String resume = request.getParameter("resume");
    		String description = request.getParameter("description");
    		
    		Internship internship = new Internship();
    		internship.setFirst_name(first_name);
    		internship.setLast_name(last_name);
    		internship.setMobile(mobile);
    		internship.setEmail(email);
    		internship.setDate(new Date());
    		internship.setCollege(college);
    		internship.setSkills(skills);
    		internship.setResume(resume);
    		internship.setDescription(description);
    		
    		boolean result = commonDAO.saveInternships(internship);
    		if(result) {
    			commonResponse.setStatus("SUCCESS");
    			commonResponse.setStatus_code(200);
    			writer.print(gson.toJson(commonResponse));
    			writer.close();
    			return;
    		} else {
    			commonResponse.setStatus("FAILURE");
    			commonResponse.setStatus_code(400);
    			writer.print(gson.toJson(commonResponse));
    			writer.close();
    			return;
    		}
   		}
		catch(Exception ex)
       	{
       		ex.printStackTrace();
       		
       		commonResponse.setStatus("FAILURE");
			commonResponse.setStatus_code(400);
			writer.print(gson.toJson(commonResponse));
			writer.close();
			return;
       	}
	}

	@RequestMapping(value="/saveLiftOffContact")
	public void saveLiftOffContact(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;	
		try 
   		{
			commonResponse = new CommonResponse();
    		gson = new Gson();	
    		
    		String name = request.getParameter("name");
    		String mobile = request.getParameter("mobile");
    		String email = request.getParameter("email");
    		String company = request.getParameter("company");
    		String enquiry_type = request.getParameter("enquiry_type");
    		String requirement = request.getParameter("requirement");
    		
    		if(name == null) {name = "";}
    		if(mobile == null) {mobile = "";}
    		if(email == null) {email = "";}
    		if(company == null) {company = "";}
    		if(enquiry_type == null) {enquiry_type = "";}
    		if(requirement == null) {requirement = "";}
    		
    		
    		name = name.trim();
    		mobile = mobile.trim();
    		email = email.trim();
    		company = company.trim();
    		enquiry_type = enquiry_type.trim();
    		requirement = requirement.trim();
    		
    		HomeEnquiry contacts = new HomeEnquiry();
    		contacts.setName(name);
    		contacts.setEmail(email);
    		contacts.setMobile(mobile);
    		contacts.setCompany(company);
    		contacts.setEnquiry_type(enquiry_type);
    		if(!requirement.isEmpty())
    		{
    			contacts.setRequirement(requirement);	
    		}
    		contacts.setSubmitted_date(new Date());
    		contacts.setActive(true);
    		
    		boolean result = commonDAO.saveLiftOffContact(contacts);
    		
    		if(Utils.validateEmail(email)) {
    			sendEmailUtil.sendAckenowledgementEmailToEnquirer(name,email);
    		}
    		
    		if(Utils.validateEmail(email)) {
    			sendEmailUtil.sendLeadsEmailToAdmin(name,company,email,mobile,enquiry_type);
    		}
    		
    		if(result) {
    			commonResponse.setStatus("SUCCESS");
    			commonResponse.setStatus_code(200);
    			writer.print(gson.toJson(commonResponse));
    			writer.close();
    			return;
    		} else {
    			commonResponse.setStatus("FAILURE");
    			commonResponse.setStatus_code(400);
    			writer.print(gson.toJson(commonResponse));
    			writer.close();
    			return;
    		}
   		}
		catch(Exception ex)
       	{
       		ex.printStackTrace();
       		
       		commonResponse.setStatus("FAILURE");
			commonResponse.setStatus_code(400);
			writer.print(gson.toJson(commonResponse));
			writer.close();
			return;
       	}
	}
}
