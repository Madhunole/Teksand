package com.teksands.user.controller;


import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.hibernate.internal.util.StringHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.teksands.admin.dao.AdminDAO;
import com.teksands.bootcamp.model.CmsUser;
import com.teksands.bootcamp.model.Log;
import com.teksands.user.model.Users;
import com.teksands.user.response.CommonResponse;
import com.teksands.utils.Utils;


@Controller
public class LoginController {
	
	@Autowired
	AdminDAO adminDAO;
	
	@RequestMapping(value="/validateLogin")
	public void validateLogin(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{		
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;
		Users user = null;
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
    			user = adminDAO.getUserByEmail(email);
    		}
    		
    		if(user != null) 
    		{
    			String enc_pass = user.getPassword_encrypted();
    			String user_pass = Utils.DecodeString(enc_pass);
    			
    			if(user_pass.equalsIgnoreCase(password)) 
    			{
    				HashMap<String, String> accountMap = new HashMap<String, String>();
        			accountMap.put("email", email);
        			accountMap.put("name", user.getName());
        			request.getSession().setAttribute("accountMap", accountMap);
        			
        			commonResponse.setStatus("SUCCESS");
        			commonResponse.setStatus_code(200);
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
	
	/*@RequestMapping(value="/validateLogin")
	public void validateLogin(HttpServletRequest request, HttpServletResponse response) throws Exception 
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
    		System.out.println("email  = " + email);
    		
    		String password = request.getParameter("password");
    		System.out.println("password = "+ password);
    		
    		String enc_pass = Utils.EncodeString(password);
    		
    		Users users = new Users();
    		users.setEmail(email);
    		users.setPassword_encrypted(enc_pass);
    		
    		Users user = adminDAO.ValidateLogin(email, enc_pass);
    		
    		if(user != null) 
    		{
    			HashMap<String, String> accountMap = new HashMap<String, String>();
    			accountMap.put("email", email);
    			accountMap.put("name", user.getName());
    			request.getSession().setAttribute("accountMap", accountMap);
    			
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
	}*/
	
	@RequestMapping(value="/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		try
		{
			@SuppressWarnings("unchecked")
			HashMap<String, String> accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null)
			{	        	
				request.getSession().invalidate();
			}			
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "user.login";
	}
}
