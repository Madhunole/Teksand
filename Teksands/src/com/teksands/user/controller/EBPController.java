package com.teksands.user.controller;

import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.teksands.user.dao.CommonDAO;
import com.teksands.user.dao.EbpDAO;
import com.teksands.user.model.Career;
import com.teksands.user.model.Contactus;
import com.teksands.user.model.CorporateEnquiry;
import com.teksands.user.model.Countries;
import com.teksands.user.model.EBPCandidate;
import com.teksands.user.model.EbpEmails;
import com.teksands.user.model.Mentors;
import com.teksands.user.model.Trainers;
import com.teksands.user.response.CommonResponse;

@Controller
public class EBPController {
	
	@Autowired
	EbpDAO ebpDAO;
	
	@Autowired
	CommonDAO commonDAO;
	
	@RequestMapping("/mentor-registration")
	public String mentor_registration(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		try
		{	
			List<Countries> countriesList = commonDAO.getCountries();
			request.setAttribute("countries", countriesList);
			
			request.setAttribute("page", "mentor-registration");
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "user.mentor.registration";
	}
 	
 	@RequestMapping("/corporate-enquiry")
	public String corporate_enquiry(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		try
		{	
			
			request.setAttribute("page", "corporate-enquiry");
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "user.corporate.enquiry";
	}
 	
 	@RequestMapping("/ebp-candidate-application")
	public String ebp_candidate_application(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		try
		{	
			List<Countries> countriesList = commonDAO.getCountries();
			request.setAttribute("countries", countriesList);
			
			request.setAttribute("page", "ebp-candidate-application");
			
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "user.ebp.candidate.application";
	}
 	
 	@RequestMapping(value="/saveCorporateEnquiry")
	public void saveCorporateEnquiry(HttpServletRequest request, HttpServletResponse response) throws Exception 
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
    		String requirements = request.getParameter("requirements");
    		
    		CorporateEnquiry corporateEnquiry = new CorporateEnquiry();
    		corporateEnquiry.setName(name);
    		corporateEnquiry.setEmail(email);
    		corporateEnquiry.setMobile(mobile);
    		corporateEnquiry.setDate(new Date());
    		corporateEnquiry.setCompany(company);
    		corporateEnquiry.setRequirements(requirements);
    		
    		boolean result = ebpDAO.saveCorporateEnquiry(corporateEnquiry);
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
 	@RequestMapping(value="/saveMentor")
	public void saveMentor(HttpServletRequest request, HttpServletResponse response) throws Exception 
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
    		String con_description = request.getParameter("con_description");
    		String tech_description = request.getParameter("tech_description");
    		String linkedin_url = request.getParameter("linkedin_url");


    		Mentors mentors = new Mentors();
    		mentors.setName(name);
    		mentors.setMobile(mobile);
    		mentors.setEmail(email);
    		mentors.setGender(gender);
    		mentors.setAddress1(address1);
    		mentors.setAddress2(address2);
    		mentors.setCity(city);
    		mentors.setState(state);
    		mentors.setCountry(country);
    		mentors.setTechnologies(technologies);
    		mentors.setCon_description(con_description);
    		mentors.setTech_description(tech_description);
    		mentors.setDate(new Date());
    		mentors.setLinkedin_url(linkedin_url);
    		
 
    		boolean result = ebpDAO.saveMentors(mentors);
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
 	
 	@RequestMapping(value="/saveEbpCandidate")
	public void saveEbpCandidate(HttpServletRequest request, HttpServletResponse response) throws Exception 
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
    		String year_passing = request.getParameter("year_passing");
    		String qualification = request.getParameter("qualification");
    		String position = request.getParameter("position");
    		String skills = request.getParameter("skills");
    		String experience = request.getParameter("experience");
    		String description = request.getParameter("description");
    		String college = request.getParameter("college");
    		String resume = request.getParameter("resume");
    		String linkedin_url = request.getParameter("linkedin_url");


    		EBPCandidate ebpCandidate = new EBPCandidate();
    		ebpCandidate.setName(name);
    		ebpCandidate.setMobile(mobile);
    		ebpCandidate.setEmail(email);
    		ebpCandidate.setGender(gender);
    		ebpCandidate.setAddress1(address1);
    		ebpCandidate.setAddress2(address2);
    		ebpCandidate.setCity(city);
    		ebpCandidate.setState(state);
    		ebpCandidate.setCountry(country);
    		ebpCandidate.setPincode(pincode);
    		ebpCandidate.setDate(new Date());
    		ebpCandidate.setYear_passing(year_passing);
    		ebpCandidate.setQualification(qualification);
    		ebpCandidate.setPosition(position);
    		ebpCandidate.setCore_skills(skills);
    		ebpCandidate.setExperience(experience);
    		ebpCandidate.setDescription(description);
    		ebpCandidate.setCollege(college);
    		ebpCandidate.setResume(resume); 
    		ebpCandidate.setLinkedin_url(linkedin_url);
    		
    		boolean result = ebpDAO.saveEbpCandidate(ebpCandidate);
    		
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
 	
 	@RequestMapping(value="/saveEBPMails")
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
    		
    		String email = request.getParameter("email");
    		
    		Date date = new Date();
    		
    		EbpEmails EbpEmails = new EbpEmails();
    		EbpEmails.setEmail(email);
    		EbpEmails.setDate(date);
    		
    		boolean result = ebpDAO.saveEmails(EbpEmails);
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
 	
 	@RequestMapping(value="/saveEBPContact")
	public void saveEBPContact(HttpServletRequest request, HttpServletResponse response) throws Exception 
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
    		String email = request.getParameter("email");
    		String mobile = request.getParameter("mobile");
    		String company = request.getParameter("company");
    		
    		if(name == null) {name = "";}
    		if(email == null) {email = "";}
    		if(mobile == null) {mobile = "";}
    		if(company == null) {company = "";}
    		
    		name = name.trim();
    		email = email.trim();
    		mobile = mobile.trim();
    		company = company.trim();
    		
    		if(name == "" || email == "" || mobile == "" || company == "") 
    		{
    			commonResponse.setStatus("FAILURE");
    			commonResponse.setStatus_code(400);
    			commonResponse.setMsg("All the fields are Mandatory");
    			writer.print(gson.toJson(commonResponse));
    			writer.close();
    			return;
    		}
    		
    		EbpEmails ebpEmails = new EbpEmails();
    		ebpEmails.setName(name);
    		ebpEmails.setEmail(email);
    		ebpEmails.setMobile(mobile);
    		ebpEmails.setCompany(company);
    		ebpEmails.setDate(new Date());
    		
    		Boolean result = ebpDAO.saveEmails(ebpEmails);
    		
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
