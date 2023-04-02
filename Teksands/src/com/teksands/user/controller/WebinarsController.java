package com.teksands.user.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.teksands.user.dao.WebinarsDAO;
import com.teksands.user.model.Blogs;
import com.teksands.user.model.Ebooks;
import com.teksands.user.model.EbooksDownload;
import com.teksands.user.model.WebinarContacts;
import com.teksands.user.model.Webinars;
import com.teksands.user.response.CommonResponse;


@Controller
public class WebinarsController {
	
	@Autowired
	WebinarsDAO webinarsDAO;
	
	@RequestMapping(value="/webinars")
	public String webinars(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		try
		{	
			String pageid = request.getParameter("pageid");
			
			if(pageid == null){pageid = "1";}
			
			request.setAttribute("pageid", pageid);
			
			int page_id = Integer.parseInt(pageid);
			
			List<Webinars> webinarsActiveList = webinarsDAO.getActiveWebnars(5);
			request.setAttribute("webinarsActiveList", webinarsActiveList);
			
			List<Webinars> inactivewebinarList = webinarsDAO.getInActiveWebnars(Integer.parseInt(pageid));
			request.setAttribute("inactivewebinarList", inactivewebinarList);

			String webinarcategory2 = "Data Science";
			String webinarcategory3 = "Machine Learning";
			String webinarcategory4 = "DevOps";
			String webinarcategory5 = "Deep Learning";
            
            List<Webinars> webinar_category1 = webinarsDAO.getWebinarsByPageId((page_id - 1));
            request.setAttribute("webinar_category1", webinar_category1);
            
            List<Webinars> webinar_category2 = webinarsDAO.getAllWebinarsByPageId((page_id - 1), webinarcategory2);
            request.setAttribute("webinar_category2", webinar_category2);
            
            List<Webinars> webinar_category3 = webinarsDAO.getAllWebinarsByPageId((page_id - 1), webinarcategory3);
            request.setAttribute("webinar_category3", webinar_category3);
            
            List<Webinars> webinar_category4 = webinarsDAO.getAllWebinarsByPageId((page_id - 1), webinarcategory4);
            request.setAttribute("webinar_category4", webinar_category4);
            
            List<Webinars> webinar_category5 = webinarsDAO.getAllWebinarsByPageId((page_id - 1), webinarcategory5);
            request.setAttribute("webinar_category5", webinar_category5);
			
			request.setAttribute("page", "webinars");
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "user.webinars";
	}
	@RequestMapping(value="/webinars-registration")
	public String webinars_registration(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		try
		{	
			request.setAttribute("page", "webinars-registration");
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "user.webinars.registration";
	}
	@RequestMapping(value="/saveWebinars")
	public void saveWebinars(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;	
		try 
   		{
			commonResponse = new CommonResponse();
    		gson = new Gson();	
    		
    		String webinarId = request.getParameter("webinarId");
    		String name = request.getParameter("name");
    		String mobile = request.getParameter("mobile");
    		String email = request.getParameter("email");
    		
    		Webinars webinars = webinarsDAO.getWebinarsbyId(Integer.parseInt(webinarId));
    		
    		WebinarContacts webinarContacts = new WebinarContacts();
    		webinarContacts.setName(name);
    		webinarContacts.setMobile(mobile);
    		webinarContacts.setEmail(email);
    		webinarContacts.setDate(new Date());
    		webinarContacts.setWebinar_name(webinars.getTitle());
    		
    		boolean result = webinarsDAO.saveWebinarsContacts(webinarContacts);
    		
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
	@RequestMapping(value="/webinarRegistration")
	public void webinarRegistration(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;	
		try 
   		{
			commonResponse = new CommonResponse();
    		gson = new Gson();	
    		
    		String webinar = request.getParameter("webinar");
    		String name = request.getParameter("name");
    		String mobile = request.getParameter("mobile");
    		String email = request.getParameter("email");
    		
    		WebinarContacts webinarContacts = new WebinarContacts();
    		webinarContacts.setName(name);
    		webinarContacts.setMobile(mobile);
    		webinarContacts.setEmail(email);
    		webinarContacts.setDate(new Date());
    		webinarContacts.setWebinar_name(webinar);
    		
    		boolean result = webinarsDAO.saveWebinarsContacts(webinarContacts);
    		
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
