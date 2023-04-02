package com.teksands.bootcamp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.internal.util.StringHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;
import com.teksands.bootcamp.dao.CandidateDAO;
import com.teksands.bootcamp.dao.LogDAO;
import com.teksands.bootcamp.model.CmsUser;
import com.teksands.bootcamp.model.Log;
import com.teksands.user.response.CommonResponse;
import com.teksands.utils.Properties;
import com.teksands.utils.SendEmailUtil;
import com.teksands.utils.Utils;

import org.apache.commons.lang.StringUtils;

@Controller
@RequestMapping("/bootcamp")
public class AuthController {
	
	@Autowired
	CandidateDAO candidateDAO;
	
	@Autowired
	LogDAO logDAO;
	
	@Autowired
	SendEmailUtil sendEmailUtil;
	
	@Autowired
	Properties properties;
	
	@RequestMapping({ "", "/", "/bootcamp" })
	public String root(HttpServletRequest request, HttpServletResponse response) throws Exception {
		try {

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return "bootcamp.login";
	}
	
	@RequestMapping(value="/validateLogin")
	public void validateLogin(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{		
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;
		CmsUser user = null;
		try 
   		{
    		commonResponse = new CommonResponse();
    		gson = new Gson();	
    		
    		String email = request.getParameter("email");
    		String password = request.getParameter("password");
    		
    		if(email == null) {email = "";}
    		if(password == null) {password = "";}
    		
    		email = email.trim();
    		password = password.trim();
    		
    		if(StringHelper.isEmpty(email) || email == null  || StringUtils.isBlank(email) || StringUtils.isEmpty(email)) 
    		{
    			commonResponse.setStatus("FAILURE");
    			commonResponse.setStatus_code(400);
    			commonResponse.setMsg("Email Cannot Be Empty");
    			writer.print(gson.toJson(commonResponse));
    			writer.close();
    			return;
    		}
    		
    		
    		if(!Utils.validateEmail(email)) 
    		{
    			commonResponse.setStatus("FAILURE");
    			commonResponse.setStatus_code(400);
    			commonResponse.setMsg("Email is Not a Valid");
    			writer.print(gson.toJson(commonResponse));
    			writer.close();
    			return;
    		}
    		
    		if(StringHelper.isEmpty(password) || password == null || StringUtils.isBlank(password) || StringUtils.isEmpty(password)) 
    		{
    			commonResponse.setStatus("FAILURE");
    			commonResponse.setStatus_code(400);
    			commonResponse.setMsg("Password Cannot Be Empty");
    			writer.print(gson.toJson(commonResponse));
    			writer.close();
    			return;
    		}
    		
    		if(!email.isEmpty()) 
    		{
    			user = candidateDAO.getUserByEmail(email);
    		}
    		
    		if(user != null) 
    		{
    			String enc_pass = user.getPassword_encrypted();
    			String user_pass = Utils.DecodeString(enc_pass);
    			
    			if(user_pass.equalsIgnoreCase(password)) 
    			{
    				if(user.getActive().equals(false)) 
    	    		{
    	    			commonResponse.setStatus("FAILURE");
    	    			commonResponse.setStatus_code(400);
    	    			commonResponse.setMsg("Your Account was deactivated, please contact your admin");
    	    			writer.print(gson.toJson(commonResponse));
    	    			writer.close();
    	    			return;
    	    		}
    				
    				HashMap<String, String> accountMap = new HashMap<String, String>();
        			accountMap.put("user_id", user.getId().toString());
        			accountMap.put("user_email", user.getEmail());
        			accountMap.put("user_name", user.getName());
        			accountMap.put("user_type_id", user.getUser_type_id().toString());
        			accountMap.put("user_type", user.getUser_type());
        		
        			request.getSession().setAttribute("accountMap", accountMap);
        			
        			Log log = new Log();
        			log.setUser_id(user.getId());
        			log.setUser_name(user.getName());
        			log.setTitle("User Loginned");
        			log.setDescription(user.getName()+" has logined to the CMS system");
        			log.setActivity_time(new Date());
        			String ipAddr = Utils.getIpAddr(request);
        			if(ipAddr == null){ipAddr="";}
        			log.setIp_addr(ipAddr);
        			logDAO.saveLog(log);
        			
        			commonResponse.setStatus("SUCCESS");
        			commonResponse.setStatus_code(200);
        			commonResponse.setMsg("You Are Successfully LoggedIn");
        			commonResponse.setUser_type_id(user.getUser_type_id());
        			writer.print(gson.toJson(commonResponse));
        			writer.close();
        			return;
        			
    			}else {
    				commonResponse.setStatus("FAILURE");
        			commonResponse.setStatus_code(400);
        			commonResponse.setMsg("Password Not Valid, Please Check your Password");
        			writer.print(gson.toJson(commonResponse));
        			writer.close();
        			return;
    			}
    			
    		}else {
    			commonResponse.setStatus("FAILURE");
    			commonResponse.setStatus_code(400);
    			commonResponse.setMsg("Email Not Register With Us, Please Check your Email");
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
			commonResponse.setMsg("User Connot Be Found");
			writer.print(gson.toJson(commonResponse));
			writer.close();
			return;
       	}
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		try
		{	
			@SuppressWarnings("unchecked")
			HashMap<String, String> accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null)
			{	  
				request.getSession().invalidate();
				response.setHeader("Cache-Control","no-cache"); 
		        response.setDateHeader("Expires", 0);
		        response.setHeader("Pragma","no-cache"); 
				request.setAttribute("loginStatus", "loggedOut");
			}
			request.setAttribute("page", "logout");
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "bootcamp.logout";
	}
	
	@RequestMapping(value="/validateSignup")
	public void validateSignup(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{		
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;	
    	try 
   		{
    		commonResponse = new CommonResponse();
    		gson = new Gson();	
    		
    		String email = request.getParameter("email");
    		String password = request.getParameter("password");
    		
    		String enc_pass = Utils.EncodeString(password);
    		
    		CmsUser cmsUsers = new CmsUser();
    		cmsUsers.setEmail(email);
    		cmsUsers.setPassword_encrypted(enc_pass);
    		
    		CmsUser cmsUser = candidateDAO.ValidateLogin(email, password);
    		if(cmsUser != null) {
    			HashMap<String, String> accountMap = new HashMap<String, String>();
    			accountMap.put("cms_user_id", cmsUser.getId().toString());
    			accountMap.put("cms_user_email", email);
    			accountMap.put("cms_user_name", cmsUser.getName());
    			accountMap.put("cms_user_type_id", cmsUser.getUser_type_id().toString());
    			accountMap.put("cms_user_type", cmsUser.getUser_type());
   			
    			request.getSession().setAttribute("accountMap", accountMap);
    			
    			commonResponse.setStatus("SUCCESS");
    			commonResponse.setStatus_code(200);
    			commonResponse.setMsg("Success");
    			commonResponse.setUser_type_id(cmsUser.getUser_type_id());
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
	
	@RequestMapping(value="/changePassword", method=RequestMethod.POST)
	public void changePassword(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = new CommonResponse();
		Gson gson = new Gson();
		
		HashMap<String, String> accountMap = null;
		try
		{	
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null) {
				
				String user_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				
				String old_password = request.getParameter("old_password");
				String new_password = request.getParameter("new_password");
				
				if(old_password == null){old_password = "";};
				if(new_password == null){new_password = "";};
				
				old_password = old_password.trim();
				new_password = new_password.trim();
				
				if(StringHelper.isEmpty(old_password) || StringHelper.isEmpty(new_password))
				{
	    			commonResponse.setStatus("FAILURE");
	    			commonResponse.setStatus_code(400);
	    			commonResponse.setMsg("Please Enter the Valid Old Password");
	    			writer.print(gson.toJson(commonResponse));
	    			writer.close();
	    			return;
				}
				
				CmsUser user = candidateDAO.getUserById(Integer.parseInt(user_id));
				
	    		if(user == null)
	    		{
	    			commonResponse.setStatus("FAILURE");
	    			commonResponse.setStatus_code(400);
	    			commonResponse.setMsg("User not registered with us");
	    			writer.print(gson.toJson(commonResponse));
	    			writer.close();
	    			return;
	    		}
	    		
	    		String enc_pass = user.getPassword_encrypted();
	    		String dec_pass = Utils.DecodeString(enc_pass);
				
	    		if(dec_pass.equalsIgnoreCase(old_password))
				{
	    			candidateDAO.changePassword(user_id, new_password);
	    			
	    			Log log = new Log();
			 		log.setUser_id((user.getId()));
			 		log.setUser_name(user.getName());
			 		log.setTitle("User Login");
			 		log.setDescription(user.getName() + " was resetted the password at " + new Date());
			 		log.setActivity_time(new Date());
			 		String ipAddr = Utils.getIpAddr(request);
					if(ipAddr == null){ipAddr="";}
			 		log.setIp_addr(ipAddr);
			 		logDAO.saveLog(log);
	    			
	    			commonResponse.setStatus("SUCCESS");
	    			commonResponse.setStatus_code(200);
	    			commonResponse.setMsg("Your Password Changed Successfully");
	    			writer.print(gson.toJson(commonResponse));
	    			writer.close();
	    			return;

				}
				else
				{
					commonResponse.setStatus("FAILURE");
	    			commonResponse.setStatus_code(400);
	    			commonResponse.setMsg("Old Password does not match please check and try again");
	    			writer.print(gson.toJson(commonResponse));
	    			writer.close();
	    			return;
				}
			}
			else {
				response.sendRedirect("/home");
			}
		}

		catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}
	
	@RequestMapping(value="/addUser", method=RequestMethod.POST)
	public void addUser(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = new CommonResponse();
		Gson gson = new Gson();
		
		HashMap<String, String> accountMap = null;
		try
		{	
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_id").equalsIgnoreCase(Utils.adminId.toString()))) {
				
				String user_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				
				String name = request.getParameter("name");
				String email = request.getParameter("email");
				String mobile = request.getParameter("mobile");
				String password = request.getParameter("password");
				String user_id_type = request.getParameter("user_type_id");
				
				if(name == null){name = "";};
				if(email == null){email = "";};
				if(mobile == null){mobile = "";};
				if(password == null){password = "";};
				if(user_id_type == null){user_id_type = "";};
				
				name = name.trim();
				email = email.trim();
				mobile = mobile.trim();
				password = password.trim();
				user_id_type = user_id_type.trim();
				
				
				if(!email.isEmpty() || !mobile.isEmpty()) 
	    		{
					boolean result = candidateDAO.checkIfMobileEmailAlreadyExist(mobile, email);
		    		if(!result) 
		    		{
		    			commonResponse.setStatus("FAILURE");
		    			commonResponse.setStatus_code(400);
		    			commonResponse.setMsg("This Email or Mobile already exists");
		    			writer.print(gson.toJson(commonResponse));
		    			writer.close();
		    			return;
		    		}
	    		}
	    		
				String user_type = "";
				
				if(user_id_type.equalsIgnoreCase("2")) {
					user_type = "Mentor";
				}else if(user_id_type.equalsIgnoreCase("3")){
					user_type = "Cordinator";
				}else if(user_id_type.equalsIgnoreCase("4")) {
					user_type = "Client Manager";
				}
				
				String enc_pass = Utils.EncodeString(password);

				CmsUser user = new CmsUser();
				user.setName(name);
				user.setEmail(email);
				user.setMobile(mobile);
				user.setPassword_encrypted(enc_pass);
				user.setUser_type(user_type);
				user.setUser_type_id(Integer.parseInt(user_id_type));
				user.setCreated_date(new Date());
				user.setActive(true);
				
				candidateDAO.saveOrUpdateCmsUser(user);
				
				String domain_url = properties.getHostDomainUrl();
				String bootcamp_url = "bootcamp";
				
				String login_url = domain_url+ bootcamp_url;
				
				System.out.println(login_url);
				
				sendEmailUtil.sendUserEmailAndPassword(name, email, password, login_url);
				
				Log log = new Log();
		 		log.setUser_id(Integer.parseInt(user_id));
		 		log.setUser_name(user_name);
		 		log.setTitle("Admin Created the New User");
		 		log.setDescription(user_name + " has created the new user ("+name+")");
		 		log.setActivity_time(new Date());
		 		String ipAddr = Utils.getIpAddr(request);
				if(ipAddr == null){ipAddr="";}
		 		log.setIp_addr(ipAddr);
		 		logDAO.saveLog(log);
				
				commonResponse.setStatus("SUCCESS");
    			commonResponse.setStatus_code(200);
    			commonResponse.setMsg("The New User was created Successfully and Login Credential Sent.");
    			writer.print(gson.toJson(commonResponse));
    			writer.close();
    			return;
			}
			else {
				response.sendRedirect("/home");
			}
		}

		catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}
}
