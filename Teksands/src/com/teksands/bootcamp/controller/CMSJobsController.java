package com.teksands.bootcamp.controller;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;
import com.teksands.admin.dao.AdminDAO;
import com.teksands.bootcamp.dao.CandidateDAO;
import com.teksands.bootcamp.dao.ClientMasterDAO;
import com.teksands.bootcamp.dao.JobMasterDAO;
import com.teksands.bootcamp.dao.LogDAO;
import com.teksands.bootcamp.model.Candidate;
import com.teksands.bootcamp.model.ClientContact;
import com.teksands.bootcamp.model.ClientMaster;
import com.teksands.bootcamp.model.JobApplication;
import com.teksands.bootcamp.model.JobMaster;
import com.teksands.bootcamp.model.Log;
import com.teksands.bootcamp.response.JobMasterApplicationResponse;
import com.teksands.user.response.CandidateandJobResponse;
import com.teksands.user.response.CommonResponse;
import com.teksands.utils.Properties;
import com.teksands.utils.Utils;

@Controller
@RequestMapping("/bootcamp")
public class CMSJobsController {
	
	@Autowired
	Properties properties;
	
	@Autowired
	ClientMasterDAO clientMasterDAO;
	
	@Autowired
	CandidateDAO candidateDAO;
	
	@Autowired
	JobMasterDAO jobMasterDAO;
	
	@Autowired
	LogDAO logDAO;
	
	@Autowired
	AdminDAO adminDAO;
	
	@RequestMapping({"/jobs-list" })
	public String jobs_list(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try
		{	
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			
			if(accountMap != null && (accountMap.get("user_id").equalsIgnoreCase(Utils.adminId.toString()))) {
				
				//List<JobMaster> jobsMasterList = jobMasterDAO.getAllActiveJobMaster();
				//request.setAttribute("jobMasterList", jobsMasterList);
				
				List<JobMasterApplicationResponse> jobMasterApplicationResponseList = new ArrayList<JobMasterApplicationResponse>();
				
				List<Object[]> object_list = jobMasterDAO.getJobApplicationByJobCatIdObj();
				System.out.println("object_list size ===== "+ object_list.size());
				for (Object[] objects : object_list) 
    			{
				
					String no_of_applied = String.valueOf(objects[0]);
    				Integer id = (Integer) objects[1];
    				String position = String.valueOf(objects[2]);
    				String company_name = String.valueOf(objects[3]);    				
    				Date date_of_posted = (Date) objects[4];
    				String min_salary_range = String.valueOf(objects[5]);
    				String max_salary_range = String.valueOf(objects[6]);
    				String experience = String.valueOf(objects[7]);
    				String skills_required = String.valueOf(objects[8]);
    				String location =  String.valueOf(objects[9]);
    				String total_vacancy = String.valueOf(objects[10]);
    				
    				JobMasterApplicationResponse jobMasterApplication = new JobMasterApplicationResponse();
    				jobMasterApplication.setNo_of_applied(no_of_applied);
    				jobMasterApplication.setId(id);;
    				jobMasterApplication.setPosition(position);
    				jobMasterApplication.setCompany_name(company_name);
    				jobMasterApplication.setDate_of_posted(date_of_posted);
    				jobMasterApplication.setMin_salary_range(min_salary_range);
    				jobMasterApplication.setMax_salary_range(max_salary_range);
    				jobMasterApplication.setExperience(experience);
    				jobMasterApplication.setSkills_required(skills_required);
    				jobMasterApplication.setLocation(location);
    				jobMasterApplication.setTotal_vacancy(total_vacancy);
    				jobMasterApplicationResponseList.add(jobMasterApplication);	    												
    			}
				request.setAttribute("jobMasterList", jobMasterApplicationResponseList);				
				
				request.setAttribute("page", "jobs-list");				
			}
			else {
				response.sendRedirect("/bootcamp");
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "bootcamp.list.jobs";
	}
	
	@RequestMapping({ "/add-update-jobs" })
	public String add_update_jobs(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HashMap<String, String> accountMap = null;
		try {
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_id").equalsIgnoreCase(Utils.adminId.toString()))) {

				String id = request.getParameter("id");
				String source = request.getParameter("source");
				
				request.setAttribute("source",source);
				JobMaster jobMaster = null;

				if (id != null) {
					jobMaster = jobMasterDAO.getJobsById(Integer.parseInt(id));
					request.setAttribute("jobMaster", jobMaster);
				}

				List<ClientMaster> clientMasterList = clientMasterDAO.getAllClientMaster();
				request.setAttribute("clientMasterList", clientMasterList);

				request.setAttribute("page", "add-update-jobs");

			} else {
				response.sendRedirect("/bootcamp");
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return "bootcamp.add.update.job";
	}
	
	@RequestMapping(value = "/getClientContactByCampnayId", method = RequestMethod.POST)
	public void getCityStateForPincode(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		Gson gson = new Gson();
		HashMap<String, String> accountMap = null;
		try {
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_id").equalsIgnoreCase(Utils.adminId.toString()))) {
			String companyId = request.getParameter("companyId");
			
			System.out.println("companyId--->" + companyId);
			
			if (companyId == null) {companyId = "";};
			
			companyId = companyId.trim();

			ClientContact clientContact = jobMasterDAO.getClientContactByCampanyId(companyId);

			writer.print(gson.toJson(clientContact));
			writer.close();
		} else {
			response.sendRedirect("/bootcamp");
		}
		} catch (Exception ex) {
			writer.print("");
			writer.close();
			ex.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/addOrUpdateNewJob")
	public void addOrUpdateNewJob(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;	
		try 
   		{
			commonResponse = new CommonResponse();
    		gson = new Gson();	
    		
    		String authCode = RandomStringUtils.random(8, "0123456789abcdef");
    		
    		String id = request.getParameter("id");
    		Date date = new Date();
    		String role_name = request.getParameter("role_name");
    		String total_vacancy = request.getParameter("total_vacancy");
    		String position = request.getParameter("position");
    		String min_exp_range = request.getParameter("min_exp_range");
    		String max_exp_range = request.getParameter("max_exp_range");
    		String min_salary_range = request.getParameter("min_salary_range");
    		String max_salary_range = request.getParameter("max_salary_range");
    		String skills_required = request.getParameter("skills_required");
    		String location = request.getParameter("location");
    		String qualification = request.getParameter("qualification");
    		String short_description = request.getParameter("short_description");
    		String skills_competencies = request.getParameter("skills_competencies");
    		String image = request.getParameter("image");
    		String job_responsibilities = request.getParameter("job_responsibilities");
    		String industry = request.getParameter("industry");
    		String category = request.getParameter("category");
    		String tags = request.getParameter("tags");
    		String company_name = request.getParameter("company_name");
    		String company_logo = request.getParameter("company_logo");
    		String company_about = request.getParameter("company_about");
    		String company_website = request.getParameter("company_website");
    		String company_address = request.getParameter("company_address");
    		String contact_person = request.getParameter("contact_person");
    		String contact_email = request.getParameter("contact_email");
    		String contact_mobile = request.getParameter("contact_mobile");
    		String emp_type = request.getParameter("emp_type");
    		String domain = request.getParameter("domain");
    		String job_mode = request.getParameter("job_mode");
    		String meta_title = request.getParameter("meta_title");
    		String meta_desc = request.getParameter("meta_desc");
    		String meta_keywords = request.getParameter("meta_keywords");
    		String active = request.getParameter("active");
    		
    		if(id == null) {id = "";}
    		if(role_name == null) {role_name = "";}
    		if(total_vacancy == null) {total_vacancy = "";}
    		if(position == null) {position = "";}
    		if(min_exp_range == null) {min_exp_range = "";}
    		if(max_exp_range == null) {max_exp_range = "";}
    		if(min_salary_range.equalsIgnoreCase("Select the Salary Range")) {min_salary_range = "0";}
    		if(max_salary_range.equalsIgnoreCase("Select the Salary Range")) {max_salary_range = "0";}
    		if(skills_required == null) {skills_required = "";}
    		if(location == null) {location = "";}
    		if(qualification == null) {qualification = "";}
    		if(short_description == null) {short_description = "";}
    		if(skills_competencies == null) {skills_competencies = "";}
    		if(image == null) {image = "";}
    		if(job_responsibilities == null) {job_responsibilities = "";}
    		if(industry == null) {industry = "";}
    		if(category == null) {category = "";}
    		if(tags == null) {tags = "";}
    		if(company_name == null) {company_name = "";}
    		if(company_logo == null) {company_logo = "";}
    		if(company_about == null) {company_about = "";}
    		if(company_website == null) {company_website = "";}
    		if(company_address == null) {company_address = "";}
    		if(contact_person == null) {contact_person = "";}
    		if(contact_email == null) {contact_email = "";}
    		if(contact_mobile == null) {contact_mobile = "";}
    		if(emp_type == null) {emp_type = "";}
    		if(domain == null) {domain = "";}
    		if(job_mode == null) {job_mode = "";}
    		if(meta_title == null) {meta_title = "";}
    		if(meta_desc == null) {meta_desc = "";}
    		if(meta_keywords == null) {meta_keywords = "";}
    		if(active == null) {active = "";}
    		
    		id = id.trim();
    		role_name = role_name.trim();
    		total_vacancy = total_vacancy.trim();
    		position = position.trim();
    		min_exp_range = min_exp_range.trim();
    		max_exp_range = max_exp_range.trim();
    		min_salary_range = min_salary_range.trim();
    		max_salary_range = max_salary_range.trim();
    		skills_required = skills_required.trim();
    		location = location.trim();
    		qualification = qualification.trim();
    		short_description = short_description.trim();
    		skills_competencies = skills_competencies.trim();
    		image = image.trim();
    		job_responsibilities = job_responsibilities.trim();
    		industry = industry.trim();
    		category = category.trim();
    		tags = tags.trim();
    		company_name = company_name.trim();
    		company_logo = company_logo.trim();
    		company_about = company_about.trim();
    		company_website = company_website.trim();
    		company_address = company_address.trim();
    		contact_person = contact_person.trim();
    		contact_email = contact_email.trim();
    		contact_mobile = contact_mobile.trim();
    		emp_type = emp_type.trim();
    		domain = domain.trim();
    		job_mode = job_mode.trim();
    		meta_title = meta_title.trim();
    		meta_desc = meta_desc.trim();
    		meta_keywords = meta_keywords.trim();    		
    		active = active.trim();
    		
    		JobMaster jobs = null;
    		Boolean isFirstTimeJobPost = false;
    		
    		System.out.println("id = " + id);
    		
    		if(!id.isEmpty()) {
    			jobs = jobMasterDAO.getJobsById(Integer.parseInt(id));
    		}
    		
    		if(jobs != null) {
    			isFirstTimeJobPost = false;
    		}else {
    			jobs = new JobMaster();
    			isFirstTimeJobPost = true;
    		}
    		
    		String jobUrl = "";
    		
    		if(!position.isEmpty()) {
    			SimpleDateFormat sdf = new SimpleDateFormat("ddMMyyyyHHmmss");
    			String randomNumber = sdf.format(new Date());
    			String convertLowerCaseTitle = position.toLowerCase();
    			jobUrl = convertLowerCaseTitle.replace(' ', '-');
    			jobUrl = jobUrl+"-"+randomNumber;    			
    			
    		}else {
    			commonResponse.setStatus("FAILURE");
    			commonResponse.setStatus_code(200);
    			commonResponse.setMsg("Please add the job position");
    			writer.print(gson.toJson(commonResponse));
    			writer.close();
    			return;
    		}
    			
    		jobs.setDate(date);
    		jobs.setRole_name(role_name);
    		jobs.setJobs_url(jobUrl);
    		jobs.setTotal_vacancy(total_vacancy);
    		jobs.setPosition(position);
    		jobs.setMin_exp(min_exp_range);
    		jobs.setMax_exp(max_exp_range);
    		jobs.setMin_salary_range(min_salary_range);
    		jobs.setMax_salary_range(max_salary_range);
    		jobs.setSkills_required(skills_required);
    		jobs.setLocation(location);
    		jobs.setQualification(qualification);
    		jobs.setShort_description(short_description);
    		jobs.setImage(image);
    		jobs.setSkills_competencies(skills_competencies);
    		jobs.setJob_responsibilities(job_responsibilities);
    		jobs.setIndustry(industry);
    		jobs.setCategory(category);
    		jobs.setTags(tags);
    		jobs.setCompany_name(company_name);
    		jobs.setCompany_about(company_about);
    		jobs.setCompany_logo(company_logo);
    		jobs.setCompany_website(company_website);
    		jobs.setCompany_address(company_address);
    		jobs.setContact_person(contact_person);
    		jobs.setContact_mobile(contact_mobile);
    		jobs.setContact_email(contact_email);
    		jobs.setDomain(domain);
    		jobs.setJob_mode(job_mode);
    		jobs.setEmp_type(emp_type);
    		jobs.setAuth_code(authCode);
    		jobs.setDate_of_posted(new Date());
    		jobs.setMeta_title(meta_title);
    		jobs.setMeta_desc(meta_desc);
    		jobs.setMeta_keywords(meta_keywords);
    		jobs.setActive(true);

    		jobMasterDAO.saveOrUpdateJobMaster(jobs);
    		
    		System.out.println("isFirstTimeJobPost = " + isFirstTimeJobPost);
    		
    		if(isFirstTimeJobPost.equals(false)) {
    			commonResponse.setStatus_code(200);
    			commonResponse.setMsg("Jobs Updated Successfully");
    			writer.print(gson.toJson(commonResponse));
    			writer.close();
    			return;
    		} else {
    			commonResponse.setStatus_code(200);
    			commonResponse.setMsg("Jobs Posted Successfully");
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
	
	@RequestMapping({ "/view-jobs" })
	public String view_jobs(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HashMap<String, String> accountMap = null;
		
		try {
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if (accountMap != null && accountMap.get("user_type_id").equalsIgnoreCase(Utils.adminId.toString())) {

				String id = request.getParameter("id");
				
				JobMaster jobMaster = null;

				if (id != null) {
					jobMaster = jobMasterDAO.getJobsById(Integer.parseInt(id));
					request.setAttribute("jobMaster", jobMaster);
				}
				
				List<CandidateandJobResponse> candidateresponseList = new ArrayList<CandidateandJobResponse>();
				
				if(id != null) {
					
					List<Object[]> object_list = jobMasterDAO.getJobApplicationByJobCatId(Integer.parseInt(id));
					
					for (Object[] objects : object_list) 
	    			{
	    				Integer candidate_id = (Integer) objects[0];
	    				Integer job_id = (Integer) objects[1];
	    				String name = String.valueOf(objects[2]);
	    				String email = String.valueOf(objects[3]);
	    				String mobile = String.valueOf(objects[4]);
	    				String total_experience = String.valueOf(objects[5]);
	    				String key_skills = String.valueOf(objects[6]);
	    				String resume = String.valueOf(objects[7]);
	    				Date created_date = (Date) objects[8];
	    				
	    				CandidateandJobResponse candidate = new CandidateandJobResponse();
	    				candidate.setId(candidate_id);
	    				candidate.setJob_id(job_id);
	    				candidate.setName(name);
	    				candidate.setEmail(email);
	    				candidate.setMobile(mobile);
	    				candidate.setTotal_experience(total_experience);
	    				candidate.setKey_skills(key_skills);
	    				candidate.setResume(resume);
	    				candidate.setCreated_date(created_date);
	    				candidateresponseList.add(candidate);
	    			}					
					
					
					request.setAttribute("candidate", candidateresponseList);
				}
				
			/*	List<Candidate> candidate = null;
				System.out.println("id = "+id);
				if(id != null) {
					candidate = jobMasterDAO.getCandidateByJobId(Integer.parseInt(id));
					System.out.println("size"+candidate.size());
					request.setAttribute("candidate", candidate);
				}*/
				
				request.setAttribute("page", "view-jobs");

			} else {
				response.sendRedirect("/bootcamp");
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return "bootcamp.view.job";
	}
	
	@RequestMapping(value="/activateDeactivateJob")
	public void activateDeactivateJob(HttpServletRequest request, HttpServletResponse response) throws Exception 
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
	    		
	    		JobMaster jobMaster = null;
	    		
	    		if(!id.isEmpty()) 
	    		{
	    			jobMaster = jobMasterDAO.getJobsById(Integer.parseInt(id));
	    		}
	    		
	    		Boolean active = jobMaster.getActive();
	    		
	    		if(active == true)
	    		{
	    			jobMaster.setActive(false);
	    		}else {
	    			jobMaster.setActive(true);
	    		}
   				
	    		jobMasterDAO.saveOrUpdateJobMaster(jobMaster);
	    		
	    		if(active == true) {
	    			
	    			Log log = new Log();
			 		log.setUser_id(Integer.parseInt(user_id));
			 		log.setUser_name(user_name);
			 		log.setTitle("Job Deactivated");
			 		log.setDescription(user_name+" has Deactivated the following job - ("+jobMaster.getRole_name()+")");
			 		log.setActivity_time(new Date());
			 		String ipAddr = Utils.getIpAddr(request);
					if(ipAddr == null){ipAddr="";}
			 		log.setIp_addr(ipAddr);
			 		logDAO.saveLog(log);
			 		
			 		commonResponse.setStatus("SUCCESS");
	    			commonResponse.setStatus_code(200);
	    			commonResponse.setMsg("The Job deactivated Successfully");
	    			writer.print(gson.toJson(commonResponse));
	    			writer.close();
	    			return;
	    			
	    		} else {
	    			
	    			Log log = new Log();
			 		log.setUser_id(Integer.parseInt(user_id));
			 		log.setUser_name(user_name);
			 		log.setTitle("Job Activated");
			 		log.setDescription(user_name+" has activated the following job - ("+jobMaster.getRole_name()+")");
			 		log.setActivity_time(new Date());
			 		String ipAddr = Utils.getIpAddr(request);
					if(ipAddr == null){ipAddr="";}
			 		log.setIp_addr(ipAddr);
			 		logDAO.saveLog(log);
			 		
	    			commonResponse.setStatus("SUCCESS");
	    			commonResponse.setStatus_code(200);
	    			commonResponse.setMsg("The Job Activated Successfully.");
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
	
	@RequestMapping({"/assign-jobs" })
	public String assign_jobs(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		List<Integer> jobCandidateIdList = new ArrayList<Integer>();
		try
		{	
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_id").equalsIgnoreCase(Utils.adminId.toString()))) {
				
				String id = request.getParameter("id");
				String source = request.getParameter("source");
				
				request.setAttribute("source",source);
				
				
				JobMaster jobMaster = null;
				List<JobApplication> jobApplication = null;

				if (id != null) {
					jobMaster = jobMasterDAO.getJobsById(Integer.parseInt(id));
					request.setAttribute("jobMaster", jobMaster);
				}
				
				if(id != null) {
					jobApplication = jobMasterDAO.getJobApplicationByJobId(Integer.parseInt(id));
					request.setAttribute("jobApplication", jobApplication);
					
					for (JobApplication jobApplication2 : jobApplication) {
						jobCandidateIdList.add(jobApplication2.getCandidate_id());
					}
					
				}
				
				List<Candidate> candidateList = candidateDAO.getAllCandidate();
				
				for (Candidate candidate : candidateList) {
					if(jobCandidateIdList.contains(candidate.getId())) {
						candidate.setIsJobAssigned(true);
					}
				}
				
				request.setAttribute("candidateList", candidateList);
				
				request.setAttribute("page", "assign-jobs");
				
			}
			else {
				response.sendRedirect("/bootcamp");
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "bootcamp.assign.jobs";
	}
	
	@RequestMapping(value = "/assignJobToCandidate", method = RequestMethod.POST)
	public void assignJobToCandidate(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
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
				System.out.println("user_id = "+user_id);
				commonResponse = new CommonResponse();
	    		gson = new Gson();	
				
				String jobMaster_id = request.getParameter("jobMaster_id");
				String candidateStr = request.getParameter("candidateStr");
				
				System.out.println("candidateStr = "+ candidateStr);
				
				String[]  array = candidateStr.split(",");
				
				JobMaster jobMaster = null;
				
				if(jobMaster_id == null) {jobMaster_id = "";}
				
				if(jobMaster_id != null || !jobMaster_id.isEmpty()) {
					jobMaster = jobMasterDAO.getJobsById(Integer.parseInt(jobMaster_id));
				}
				
				if(candidateStr.isEmpty()) 
	    		{
					jobMasterDAO.getJobCandidateUnCheck(jobMaster_id);
					
					for(int i=0;i<array.length;i++)
	    			{
						Candidate candidate = candidateDAO.getCandidateById(Integer.parseInt(array[i]));
	      	          	JobApplication jobApplication = jobMasterDAO.getJobApplicationByCandidateAndJobId(Integer.parseInt(array[i]), Integer.parseInt(jobMaster_id));
	    	          
		      	        Log log = new Log();
				 		log.setUser_id(Integer.parseInt(user_id));
				 		log.setUser_name(user_name);
				 		log.setTitle("Job Unassigned to Candidates");
				 		log.setDescription(user_name+" has Unassigned the job ("+jobApplication.getJob_title()+") to following candidate - ("+candidate.getName()+")");
				 		log.setActivity_time(new Date());
				 		String ipAddr = Utils.getIpAddr(request);
						if(ipAddr == null){ipAddr="";}
				 		log.setIp_addr(ipAddr);
				 		logDAO.saveLog(log);
	    			}
					
	    			commonResponse.setStatus("SUCCESS");
	    			commonResponse.setStatus_code(200);
	    			commonResponse.setMsg("Job was Unassigned to all candidates");
	    			writer.print(gson.toJson(commonResponse));
	    			writer.close();
	    			return;
	    		}else {
	    			
	    			List<JobApplication> jobApplicationNotInSelectedId = jobMasterDAO.setJobApplicationInactiveByCandidateAndJobId(candidateStr, Integer.parseInt(jobMaster_id));
	    			
	    			for (JobApplication jobApplication : jobApplicationNotInSelectedId) {
		    			
	    				jobApplication.setCandidate_id(0);
	    				jobApplication.setActive(false);
	    				jobMasterDAO.saveOrUpdateJobApplication(jobApplication);
					}
	    			
	    			for(int i=0;i<array.length;i++)
	    			{
	    			  System.out.println("for");
	    			  Candidate candidate = candidateDAO.getCandidateById(Integer.parseInt(array[i]));
	      	          JobApplication jobApplication = jobMasterDAO.getJobApplicationByCandidateAndJobId(Integer.parseInt(array[i]), Integer.parseInt(jobMaster_id));
	    	          
	      	          if(jobApplication != null) {
	    	        	  jobApplication.setCandidate_id(Integer.parseInt(array[i]));
	    	        	  jobApplication.setCandidate_name(candidate.getName());
	    	        	  jobApplication.setCandidate_email(candidate.getEmail());
	    	        	  jobApplication.setCandidate_mobile(candidate.getMobile());
	    	        	  jobApplication.setJob_id(Integer.parseInt(jobMaster_id));
	    	        	  jobApplication.setJob_title(jobMaster.getRole_name());
	    	        	  jobApplication.setApplied_date(new Date());
	    	        	  jobApplication.setActive(true);
	    	        	  
	    	        	  jobMasterDAO.saveOrUpdateJobApplication(jobApplication);
	    	        	  
	    	        	  Log log = new Log();
	  			 		  log.setUser_id(Integer.parseInt(user_id));
	  			 		  log.setUser_name(user_name);
	  			 		  log.setTitle("Job assigned to Candidates");
	  			 		  log.setDescription(user_name+" has assigned the job ("+jobApplication.getJob_title()+") to following candidate - ("+candidate.getName()+")");
	  			 		  log.setActivity_time(new Date());
	  			 		  String ipAddr = Utils.getIpAddr(request);
	  					  if(ipAddr == null){ipAddr="";}
	  			 		  log.setIp_addr(ipAddr);
	  			 		  logDAO.saveLog(log);
	    	        	  
	    	          }else {
	    	        	  jobApplication = new JobApplication();
	    	        	  jobApplication.setCandidate_id(Integer.parseInt(array[i]));
	    	        	  jobApplication.setCandidate_name(candidate.getName());
	    	        	  jobApplication.setCandidate_email(candidate.getEmail());
	    	        	  jobApplication.setCandidate_mobile(candidate.getMobile());
	    	        	  jobApplication.setJob_id(Integer.parseInt(jobMaster_id));
	    	        	  jobApplication.setJob_title(jobMaster.getRole_name());
	    	        	  jobApplication.setApplied_date(new Date());
	    	        	  jobApplication.setActive(true);
	    	        	  
	    	        	  jobMasterDAO.saveOrUpdateJobApplication(jobApplication);
	    	        	  
	    	        	  Log log = new Log();
	  			 		  log.setUser_id(Integer.parseInt(user_id));
	  			 		  log.setUser_name(user_name);
	  			 		  log.setTitle("Job assigned to Candidates");
	  			 		  log.setDescription(user_name+" has assigned the job ("+jobApplication.getJob_title()+") to following candidate - ("+candidate.getName()+")");
	  			 		  log.setActivity_time(new Date());
	  			 		  String ipAddr = Utils.getIpAddr(request);
	  					  if(ipAddr == null){ipAddr="";}
	  			 		  log.setIp_addr(ipAddr);
	  			 		  logDAO.saveLog(log);
	    	          }
	    			}
	    			
	    			commonResponse.setStatus("SUCCESS");
	      			commonResponse.setStatus_code(200);
	      			commonResponse.setMsg("This Jobs Was Assigned Selected Candidates Successfully.");
	      			writer.print(gson.toJson(commonResponse));
	      			writer.close();
	      			return;
	    		}
			} 
			else {
				response.sendRedirect("/bootcamp");
			}
		}
		
		catch (Exception ex) {
			
			ex.printStackTrace();
       		commonResponse.setStatus("FAILURE");
			commonResponse.setStatus_code(400);
			writer.print(gson.toJson(commonResponse));
			writer.close();
			return;
		}
	}

	
}
