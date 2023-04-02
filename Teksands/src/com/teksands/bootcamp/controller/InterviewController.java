package com.teksands.bootcamp.controller;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.persistence.metamodel.SetAttribute;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;
import com.teksands.bootcamp.dao.BootcampDAO;
import com.teksands.bootcamp.dao.CandidateDAO;
import com.teksands.bootcamp.dao.ClientMasterDAO;
import com.teksands.bootcamp.dao.InterviewDAO;
import com.teksands.bootcamp.dao.LogDAO;
import com.teksands.bootcamp.dao.MentorMasterDAO;
import com.teksands.bootcamp.model.Bootcamp;
import com.teksands.bootcamp.model.Candidate;
import com.teksands.bootcamp.model.ClientMaster;
import com.teksands.bootcamp.model.Interview;
import com.teksands.bootcamp.model.Log;
import com.teksands.bootcamp.model.MentorMaster;
import com.teksands.bootcamp.model.Pincode;
import com.teksands.user.response.CommonResponse;
import com.teksands.utils.Utils;

@Controller
@RequestMapping("/bootcamp")
public class InterviewController {
	
	@Autowired
	BootcampDAO bootcampDAO;
	
	@Autowired
	CandidateDAO candidateDAO;
	
	@Autowired
	ClientMasterDAO clientMasterDAO;
	
	@Autowired
	InterviewDAO interviewDAO;
	
	@Autowired
	MentorMasterDAO mentorMasterDAO;
	
	@Autowired
	LogDAO logDAO;
	
	@RequestMapping({"/interview-list" })
	public String interview_list(HttpServletRequest request, HttpServletResponse response) throws Exception 
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
				
				List<Interview> interviewList = interviewDAO.getInterview();
				request.setAttribute("interviewList", interviewList);
				
				request.setAttribute("page", "interview-list");
				
				List<MentorMaster> mentorMasterList = mentorMasterDAO.getAllMentorMaster();
				request.setAttribute("mentorMasterList", mentorMasterList);
				
			}
			else {
				response.sendRedirect("/bootcamp");
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "bootcamp.list.interview";
	}
	
	@RequestMapping({"/add-update-interview" })
	public String add_update_interview(HttpServletRequest request, HttpServletResponse response) throws Exception 
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
				
				List<Candidate> candidateList = candidateDAO.getAllCandidate();
				request.setAttribute("candidateList", candidateList);
				
				List<ClientMaster> clientMasterList = clientMasterDAO.getAllClientMaster();
				request.setAttribute("clientMasterList", clientMasterList);
				
				List<Bootcamp> bootcampList = bootcampDAO.getAllBootcamp();
				request.setAttribute("bootcampList", bootcampList);
				
				String bootcamp_id = request.getParameter("bootcamp_id");			
				
				if(bootcamp_id == null){bootcamp_id = "";};			
				
				bootcamp_id = bootcamp_id.trim();
				
				if(bootcamp_id != null) {
					List<Candidate> candidateTable = interviewDAO.getBootcampActiveCandidatebyBootcampId(bootcamp_id);
					request.setAttribute("candidateTable", candidateTable);
				}
				
				request.setAttribute("page", "add-update-interview");
				
			}
			else {
				response.sendRedirect("/bootcamp");
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "bootcamp.add.update.interview";
	}
	
	@RequestMapping(value="/addUpdateInterview")
	public void addUpdateInterview(HttpServletRequest request, HttpServletResponse response) throws Exception 
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
			
    		if(accountMap != null && (accountMap.get("user_id").equalsIgnoreCase(Utils.adminId.toString()))) {
    			
    			String user_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				String user_type = accountMap.get("user_type");
				
    			commonResponse = new CommonResponse();
	    		gson = new Gson();	
	    		List<String> candidateStrList = null;
	    		List<Integer> candidateIdIntList = new ArrayList<Integer>();
	    		
	    		String interview_type = request.getParameter("interview_type");
	    		String bootcamp_id = request.getParameter("bootcamp_id");
	    		String candidateStr = request.getParameter("candidateStr");
	    		String company_id = request.getParameter("company_id");
	    		String interviewer_name = request.getParameter("cms_interviewer_name");
	    		String interview_date_str = request.getParameter("interview_date");
	    		
	    		Date interview_date = new SimpleDateFormat("yyyy-MM-dd").parse(interview_date_str);  
	    		
	    		if(candidateStr == null) {candidateStr = "";}
	    		
	    		Bootcamp bootcamp = null;
	    		ClientMaster clientMaster = null;
	    		Interview interview = null;

	    		if(bootcamp_id != null) {
	    			bootcamp = bootcampDAO.getBootcampById(Integer.parseInt(bootcamp_id));
	    			request.setAttribute("bootcamp", bootcamp);
	    		}
	    		
	    		if(company_id != null) {
	    			clientMaster = clientMasterDAO.getClientMasterById(Integer.parseInt(company_id));
	    			request.setAttribute("clientMaster", clientMaster);
	    		}
	    		
	    		candidateStrList = Arrays.asList(candidateStr.split(","));	   
	    		
	    		for (String string : candidateStrList)
	    		{
	    			candidateIdIntList.add(Integer.parseInt(string));
	    		}
	    		
	    		List<Candidate> candidateList = candidateDAO.getCandidateByIdList(candidateIdIntList);
	    		
	    		for (Candidate candidate: candidateList) 
	    		{
	    			interview = new Interview();
		    		interview.setBootcamp_id(Integer.parseInt(bootcamp_id));
		    		interview.setBootcamp_name(bootcamp.getName());
		    		interview.setCandidate_id(candidate.getId());
		    		interview.setCandidate_name(candidate.getName());
		    		interview.setCompany_id(Integer.parseInt(company_id));
		    		interview.setCompany_name(clientMaster.getName());
		    		interview.setInterview_type(interview_type);
		    		interview.setInterviewer_name(interviewer_name);
		    		interview.setInterview_date(interview_date);
		    		interview.setCreated_date(new Date());
		    		interview.setActive(true);
		    		interviewDAO.saveOrUpdateInterview(interview);
		    		
		    		Log log = new Log();
			 		log.setUser_id(Integer.parseInt(user_id));
			 		log.setUser_name(user_name);
			 		log.setTitle("New Interview Created");
			 		log.setDescription(user_name+" has created the new interview to the following canidate: " + candidate.getName());
			 		log.setActivity_time(new Date());
			 		String ipAddr = Utils.getIpAddr(request);
					if(ipAddr == null){ipAddr="";}
			 		log.setIp_addr(ipAddr);
			 		logDAO.saveLog(log);
		    		
		    		commonResponse.setStatus("SUCCESS");
	    			commonResponse.setStatus_code(200);
	    			commonResponse.setMsg("Interview was Created to Selected candidates");
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
       		commonResponse.setMsg("Interview Not Assigned to Selected Candidate, Please Try Again");
			commonResponse.setStatus_code(400);
			writer = response.getWriter();
			writer.print(gson.toJson(commonResponse));
			writer.close();
			return;
       	}
	}
	
	@RequestMapping(value = "/activateDeactivateInterview")
	public void activateDeactivateInterview(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;

		HashMap<String, String> accountMap = null;
		try {

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

				Interview interview = null;
				
				if (!id.isEmpty()) {
					interview = interviewDAO.getInterviewById(Integer.parseInt(id));
				}

				Boolean active = interview.getActive();

				if (active == true) {
					interview.setActive(false);
				} else {
					interview.setActive(true);
				}

				interviewDAO.saveOrUpdateInterview(interview);

				if (active == true) {

					Log log = new Log();
			 		log.setUser_id(Integer.parseInt(user_id));
			 		log.setUser_name(user_name);
			 		log.setTitle("Interview Deactivated");
			 		log.setDescription(user_name+" has deactivated the "+interview.getCompany_name()+" interview");
			 		log.setActivity_time(new Date());
			 		String ipAddr = Utils.getIpAddr(request);
					if(ipAddr == null){ipAddr="";}
			 		log.setIp_addr(ipAddr);
			 		logDAO.saveLog(log);
					
					commonResponse.setStatus("SUCCESS");
					commonResponse.setStatus_code(200);
					commonResponse.setMsg("The Interview Deactivated Successfully");
					writer.print(gson.toJson(commonResponse));
					writer.close();
					return;

				} else {
					
					Log log = new Log();
			 		log.setUser_id(Integer.parseInt(user_id));
			 		log.setUser_name(user_name);
			 		log.setTitle("Interview Activated");
			 		log.setDescription(user_name+" has activated the "+interview.getCompany_name()+" interview");
			 		log.setActivity_time(new Date());
			 		String ipAddr = Utils.getIpAddr(request);
					if(ipAddr == null){ipAddr="";}
			 		log.setIp_addr(ipAddr);
			 		logDAO.saveLog(log);
					
					commonResponse.setStatus("SUCCESS");
					commonResponse.setStatus_code(200);
					commonResponse.setMsg("The Interview Activated Successfully.");
					writer.print(gson.toJson(commonResponse));
					writer.close();
					return;
				}
			} else {
				response.sendRedirect("/bootcamp");
			}
		} catch (Exception ex) {
			ex.printStackTrace();

			commonResponse.setStatus("FAILURE");
			commonResponse.setStatus_code(400);
			writer.print(gson.toJson(commonResponse));
			writer.close();
			return;
		}
	}
}
