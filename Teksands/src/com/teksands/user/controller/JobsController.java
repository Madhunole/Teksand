package com.teksands.user.controller;

import java.io.PrintWriter;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.time.Year;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;

import javax.persistence.metamodel.SetAttribute;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.math.NumberUtils;
import org.hibernate.internal.util.StringHelper;
import org.hibernate.mapping.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.teksands.admin.dao.AdminDAO;
import com.teksands.bootcamp.dao.CandidateDAO;
import com.teksands.bootcamp.dao.JobMasterDAO;
import com.teksands.bootcamp.model.Brand;
import com.teksands.bootcamp.model.Candidate;
import com.teksands.bootcamp.model.CmsUser;
import com.teksands.bootcamp.model.JobApplication;
import com.teksands.bootcamp.model.JobMaster;
import com.teksands.user.dao.JobsDAO;
import com.teksands.user.model.Jobs;
import com.teksands.user.model.JobsApplications;
import com.teksands.user.response.CommonResponse;
import com.teksands.utils.Properties;
import com.teksands.utils.Utils;


@Controller
public class JobsController {
	
	@Autowired
	JobsDAO jobsDAO;
	
	@Autowired
	Properties properties;
	
	@Autowired
	AdminDAO adminDAO;
	
	@Autowired
	CandidateDAO candidateDAO;
	
	@Autowired
	JobMasterDAO jobMasterDAO;
	
	@RequestMapping(value="/jobs")
	public String jobs(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		try
		{	
			String pageid = request.getParameter("pageid");
			String category = request.getParameter("category");
			String tags = request.getParameter("tags");
			
			if(pageid == null){pageid = "1";}
			if(category == null){category = "";}
			if(tags == null){tags = "";}
			
			request.setAttribute("category", category);
			request.setAttribute("pageid", pageid);
			request.setAttribute("tags", tags);
			
			int page_id = Integer.parseInt(pageid);
			
			List<JobMaster> jobsList = jobMasterDAO.getJobsByPageId((page_id - 1), category, tags);
			request.setAttribute("jobsList", jobsList);
			
			List<JobMaster> latestJobs = jobMasterDAO.getLatestJobs(3);
			request.setAttribute("latestJobs", latestJobs);
			
			int jobPageCount = jobMasterDAO.getJobsPageCount();
            request.setAttribute("jobPageCount", jobPageCount);
			
            List<Integer> paginator =  Utils.paginator(page_id, jobPageCount);
            
            int beginPaginatorId = paginator.get(0);  
            int endPaginatorId = paginator.get(1);
            
            String domain = properties.getHostDomainUrl();
			request.setAttribute("resume_path", domain + "resources/cms/img/candidate-resumes/");
            
            request.setAttribute("beginPaginatorId", beginPaginatorId);
            request.setAttribute("endPaginatorId", endPaginatorId);
			
            request.setAttribute("page", "jobs");
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "user.jobs";
	}
	
	@RequestMapping(value="/jobs/{title}")
	public String blogdetails(HttpServletRequest request, HttpServletResponse response,
			@PathVariable(value="title") String title) throws Exception 
	{
		try
		{	
			
			JobMaster jobs = jobMasterDAO.getJobsByJobsURL(title);
			if(jobs == null) 
			{
				response.sendRedirect(request.getContextPath() + "/error");
				return "user.error";
			}
			request.setAttribute("jobs", jobs);
			
    		if(jobs != null) 
    		{
    			String category = jobs.getCategory();
    			
    			List<JobMaster> jobsRelatedList = jobMasterDAO.getRelatedJobsByPageCategory(category);
        		request.setAttribute("jobsRelatedList", jobsRelatedList);        		
        	}
    		
    		List<JobMaster> latestJobs = jobMasterDAO.getLatestJobs(3);
			request.setAttribute("latestJobs", latestJobs);
			
			String domain = properties.getHostDomainUrl();
			request.setAttribute("resume_path", domain + "resources/cms/img/candidate-resumes/");
			
            request.setAttribute("page", "jobs-details");
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "user.jobs.details";
	}
	
	@RequestMapping(value="/saveJobs")
	public void saveJobs(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;	
		try 
   		{
			commonResponse = new CommonResponse();
    		gson = new Gson();	
    		
    		String jobsId = request.getParameter("jobsId");
    		String name = request.getParameter("name");
    		String mobile = request.getParameter("mobile");
    		String email = request.getParameter("email");
    		String summary = request.getParameter("summary");
    		String resume = request.getParameter("resume");
    		String jobs_name = request.getParameter("jobs_name");
    		String technical_skills = request.getParameter("technical_skills");
    		String year_passing = request.getParameter("year_passing");
    		
    		Jobs jobs = jobsDAO.getJobsbyId(Integer.parseInt(jobsId));
    		
    		JobsApplications jobsApplications = new JobsApplications();
    		jobsApplications.setName(name);
    		jobsApplications.setMobile(mobile);
    		jobsApplications.setEmail(email);
    		jobsApplications.setSummary(summary);
    		jobsApplications.setDate(new Date());
    		jobsApplications.setResume(resume); 
    		jobsApplications.setJobs_id(jobs.getId());
    		jobsApplications.setJobs_name(jobs.getRole_name());
    		jobsApplications.setTechnical_skills(technical_skills);
    		jobsApplications.setYear_passing(year_passing);
    		
    		boolean result = jobsDAO.saveJobs(jobsApplications);
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
	
	@RequestMapping(value="/saveJobsDetails")
	public void saveJobsDetails(HttpServletRequest request, HttpServletResponse response) throws Exception 
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
    		String summary = request.getParameter("summary");
    		String resume = request.getParameter("resume");
    		String technical_skills = request.getParameter("technical_skills");
    		
    		if(name == null) {name = "";}
    		if(mobile == null) {mobile = "";}
    		if(email == null) {email = "";}
    		if(summary == null) {summary = "";}
    		if(resume == null) {resume = "";}
    		if(technical_skills == null) {technical_skills = "";}

    		name = name.trim();
    		mobile = mobile.trim();
    		email = email.trim();
    		summary = summary.trim();
    		resume = resume.trim();
    		technical_skills = technical_skills.trim();
    		
    		JobsApplications jobsApplications = new JobsApplications();
    		jobsApplications.setName(name);
    		jobsApplications.setMobile(mobile);
    		jobsApplications.setEmail(email);
    		jobsApplications.setSummary(summary);
    		jobsApplications.setDate(date);
    		jobsApplications.setResume(resume);
    		jobsApplications.setTechnical_skills(technical_skills);
    		
    		boolean result = jobsDAO.saveJobs(jobsApplications);
    		
    		String domain = properties.getHostDomainUrl();
    		String resume_path = domain + "resources/cms/img/candidate-resumes/"+resume;
    		
    		String password = Utils.getAutoPassword();
			String enc_pass = Utils.EncodeString(password);
			
			Brand brand = null;		
			brand = candidateDAO.getBrandByName("Teksands");
			CmsUser user = new CmsUser();
			if(brand != null)
			{	
				user.setBrand_id(brand.getId());
			}
    		user.setName(name);
    		user.setEmail(email);
    		user.setMobile(mobile);
    		user.setPassword_encrypted(enc_pass);
    		user.setUser_type("candidate");
    		user.setUser_type_id(Utils.candidateId);
    		user.setCreated_date(new Date());
    		user.setLogin_date(new Date());
    		user.setActive(true);
    		candidateDAO.saveOrUpdateCmsUser(user);
    		
    		Candidate candidate = new Candidate();
    		candidate.setBrand_id(brand.getId());
    		candidate.setUser_id(user.getId());
    		candidate.setName(name);
    		candidate.setMobile(mobile);
    		candidate.setEmail(email);
    		candidate.setResume(resume_path);
    		candidate.setKey_skills(technical_skills);
    		candidate.setCreated_date(new Date());
    		candidate.setResume_file_name(resume);
    		candidate.setActive(true);
    		candidateDAO.saveOrUpdateCandidate(candidate);
			
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
	
	@RequestMapping(value="/jobs/search")
   	public String jobs_search(@RequestParam(value="pageid",required=false) String pageid, HttpServletRequest request, HttpServletResponse response) 
   	{
        String keyword = "";
       	try 
   		{
       		keyword = request.getParameter("keyword");
       		if(keyword == null || keyword.isEmpty())
       		{
       			keyword = "all";   			
       		}
       		request.setAttribute("keyword", keyword);
       		
       		if(pageid == null){pageid = "1";}
       		
		    List<JobMaster> jobsearchList = jobsDAO.searchAllJobsByPageId(keyword, Integer.parseInt(pageid) - 1);
       		request.setAttribute("jobsearchList", jobsearchList);
       		
       		List<JobMaster> latestJobs = jobMasterDAO.getLatestJobs(3);
			request.setAttribute("latestJobs", latestJobs);
			
       		int jobPageCount = jobMasterDAO.getJobsPageCount();
            request.setAttribute("jobPageCount", jobPageCount);
			
            List<Integer> paginator =  Utils.paginator(Integer.parseInt(pageid), jobPageCount);
            
            int beginPaginatorId = paginator.get(0);  
            int endPaginatorId = paginator.get(1);
            
            request.setAttribute("beginPaginatorId", beginPaginatorId);
            request.setAttribute("endPaginatorId", endPaginatorId);
            
            request.setAttribute("keyword", keyword);

   		}
       	catch(Exception ex)
       	{
       		ex.printStackTrace();
       	}
       	return "user.jobs.search";
   	}
	
	
	@RequestMapping(value="/saveApplicationAndCreateCandidate")
	public void saveApplicationAndCreateCandidate(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;	
		JobMaster jobsMaster = null;
		try 
   		{
			commonResponse = new CommonResponse();
    		gson = new Gson();	
    		
    		String auth_code = request.getParameter("auth_code");
    		String name = request.getParameter("quick_name");
    		String mobile = request.getParameter("quick_mobile");
    		String email = request.getParameter("quick_email");
    		String key_skills = request.getParameter("quick_key_skills");
    		String resume = request.getParameter("quick_resume");
    		
    		if(auth_code == null) {auth_code = "";}
    		if(name == null) {name = "";}
    		if(mobile == null) {mobile = "";}
    		if(email == null) {email = "";}
    		if(key_skills == null) {key_skills = "";}
    		if(resume == null) {resume = "";}
    		
    		auth_code = auth_code.trim();
    		name = name.trim();
    		mobile = mobile.trim();
    		email = email.trim();
    		key_skills = key_skills.trim();
    		resume = resume.trim();
    		
    		if(!auth_code.isEmpty()) {
    			jobsMaster = jobMasterDAO.getJobsByAuthCode(auth_code);
    		}
    		
    		JobsApplications jobsApplications = new JobsApplications();
    		jobsApplications.setName(name);
    		jobsApplications.setMobile(mobile);
    		jobsApplications.setEmail(email);
    		jobsApplications.setTechnical_skills(key_skills);
    		jobsApplications.setDate(new Date());
    		jobsApplications.setResume(resume);
    		
    		Boolean saveApplication = jobsDAO.saveJobs(jobsApplications);
    		
    		String domain = properties.getHostDomainUrl();
			String resume_path = domain + "resources/cms/img/candidate-resumes/";
			String resume_file = resume_path + resume;
    		
    		Candidate candidate = new Candidate();
    		candidate.setJob_id(jobsMaster.getId());
    		candidate.setJob_title(jobsMaster.getRole_name());
    		candidate.setName(name);
    		candidate.setEmail(email);
    		candidate.setMobile(mobile);
    		candidate.setKey_skills(key_skills);
    		candidate.setCreated_date(new Date());
    		candidate.setResume(resume_file);
    		candidate.setResume_file_name(resume);
    		candidate.setActive(true);
    		
    		candidateDAO.saveOrUpdateCandidate(candidate);
    		
    		JobApplication jobApplication = new JobApplication();
    		jobApplication.setCandidate_id(candidate.getId());
    		jobApplication.setJob_id(jobsMaster.getId());
    		jobApplication.setCandidate_name(candidate.getName());
    		jobApplication.setCandidate_email(candidate.getEmail());
    		jobApplication.setCandidate_mobile(candidate.getMobile());
    		jobApplication.setJob_title(jobsMaster.getRole_name());
    		jobApplication.setApplied_date(new Date());
    		jobApplication.setActive(true);
    		
    		jobMasterDAO.saveOrUpdateJobApplication(jobApplication);
    		
    		if(saveApplication) {
    			commonResponse.setStatus("SUCCESS");
    			commonResponse.setStatus_code(200);
    			commonResponse.setMsg("We have received your enquiry and will respond to you shortly");
    			writer.print(gson.toJson(commonResponse));
    			writer.close();
    			return;
    		}else {
    			commonResponse.setStatus("FAILURE");
    			commonResponse.setStatus_code(400);
    			commonResponse.setMsg("Failure!, Please Try Again");
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
