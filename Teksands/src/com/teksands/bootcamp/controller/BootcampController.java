package com.teksands.bootcamp.controller;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
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
import com.teksands.bootcamp.dao.CandidateDAO;
import com.teksands.bootcamp.dao.ClientMasterDAO;
import com.teksands.bootcamp.dao.LogDAO;
import com.teksands.bootcamp.dao.MentorMasterDAO;
import com.teksands.bootcamp.model.Bootcamp;
import com.teksands.bootcamp.model.Candidate;
import com.teksands.bootcamp.model.ClientContact;
import com.teksands.bootcamp.model.ClientMaster;
import com.teksands.bootcamp.model.Log;
import com.teksands.bootcamp.model.MentorMaster;
import com.teksands.user.model.Countries;
import com.teksands.user.response.CommonResponse;
import com.teksands.utils.Utils;

@Controller
@RequestMapping("/bootcamp")
public class BootcampController {
	
	@Autowired
	BootcampDAO bootcampDAO;
	
	@Autowired
	CandidateDAO candidateDAO;
	
	@Autowired
	MentorMasterDAO mentorMasterDAO;
	
	@Autowired
	ClientMasterDAO clientMasterDAO;
	
	@Autowired
	LogDAO logDAO;
	
	@RequestMapping({"/bootcamp-list" })
	public String bootcamp_list(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try
		{	
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null) {
				
				String user_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				String user_type = accountMap.get("user_type");
				
				List<Bootcamp> bootcampList = bootcampDAO.getAllBootcamp();
				request.setAttribute("bootcampList", bootcampList);
				
				
				request.setAttribute("page", "bootcamp-list");
				
			}
			else {
				response.sendRedirect("/bootcamp");
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "bootcamp.list.bootcamp";
	}
	
	@RequestMapping({"/add-update-bootcamp" })
	public String add_bootcamp(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try
		{	
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_id").equalsIgnoreCase(Utils.adminId.toString())) || 
					(accountMap.get("user_id").equalsIgnoreCase(Utils.mentorId.toString())) || 
					(accountMap.get("user_id").equalsIgnoreCase(Utils.coordinatorId.toString()))) {
				
				String user_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				String user_type = accountMap.get("user_type");
				
				List<MentorMaster> mentorMasterList = mentorMasterDAO.getAllMentorMaster();
				request.setAttribute("mentorMasterList", mentorMasterList);
				
				String id = request.getParameter("id");
				String mentor_id = request.getParameter("mentor_id");
				
				Bootcamp bootcamp = null;
				MentorMaster mentorMaster = null;
				
	    		if(id != null) {
	    			bootcamp = bootcampDAO.getBootcampById(Integer.parseInt(id));
	    			request.setAttribute("bootcamp", bootcamp);
	    		}
	    		
	    		if(mentor_id != null) {
	    			mentorMaster = mentorMasterDAO.getMentorMasterById(Integer.parseInt(mentor_id));
	    			request.setAttribute("mentorMaster", mentorMaster);
	    		}
	    		
	    		List<ClientMaster> clientMasterList = clientMasterDAO.getAllClientMaster();
				request.setAttribute("clientMasterList", clientMasterList);
	    		
				request.setAttribute("page", "add-bootcamp");
				
			}
			else {
				response.sendRedirect("/bootcamp");
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "bootcamp.add.bootcamp";
	}
	
	@RequestMapping(value="/addOrUpdateBootcamp")
	public void addOrUpdateBootcamp(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;	
		
		HashMap<String, String> accountMap = null;
		try 
   		{
			
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_id").equalsIgnoreCase(Utils.adminId.toString())) || 
					(accountMap.get("user_id").equalsIgnoreCase(Utils.mentorId.toString())) || 
					(accountMap.get("user_id").equalsIgnoreCase(Utils.coordinatorId.toString()))) {
				
				String user_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				String user_type = accountMap.get("user_type");
				
				commonResponse = new CommonResponse();
	    		gson = new Gson();	
	    		
	    		String id = request.getParameter("id");
	    		String name = request.getParameter("name");
	    		String summary = request.getParameter("summary");
	    		String technologies = request.getParameter("technologies");
	    		String role = request.getParameter("role");
	    		String program_manager = request.getParameter("program_manager");
	    		String client_company = request.getParameter("client_company");
	    		String client_manager = request.getParameter("client_manager");
	    		String exp_start_range = request.getParameter("exp_start_range");
	    		String exp_end_range = request.getParameter("exp_end_range");
	    		String str_start_date = request.getParameter("start_date");
	    		String str_end_date = request.getParameter("end_date");
	    		
	    		String mentor_id = request.getParameter("mentor_id");
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
	    		if(mentor_id == null) {mentor_id="";}
	    		
	    		Bootcamp bootcamp = null;
	    		Boolean isBootcampRegisteringForFirstTime = false;
	    		
	    		if(!id.isEmpty()) 
	    		{
	    			bootcamp = bootcampDAO.getBootcampById(Integer.parseInt(id));
	    		}
	    		
	    		if(bootcamp == null) {
	    			bootcamp = new Bootcamp();
	    			isBootcampRegisteringForFirstTime = true;
	    		}
	    		
	    		Date start_date = new SimpleDateFormat("yyyy-MM-dd").parse(str_start_date);
	    		Date end_date = new SimpleDateFormat("yyyy-MM-dd").parse(str_end_date);
	    		
	    		if(mentor_id != null && !mentor_id.isEmpty())
	    		{
	    			MentorMaster mentorMaster = mentorMasterDAO.getMentorMasterById(Integer.parseInt(mentor_id));
	    			request.setAttribute("mentorMaster", mentorMaster);
	    			
	    			bootcamp.setMentor_id(Integer.parseInt(mentor_id));
	    			bootcamp.setMentor_name(mentorMaster.getFirst_name()+" "+ mentorMaster.getLast_name());
	    			bootcamp.setName(name);
		    		bootcamp.setRequirements_summary(summary);
		    		bootcamp.setTechnologies(technologies);
		    		bootcamp.setRole(role);
		    		bootcamp.setProgram_manager(program_manager);
		    		bootcamp.setClient_company(client_company);
		    		bootcamp.setClient_manager(client_manager);
		    		bootcamp.setExp_start_range(exp_start_range);
		    		bootcamp.setExp_end_range(exp_end_range);
		    		bootcamp.setStart_date(start_date);
		    		bootcamp.setEnd_date(end_date);
		    		bootcamp.setCreated_date(new Date());
		    		bootcamp.setActive(true);
	    			bootcampDAO.saveOrUpdateBootcamp(bootcamp);
	    			
	    			Log log = new Log();
			 		log.setUser_id(Integer.parseInt(user_id));
			 		log.setUser_name(user_name);
			 		log.setTitle("Bootcamp was created and assigned to Mentor");
			 		log.setDescription(user_name+" has created the new bootcamp ("+name+") and assigned to the following mentor " + mentorMaster.getFirst_name()+" "+ mentorMaster.getLast_name());
			 		log.setActivity_time(new Date());
			 		String ipAddr = Utils.getIpAddr(request);
					if(ipAddr == null){ipAddr="";}
			 		log.setIp_addr(ipAddr);
			 		logDAO.saveLog(log);
	    		}else
	    		{
	    			MentorMaster mentorMaster = new MentorMaster();
		    		
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
		    		
		    		bootcamp.setMentor_id(mentorMaster.getId());
		    		bootcamp.setName(name);
		    		bootcamp.setRequirements_summary(summary);
		    		bootcamp.setTechnologies(technologies);
		    		bootcamp.setRole(role);
		    		bootcamp.setProgram_manager(program_manager);
		    		bootcamp.setClient_company(client_company);
		    		bootcamp.setClient_manager(client_manager);
		    		bootcamp.setExp_start_range(exp_start_range);
		    		bootcamp.setExp_end_range(exp_end_range);
		    		bootcamp.setStart_date(start_date);
		    		bootcamp.setEnd_date(end_date);
		    		bootcamp.setCreated_date(new Date());
		    		bootcamp.setActive(true);
		    		
		    		bootcampDAO.saveOrUpdateBootcamp(bootcamp);
		    		
		    		Log log = new Log();
			 		log.setUser_id(Integer.parseInt(user_id));
			 		log.setUser_name(user_name);
			 		log.setTitle("Bootcamp and Mentor was created");
			 		log.setDescription(user_name+" has created the new bootcamp ("+name+") and mentor ("+first_name+" "+last_name+")");
			 		log.setActivity_time(new Date());
			 		String ipAddr = Utils.getIpAddr(request);
					if(ipAddr == null){ipAddr="";}
			 		log.setIp_addr(ipAddr);
			 		logDAO.saveLog(log);
			 		
	    		}
	    		
	    		if(isBootcampRegisteringForFirstTime) {
	    			
	    			commonResponse.setStatus("SUCCESS");
	    			commonResponse.setStatus_code(200);
	    			commonResponse.setMsg("The New Bootcamp Added Successfully.");
	    			writer.print(gson.toJson(commonResponse));
	    			writer.close();
	    			return;
	    			
	    		} else {
	    			
	    			commonResponse.setStatus("SUCCESS");
	    			commonResponse.setStatus_code(200);
	    			commonResponse.setMsg("The Bootcamp Details are Updated Successfully.");
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
	
	@RequestMapping({"/view-bootcamp" })
	public String view_bootcamp(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try
		{	
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null) {
				
				String id = request.getParameter("id");

				Bootcamp bootcamp= null;
	    		
				if(id != null) {
	    			bootcamp = bootcampDAO.getBootcampById(Integer.parseInt(id));
	    			request.setAttribute("bootcamp", bootcamp);
	    		}
				
				if(id != null) {
					List<Candidate> bootcampActivecandidateList = bootcampDAO.getBootcampActiveCandidatebyBootcampId(id);
					request.setAttribute("bootcampActivecandidateList", bootcampActivecandidateList);
					
					for (Candidate candidate : bootcampActivecandidateList) {
						System.out.println("id--->"+candidate.getId());
					}
				}
				
				List<MentorMaster> mentorMasterList = mentorMasterDAO.getAllMentorMaster();
				request.setAttribute("mentorMasterList", mentorMasterList);
				
				List<Candidate> candidateList = candidateDAO.getAllCandidate();
				request.setAttribute("candidateList", candidateList);
				
				List<ClientMaster> clientMasterList = clientMasterDAO.getAllClientMaster();
				request.setAttribute("clientMasterList", clientMasterList);
				
				request.setAttribute("page", "view-bootcamp");
				
			}
			else {
				response.sendRedirect("/bootcamp");
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "bootcamp.view.bootcamp";
	}
	
	@RequestMapping(value="/activateDeactivateBootcamp")
	public void activateDeactivateBootcamp(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;	
		
		HashMap<String, String> accountMap = null;
		try 
   		{
			
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_id").equalsIgnoreCase(Utils.adminId.toString())) || 
					(accountMap.get("user_id").equalsIgnoreCase(Utils.mentorId.toString())) || 
					(accountMap.get("user_id").equalsIgnoreCase(Utils.coordinatorId.toString()))) {
				
				String user_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				String user_type = accountMap.get("user_type");
				
				commonResponse = new CommonResponse();
	    		gson = new Gson();	
	    		
	    		String id = request.getParameter("id");
	    		
	    		Bootcamp bootcamp = null;
	    		
	    		if(!id.isEmpty()) 
	    		{
	    			bootcamp = bootcampDAO.getBootcampById(Integer.parseInt(id));
	    		}
	    		
	    		Boolean active = bootcamp.getActive();
	    		
	    		if(active == true)
	    		{
	    			bootcamp.setActive(false);
	    		}else {
	    			bootcamp.setActive(true);
	    		}
   				
	    		bootcampDAO.saveOrUpdateBootcamp(bootcamp);
	    		
	    		if(active == true) {
	    			
	    			Log log = new Log();
			 		log.setUser_id(Integer.parseInt(user_id));
			 		log.setUser_name(user_name);
			 		log.setTitle("Bootcamp Deactivated");
			 		log.setDescription(user_name+" has deactivated the following bootcamp" + bootcamp.getName());
			 		log.setActivity_time(new Date());
			 		String ipAddr = Utils.getIpAddr(request);
					if(ipAddr == null){ipAddr="";}
			 		log.setIp_addr(ipAddr);
			 		logDAO.saveLog(log);
			 		
	    			commonResponse.setStatus("SUCCESS");
	    			commonResponse.setStatus_code(200);
	    			commonResponse.setMsg("The Bootcamp Deactivated Successfully");
	    			writer.print(gson.toJson(commonResponse));
	    			writer.close();
	    			return;
	    			
	    		} else {
	    			
	    			Log log = new Log();
			 		log.setUser_id(Integer.parseInt(user_id));
			 		log.setUser_name(user_name);
			 		log.setTitle("Bootcamp Activated");
			 		log.setDescription(user_name+" has activated the following bootcamp" + bootcamp.getName());
			 		log.setActivity_time(new Date());
			 		String ipAddr = Utils.getIpAddr(request);
					if(ipAddr == null){ipAddr="";}
			 		log.setIp_addr(ipAddr);
			 		logDAO.saveLog(log);
			 		
	    			commonResponse.setStatus("SUCCESS");
	    			commonResponse.setStatus_code(200);
	    			commonResponse.setMsg("The Bootcamp Activated Successfully.");
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
	
	@RequestMapping({"/assign-bootcamp" })
	public String assign_bootcamp(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try
		{	
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_id").equalsIgnoreCase(Utils.adminId.toString())) || 
					(accountMap.get("user_id").equalsIgnoreCase(Utils.mentorId.toString())) || 
					(accountMap.get("user_id").equalsIgnoreCase(Utils.coordinatorId.toString()))) {
				
				String id = request.getParameter("id");

				Bootcamp bootcamp= null;
	    		
				if(id != null) {
	    			bootcamp = bootcampDAO.getBootcampById(Integer.parseInt(id));
	    			request.setAttribute("bootcamp", bootcamp);
	    		}
				
				List<Candidate> candidateList = candidateDAO.getAllCandidate();
				request.setAttribute("candidateList", candidateList);
				
				request.setAttribute("page", "assign-bootcamp");
				
			}
			else {
				response.sendRedirect("/bootcamp");
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "bootcamp.assign.bootcamp";
	}
	
	@RequestMapping(value="/assignBootcampToCandidate")
	public void assignBootcampToCandidate(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{		
		response.setContentType("text/html");
		PrintWriter writer = response.getWriter();
		CommonResponse commonResponse = null;
		Gson gson = null;
		HashMap<String, String> accountMap = null;
    	try 
   		{	
    		commonResponse = new CommonResponse();
    		gson = new Gson();	
    		
    		accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			
    		if(accountMap != null && (accountMap.get("user_id").equalsIgnoreCase(Utils.adminId.toString())) || 
					(accountMap.get("user_id").equalsIgnoreCase(Utils.mentorId.toString())) || 
					(accountMap.get("user_id").equalsIgnoreCase(Utils.coordinatorId.toString()))) {
				
    			String user_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				String user_type = accountMap.get("user_type");
    			
    			commonResponse = new CommonResponse();
	    		gson = new Gson();	
	    		List<String> candidateStrList = null;
	    		List<Integer> candidateIdIntList = new ArrayList<Integer>();
	    		List<String> bootcampStrList = null;
	    		List<Integer> bootcampIdStrList = new ArrayList<Integer>();
	    		
	    		String bootcamp_id = request.getParameter("bootcamp_id");
	    		String bootcamp_name = request.getParameter("bootcamp_name");
	    		String candidateStr = request.getParameter("candidateStr");
	    		
	    		Bootcamp bootcamp = null;
	    		
	    		if(candidateStr == null) {candidateStr = "";}
	    		
	    		if(candidateStr.isEmpty()) 
	    		{
	    			candidateDAO.getCandidateUnCheck(bootcamp_id, bootcamp_name);
	    			
	    			candidateStrList = Arrays.asList(candidateStr.split(","));	  
	    			
	    			for (String string : candidateStrList)
		    		{
		    			candidateIdIntList.add(Integer.parseInt(string));
		    		}
		    		
	    			List<Candidate> candidateList = candidateDAO.getCandidateByIdList(candidateIdIntList);
	    			
		    		for (Candidate candidate: candidateList) {
		    			
		    			String candidateName = candidate.getName();
		    			
		    			Log log = new Log();
				 		log.setUser_id(Integer.parseInt(user_id));
				 		log.setUser_name(user_name);
				 		log.setTitle("Bootcamp Unassigned");
				 		log.setDescription(user_name+" has unassigned the bootcamp ("+bootcamp_name+") to "+candidateName );
				 		log.setActivity_time(new Date());
				 		String ipAddr = Utils.getIpAddr(request);
						if(ipAddr == null){ipAddr="";}
				 		log.setIp_addr(ipAddr);
				 		logDAO.saveLog(log);
		    			
		    		}
	    			
	    			commonResponse.setStatus("SUCCESS");
	    			commonResponse.setStatus_code(200);
	    			commonResponse.setMsg("Bootcamp was Unassigned to all candidates");
	    			writer.print(gson.toJson(commonResponse));
	    			writer.close();
	    			return;
	    		}else 
	    		{
	    			candidateStrList = Arrays.asList(candidateStr.split(","));	    	
		    		
		    		for (String string : candidateStrList)
		    		{
		    			candidateIdIntList.add(Integer.parseInt(string));
		    		}
		    		
		    		List<Candidate> candidateList = candidateDAO.getCandidateByIdList(candidateIdIntList);
		    		
		    		for (Candidate candidate: candidateList) 
		    		{
		    			if(bootcamp_id != null) {
			    			bootcamp = bootcampDAO.getBootcampById(Integer.parseInt(bootcamp_id));
			    		}
		    			
		    			String oldBootcampId = candidate.getBootcamp_ids();
		    			String oldBootcampName = candidate.getBootcamp_name();
		    			String newBootcampName = bootcamp.getName();
		    			
		    			if(oldBootcampId.equalsIgnoreCase("0") || oldBootcampId.isEmpty()) 
		    			{
		    				candidate.setBootcamp_ids(bootcamp_id);
		    				candidate.setBootcamp_name(newBootcampName);
			    			candidateDAO.saveOrUpdateCandidate(candidate);
			    			
			    			Log log = new Log();
					 		log.setUser_id(Integer.parseInt(user_id));
					 		log.setUser_name(user_name);
					 		log.setTitle("Bootcamp assigned");
					 		log.setDescription(user_name+" has assigned the bootcamp ("+bootcamp_name+") to "+candidate.getName() );
					 		log.setActivity_time(new Date());
					 		String ipAddr = Utils.getIpAddr(request);
							if(ipAddr == null){ipAddr="";}
					 		log.setIp_addr(ipAddr);
					 		logDAO.saveLog(log);
		    			}else 
		    			{
		    				List<String> ids = Arrays.asList(oldBootcampId.split(","));
				    		boolean flag = true;
				    		
				    		for (String string : ids)
				    		{
				    			if(string.equalsIgnoreCase(bootcamp_id)) 
				    			{
				    				flag = false;
				    			}
				    		}
				    		if(flag == true) 
				    		{
				    			oldBootcampId += "," + bootcamp_id;
				    			oldBootcampName += "," + newBootcampName;
				    			
				    			candidate.setBootcamp_ids(oldBootcampId);
			    				candidate.setBootcamp_name(oldBootcampName);
				    			candidateDAO.saveOrUpdateCandidate(candidate);
				    			
				    			Log log = new Log();
						 		log.setUser_id(Integer.parseInt(user_id));
						 		log.setUser_name(user_name);
						 		log.setTitle("Bootcamp assigned");
						 		log.setDescription(user_name+" has assigned the bootcamp ("+bootcamp_name+") to "+candidate.getName() );
						 		log.setActivity_time(new Date());
						 		String ipAddr = Utils.getIpAddr(request);
								if(ipAddr == null){ipAddr="";}
						 		log.setIp_addr(ipAddr);
						 		logDAO.saveLog(log);
				    		}
		    			}
		    		}
		    		
		    		commonResponse.setStatus("SUCCESS");
	    			commonResponse.setStatus_code(200);
	    			commonResponse.setMsg("Bootcamp Assigned To Selected Candidate's");
	    			writer.print(gson.toJson(commonResponse));
	    			writer.close();
	    			return;
	    		}
			}
    		else { response.sendRedirect("/home"); }
    	}
       	catch(Exception ex)
       	{
       		ex.printStackTrace();
       		commonResponse.setStatus("FAILURE");
       		commonResponse.setMsg("Bootcampe Not Selected Candidate, Please Try Again");
			commonResponse.setStatus_code(400);
			writer = response.getWriter();
			writer.print(gson.toJson(commonResponse));
			writer.close();
			return;
       	}
	}
}
