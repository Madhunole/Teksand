package com.teksands.bootcamp.controller;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.teksands.bootcamp.dao.BootcampDAO;
import com.teksands.bootcamp.dao.ClientMasterDAO;
import com.teksands.bootcamp.dao.LogDAO;
import com.teksands.bootcamp.dao.MentorMasterDAO;
import com.teksands.bootcamp.model.Bootcamp;
import com.teksands.bootcamp.model.Candidate;
import com.teksands.bootcamp.model.ClientMaster;
import com.teksands.bootcamp.model.Log;
import com.teksands.bootcamp.model.MentorMaster;
import com.teksands.user.response.CommonResponse;
import com.teksands.utils.Utils;

@Controller

@RequestMapping("/bootcamp")
public class MentorMasterController {
	
	@Autowired
	MentorMasterDAO mentorMasterDAO;
	
	@Autowired
	LogDAO logDAO;
	
	@RequestMapping({"/mentor-master" })
	public String mentor_master(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try
		{	
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_id").equalsIgnoreCase(Utils.adminId.toString()))) {
				
				String user_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				String user_type = accountMap.get("user_type");
				
				List<MentorMaster> mentorMasterList = mentorMasterDAO.getAllMentorMaster();
				request.setAttribute("mentorMasterList", mentorMasterList);
				
				request.setAttribute("page", "mentor-master");
				
			}
			else {
				response.sendRedirect("/bootcamp");
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "bootcamp.mentor.master";
	}
	
	@RequestMapping({"/add-update-mentor-master" })
	public String add_update_mentor_master(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try
		{	
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_id").equalsIgnoreCase(Utils.adminId.toString()))) {
				
				String id = request.getParameter("id");

				MentorMaster mentorMaster = null;
	    		
	    		if(id != null) {
	    			mentorMaster = mentorMasterDAO.getMentorMasterById(Integer.parseInt(id));
	    			request.setAttribute("mentorMaster", mentorMaster);
	    		}
				
				request.setAttribute("page", "add-mentor-master");
				
			}
			else {
				response.sendRedirect("/bootcamp");
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "bootcamp.add.mentor.master";
	}
	
	@RequestMapping(value="/addOrUpdateMentorMaster")
	public void addOrUpdateMentorMaster(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;	
		
		HashMap<String, String> accountMap = null;
		try 
   		{
			
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_id").equalsIgnoreCase(Utils.adminId.toString()))) {
				
				String user_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				String user_type = accountMap.get("user_type");
				
				commonResponse = new CommonResponse();
	    		gson = new Gson();	
	    		
	    		String id = request.getParameter("id");
	    		String first_name = request.getParameter("first_name");
	    		String last_name = request.getParameter("last_name");
	    		String mobile = request.getParameter("mobile");
	    		String email = request.getParameter("email");
	    		String skills = request.getParameter("skills");
	    		String experience = request.getParameter("experience");
	    		String grade = request.getParameter("grade");
	    		String feedbacks = request.getParameter("feedbacks");
	    		String linkedin_profile = request.getParameter("linkedin_profile");
	    			    		
	    		if(id == null) {id="";}
	    		
	    		MentorMaster mentorMaster = null;
	    		Boolean isMentorMasterRegisteringForFirstTime = false;
	    		
	    		if(!id.isEmpty()) 
	    		{
	    			mentorMaster = mentorMasterDAO.getMentorMasterById(Integer.parseInt(id));
	    		}
	    		
	    		if(mentorMaster == null) {
	    			mentorMaster = new MentorMaster();
	    			isMentorMasterRegisteringForFirstTime = true;
	    		}
	    		
	    		mentorMaster.setFirst_name(first_name);
	    		mentorMaster.setLast_name(last_name);
	    		mentorMaster.setMobile(mobile);
	    		mentorMaster.setEmail(email);
	    		mentorMaster.setSkills(skills);
	    		mentorMaster.setExperience(experience);
	    		mentorMaster.setGrade(grade);
	    		mentorMaster.setFeedbacks(feedbacks);
	    		mentorMaster.setLinkedin_profile(linkedin_profile);
	    		mentorMaster.setCreated_date(new Date());
	    		mentorMaster.setActive(true);
	    		
	    		mentorMasterDAO.saveOrUpdateMentorMaster(mentorMaster);
	    		
	    		if(isMentorMasterRegisteringForFirstTime) {
	    			
	    			Log log = new Log();
			 		log.setUser_id(Integer.parseInt(user_id));
			 		log.setUser_name(user_name);
			 		log.setTitle("New Mentor Created");
			 		log.setDescription(user_name+" has created the new mentor ("+ first_name+ " " +last_name+")");
			 		log.setActivity_time(new Date());
			 		String ipAddr = Utils.getIpAddr(request);
					if(ipAddr == null){ipAddr="";}
			 		log.setIp_addr(ipAddr);
			 		logDAO.saveLog(log);
	    			
	    			commonResponse.setStatus("SUCCESS");
	    			commonResponse.setStatus_code(200);
	    			commonResponse.setMsg("The New Mentor Added Successfully.");
	    			writer.print(gson.toJson(commonResponse));
	    			writer.close();
	    			return;
	    			
	    		} else {
	    			
	    			Log log = new Log();
			 		log.setUser_id(Integer.parseInt(user_id));
			 		log.setUser_name(user_name);
			 		log.setTitle("New Mentor Details Updated");
			 		log.setDescription(user_name+" has updated the details to following mentor ("+ first_name+ " " +last_name+")");
			 		log.setActivity_time(new Date());
			 		String ipAddr = Utils.getIpAddr(request);
					if(ipAddr == null){ipAddr="";}
			 		log.setIp_addr(ipAddr);
			 		logDAO.saveLog(log);
			 		
	    			commonResponse.setStatus("SUCCESS");
	    			commonResponse.setStatus_code(200);
	    			commonResponse.setMsg("The Mentor Details are Updated Successfully.");
	    			writer.print(gson.toJson(commonResponse));
	    			writer.close();
	    			return;
	    		}
			}
			else {
				response.sendRedirect("/bootcamp");
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
	
	@RequestMapping({"/view-mentor-master" })
	public String view_candidate(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try
		{	
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && accountMap.get("user_type_id").equalsIgnoreCase(Utils.adminId.toString())) {
				
				String id = request.getParameter("id");

				MentorMaster mentorMaster = null;
	    		
	    		if(id != null) {
	    			mentorMaster = mentorMasterDAO.getMentorMasterById(Integer.parseInt(id));
	    			request.setAttribute("mentorMaster", mentorMaster);
	    		}
				
				request.setAttribute("page", "view-mentor-master");
				
			}
			else {
				response.sendRedirect("/bootcamp");
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "bootcamp.view.mentor.master";
	}
	
	@RequestMapping(value="/activateDeactivateMentorMaster")
	public void activateDeactivateCandidate(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;	
		
		HashMap<String, String> accountMap = null;
		try 
   		{
			
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_id").equalsIgnoreCase(Utils.adminId.toString()))) {
				
				String user_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				String user_type = accountMap.get("user_type");
				
				commonResponse = new CommonResponse();
	    		gson = new Gson();	
	    		
	    		String id = request.getParameter("id");
	    		
	    		MentorMaster mentorMaster = null;
	    		Boolean activateDeactivateMentorMaster = false;
	    		
	    		if(!id.isEmpty()) 
	    		{
	    			mentorMaster = mentorMasterDAO.getMentorMasterById(Integer.parseInt(id));
	    		}
	    		
	    		Boolean active = mentorMaster.getActive();
	    		
	    		if(active == true)
	    		{
	    			mentorMaster.setActive(false);
	    		}else {
	    			mentorMaster.setActive(true);
	    		}
   				
	    		mentorMasterDAO.saveOrUpdateMentorMaster(mentorMaster);
	    		
	    		if(active == true) {
	    			
	    			Log log = new Log();
			 		log.setUser_id(Integer.parseInt(user_id));
			 		log.setUser_name(user_name);
			 		log.setTitle("Mentor Deactivated");
			 		log.setDescription(user_name+" has deactivated to the following mentor ("+ mentorMaster.getFirst_name()+ " " +mentorMaster.getLast_name()+")");
			 		log.setActivity_time(new Date());
			 		String ipAddr = Utils.getIpAddr(request);
					if(ipAddr == null){ipAddr="";}
			 		log.setIp_addr(ipAddr);
			 		logDAO.saveLog(log);
	    			
	    			commonResponse.setStatus("SUCCESS");
	    			commonResponse.setStatus_code(200);
	    			commonResponse.setMsg("The Mentor Deactivated Successfully");
	    			writer.print(gson.toJson(commonResponse));
	    			writer.close();
	    			return;
	    			
	    		} else {
	    			
	    			Log log = new Log();
			 		log.setUser_id(Integer.parseInt(user_id));
			 		log.setUser_name(user_name);
			 		log.setTitle("Mentor Activated");
			 		log.setDescription(user_name+" has activated to the following mentor ("+ mentorMaster.getFirst_name()+ " " +mentorMaster.getLast_name()+")");
			 		log.setActivity_time(new Date());
			 		String ipAddr = Utils.getIpAddr(request);
					if(ipAddr == null){ipAddr="";}
			 		log.setIp_addr(ipAddr);
			 		logDAO.saveLog(log);
			 		
	    			commonResponse.setStatus("SUCCESS");
	    			commonResponse.setStatus_code(200);
	    			commonResponse.setMsg("The Mentor Activated Successfully.");
	    			writer.print(gson.toJson(commonResponse));
	    			writer.close();
	    			return;
	    		}
			}
			else {
				response.sendRedirect("/bootcamp");
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
