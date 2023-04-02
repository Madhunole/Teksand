package com.teksands.user.controller;

import java.io.PrintWriter;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;
import com.teksands.admin.dao.AdminDAO;
import com.teksands.bootcamp.dao.CandidateDAO;
import com.teksands.bootcamp.dao.JobMasterDAO;
import com.teksands.bootcamp.model.Brand;
import com.teksands.bootcamp.model.Candidate;
import com.teksands.bootcamp.model.CmsUser;
import com.teksands.bootcamp.model.JobApplication;
import com.teksands.bootcamp.model.JobMaster;
import com.teksands.user.dao.BlogsDAO;
import com.teksands.user.dao.CommonDAO;
import com.teksands.user.dao.CourseDAO;
import com.teksands.user.model.Blogs;
import com.teksands.user.model.Contactus;
import com.teksands.user.model.Countries;
import com.teksands.user.model.Courses;
import com.teksands.user.model.ItStaffing;
import com.teksands.user.model.Jobs;
import com.teksands.user.response.CommonResponse;
import com.teksands.utils.Properties;
import com.teksands.utils.SendEmailUtil;
import com.teksands.utils.Utils;


@Controller
public class HomeController{	
	
	@Autowired
	CourseDAO courseDAO;
	
	@Autowired
	CommonDAO commonDAO;
	
	@Autowired
	SendEmailUtil sendEmailUtil;
	
	@Autowired
	BlogsDAO blogsDAO;
	
	@Autowired
	CandidateDAO candidateDAO;
	
	@Autowired
	AdminDAO adminDAO;
	
	@Autowired
	JobMasterDAO jobMasterDAO;
	
	@Autowired
	Properties properties;
	
	@RequestMapping({ "", "/", "/home" })
	public String root(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		try
		{	
			String pageid = request.getParameter("pageid");

			if(pageid == null){pageid = "1";}
			
			request.setAttribute("pageid", pageid);
			
            int page_id = Integer.parseInt(pageid);
            
            String course_tags_1 = "Data Science";
            String course_tags_2 = "Machine Learning";
            String course_tags_3 = "DevOps";
            String course_tags_4 = "Trending";
            
			List<Courses> coursesList1 = courseDAO.getAllCoursesByPageId((page_id - 1), course_tags_1);
			request.setAttribute("coursesList1", coursesList1);
			
			List<Courses> coursesList2 = courseDAO.getAllCoursesByPageId((page_id - 1), course_tags_2);
			request.setAttribute("coursesList2", coursesList2);
			
			List<Courses> coursesList3 = courseDAO.getAllCoursesByPageId((page_id - 1), course_tags_3);
			request.setAttribute("coursesList3", coursesList3);
			
			List<Courses> coursesList4 = courseDAO.getAllCoursesByPageId((page_id - 1), course_tags_4);
			request.setAttribute("coursesList4", coursesList4);
			
			
			String blogs_tags_1 = "Machine Learning";
			String blogs_tags_2 = "Data Science";
			String blogs_tags_3 = "Deep Learning";
			String blogs_tags_4 = "Python";
			String blogs_tags_5 = "DevOps";
			
			List<Blogs> article_tags_1 = blogsDAO.getAllBlogsByTags((page_id - 1), blogs_tags_1);
			request.setAttribute("article_tags_1", article_tags_1);
			
			List<Blogs> article_tags_2 = blogsDAO.getAllBlogsByTags((page_id - 1), blogs_tags_2);
			request.setAttribute("article_tags_2", article_tags_2);
			
			List<Blogs> article_tags_3 = blogsDAO.getAllBlogsByTags((page_id - 1), blogs_tags_3);
			request.setAttribute("article_tags_3", article_tags_3);
			
			List<Blogs> article_tags_4 = blogsDAO.getAllBlogsByTags((page_id - 1), blogs_tags_4);
			request.setAttribute("article_tags_4", article_tags_4);
			
			List<Blogs> article_tags_5 = blogsDAO.getAllBlogsByTags((page_id - 1), blogs_tags_5);
			request.setAttribute("article_tags_5", article_tags_5);
			
			request.setAttribute("page", "home");
			
			

		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "user.home";
	}
	
	@RequestMapping("/corporate-training")
	public String corporate_training(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		try
		{	
			
			request.setAttribute("page", "corporate");
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "user.corporate.training";
	}
	@RequestMapping("/become-a-trainer")
	
	public String become_a_trainer(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		try
		{	
			List<Countries> countriesList = commonDAO.getCountries();
			request.setAttribute("countries", countriesList);
			
			request.setAttribute("page", "trainer");
			
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "user.become.trainer";
	}
	
	@RequestMapping("/contributor")
	public String contributor(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		try
		{	
			List<Countries> countriesList = commonDAO.getCountries();
			request.setAttribute("countries", countriesList);
			
			request.setAttribute("page", "contributor");
			
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "user.contributor";
	}
	@RequestMapping("/privacy-policy")
	public String privacy_policy(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		try
		{	
			request.setAttribute("page", "privacy-policy");
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "user.privacy.policy";
	}
	@RequestMapping("/terms-of-use")
	public String terms_of_use(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		try
		{	
			request.setAttribute("page", "terms-ofuse");
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "user.terms.ofuse";
	}
	@RequestMapping("/contact-us")
	public String contact_us(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		try
		{	
			request.setAttribute("page", "contact");
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "user.contact.us";
	}
	@RequestMapping("/videos")
	public String videos(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		try
		{	
			request.setAttribute("page", "videos");
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "user.videos";
	}
	@RequestMapping("/login")
	public String login(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		try
		{	
			request.setAttribute("page", "login");
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "user.login";
	}
	@RequestMapping("/upcoming-live-courses")
	public String live_courses(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		try
		{	
			String pageid = request.getParameter("pageid");
			if(pageid == null){pageid = "1";}
			request.setAttribute("pageid", pageid);
            int page_id = Integer.parseInt(pageid);
			
			List<Courses> coursesList = courseDAO.getAllCoursesByPageId(page_id - 1);
			request.setAttribute("coursesList", coursesList);
			
			request.setAttribute("page", "live-courses");
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "user.live.courses";
	}
	@RequestMapping("/work-with-us")
	public String careers(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		try
		{	
			List<Countries> countriesList = commonDAO.getCountries();
			request.setAttribute("countries", countriesList);
			
			request.setAttribute("page", "careers");
			
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "user.careers";
	}
	
	@RequestMapping("/internships")
	public String internships(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		try
		{	
			
			request.setAttribute("page", "internships");
			
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "user.internships";
	}
	
	@RequestMapping("/contest")
	public String contest(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		try
		{	
			
			request.setAttribute("page", "contest");
			
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "user.contest";
	}
	
	@RequestMapping("/contest-details")
	public String contest_details(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		try
		{	
			
			request.setAttribute("page", "contest-details");
			
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "user.contest.details";
	}
	
	///.well-known/pki-validation/godaddy.html
 	@RequestMapping(value="/.well-known/pki-validation/godaddy.html")
	public String asdsadsadsada(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		try
		{	
			
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		
		return "user.godaddy";
	}
 	
 	
 	//Email Authentication
	@RequestMapping(value="/c60c2419295e40a7df54e50ecaff57d6.html")
	public String authentication(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		try
		{	
			
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		
		return "user.email.authentication";
	}
 	 	
 	
 	@RequestMapping(value = "/error", method = RequestMethod.GET)
    public String renderErrorPage(HttpServletRequest request, HttpServletResponse response) {
        
        String errorMsg = "";
        int httpErrorCode = getErrorCode(request);
 
        switch (httpErrorCode) {
            case 400: {
                errorMsg = "Http Error Code: 400. Bad Request";
                break;
            }
            case 401: {
                errorMsg = "Http Error Code: 401. Unauthorized";
                break;
            }
            case 404: {
                errorMsg = "Http Error Code: 404. Resource not found";
                break;
            }
            case 500: {
                errorMsg = "Http Error Code: 500. Internal Server Error";
                break;
            }
            default: {
            	errorMsg = "Unknown Error, Please Contact Admin";
                break;
            }
        }
        request.setAttribute("errorMsg", errorMsg);
		
		request.setAttribute("page", "error");
        
        return "user.error";
    }
 	
 	private int getErrorCode(HttpServletRequest httpRequest) {
    	
    	if(httpRequest.getAttribute("javax.servlet.error.status_code") != null)
    	{
    		return (Integer) httpRequest.getAttribute("javax.servlet.error.status_code");
    	}
    	else
    	{
    		return 0;
    	}
    }
 	
 	@RequestMapping("/ebp")
	public String ebp(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		try
		{	
			request.setAttribute("page", "ebp-program");
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "landing.ebp";
	}
 	
 	@RequestMapping("/ebp-try")
	public String ebp_try(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		try
		{	
			request.setAttribute("page", "ebp-program");
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "landing.ebp.try";
	}
 	
 	@RequestMapping("/propel")
	public String propel(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		try
		{	
			request.setAttribute("page", "propel-program");
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "landing.propel";
	}
 	
 	@RequestMapping("/accel-hire")
	public String accel_hire(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		try
		{	
			request.setAttribute("page", "accel-program");
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "landing.accel";
	}
 	
 	@RequestMapping("/sitemap")
	public String sitemap(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		try
		{	
			request.setAttribute("page", "sitemap");
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "user.sitemap";
	}
 	
 	@RequestMapping("/it-staffing")
	public String it_staffing(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		try
		{	
			
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "landing.it.staffing";
	}
 	
 	@RequestMapping(value="/saveItStaffingContacts")
	public void saveItStaffingContacts(HttpServletRequest request, HttpServletResponse response) throws Exception 
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
    		
    		ItStaffing itStaffing = new ItStaffing();
    		itStaffing.setName(name);
    		itStaffing.setEmail(email);
    		itStaffing.setMobile(mobile);
    		itStaffing.setCreated_date(new Date());
    		itStaffing.setCompany_name(company);
    		itStaffing.setRequirement(requirements);
    		itStaffing.setActive(true);
    		
    		boolean result = commonDAO.saveItStaffingContacts(itStaffing);
    		
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
 	
 	@RequestMapping("/register-candidate")
	public String register_candidate(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		try
		{	
			String domain = properties.getHostDomainUrl();
			request.setAttribute("resume_path",  domain + "resources/cms/img/candidate-resumes/");
			
			String auth_code = request.getParameter("jmt1oray");
			
			JobMaster jobs = jobMasterDAO.getJobsByAuthCode(auth_code);
			
			if(jobs != null) {
				request.setAttribute("job_title", jobs.getRole_name());
				request.setAttribute("auth_code", auth_code);
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "user.register.candidate";
	}
 	
 	@RequestMapping(value="/saveCandidateFromWebsite")
	public void saveCandidateFromWebsite(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;	
		JobMaster jobs = null;
		try 
   		{
			commonResponse = new CommonResponse();
    		gson = new Gson();	
    		
    		String auth_code = request.getParameter("auth_code");
    		String can_name = request.getParameter("can_name");
    		String can_email = request.getParameter("can_email");
    		String can_mobile = request.getParameter("can_mobile");
    		String can_key_skills = request.getParameter("can_key_skills");
    		String can_company_name = request.getParameter("can_company_name");
    		String can_ctc = request.getParameter("can_ctc");
    		String can_last_working_date = request.getParameter("can_last_working_date");
    		String can_experience = request.getParameter("can_experience");
    		String can_certification = request.getParameter("can_certification");
    		String can_language = request.getParameter("can_language");
    		String can_bachelors_degree = request.getParameter("can_bachelors_degree");
    		String can_bachelors_degree_stream = request.getParameter("can_bachelors_degree_stream");
    		String can_bachelors_degree_cgpa = request.getParameter("can_bachelors_degree_cgpa");
    		String can_ug_graduation_year = request.getParameter("can_ug_graduation_year");
    		String can_pg_degree = request.getParameter("can_pg_degree");
    		String can_pg_year = request.getParameter("can_pg_year");
    		String can_how_find_me = request.getParameter("can_how_find_me");
    		String para_resume = request.getParameter("para_resume");
    		String can_summary = request.getParameter("can_summary");
    		String can_last_working_day = request.getParameter("can_last_working_day");
    		String can_current_location = request.getParameter("can_current_location");
    		String can_preferred_location = request.getParameter("can_preferred_location");
    		
    		if(auth_code == null) {auth_code = "";}
    		if(can_name == null) {can_name = "";}
    		if(can_email == null) {can_email = "";}
    		if(can_mobile == null) {can_mobile = "";}
    		if(can_key_skills == null) {can_key_skills = "";}
    		if(can_company_name == null) {can_company_name = "";}
    		if(can_ctc == null) {can_ctc = "";}
    		if(can_last_working_date == null) {can_last_working_date = "";}
    		if(can_experience == null) {can_experience = "";}
    		if(can_certification == null) {can_certification = "";}    	
    		if(can_language == null) {can_language = "";}
    		if(can_bachelors_degree == null) {can_bachelors_degree = "";}
    		if(can_bachelors_degree_stream == null) {can_bachelors_degree_stream = "";}
    		if(can_bachelors_degree_cgpa == null) {can_bachelors_degree_cgpa = "";}
    		if(can_ug_graduation_year == null) {can_ug_graduation_year = "";}
    		if(can_pg_degree == null) {can_pg_degree = "";}
    		if(can_pg_year == null) {can_pg_year = "";}
    		if(can_how_find_me == null) {can_how_find_me = "";}
    		if(para_resume == null) {para_resume = "";}
    		if(can_last_working_day == null) {can_last_working_day = "";}
    		if(can_summary == null) {can_summary = "";}
    		if(can_current_location == null) {can_current_location = "";}
    		if(can_preferred_location == null) {can_preferred_location = "";}
    		
    		auth_code = auth_code.trim();
    		can_name = can_name.trim();
    		can_email = can_email.trim();
    		can_mobile = can_mobile.trim();
    		can_key_skills = can_key_skills.trim();
    		can_company_name = can_company_name.trim();
    		can_ctc = can_ctc.trim();
    		can_last_working_date = can_last_working_date.trim();
    		can_experience = can_experience.trim();
    		can_certification = can_certification.trim();
    		can_language = can_language.trim();
    		can_bachelors_degree = can_bachelors_degree.trim();
    		can_bachelors_degree_stream = can_bachelors_degree_stream.trim();
    		can_bachelors_degree_cgpa = can_bachelors_degree_cgpa.trim();
    		can_ug_graduation_year = can_ug_graduation_year.trim();
    		can_pg_degree = can_pg_degree.trim();
    		can_pg_year = can_pg_year.trim();
    		can_how_find_me = can_how_find_me.trim();
    		para_resume = para_resume.trim();
    		can_last_working_day = can_last_working_day.trim();
    		can_summary = can_summary.trim();
    		can_current_location = can_current_location.trim();
    		can_preferred_location = can_preferred_location.trim();
    		
    		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
    		
    		Date can_last_working_dayStr = null;
    		
    		if(!can_last_working_day.isEmpty()) {
    			can_last_working_dayStr = new SimpleDateFormat("yyyy-MM-dd").parse(can_last_working_day);
    		}
    		
    		if(!auth_code.isEmpty()) {
    			jobs = jobMasterDAO.getJobsByAuthCode(auth_code);
    		}
    		
    		URL url = null;
			
			if(!para_resume.isEmpty()) {
				url = new URL(para_resume);
			}
			
			String fileName = null;
			
			if(url != null) {
				fileName = FilenameUtils.getName(url.getPath());
			}
			
			Candidate candidate = new Candidate();
    		candidate.setJob_id(jobs.getId());
    		candidate.setJob_title(jobs.getRole_name());
    		candidate.setName(can_name);
    		candidate.setEmail(can_email);
    		candidate.setMobile(can_mobile);
    		candidate.setKey_skills(can_key_skills);
    		candidate.setCurr_company_name(can_company_name);
    		candidate.setAnnual_salary(can_ctc);
    		candidate.setNotice_period(can_last_working_date);
    		candidate.setTotal_experience(can_experience);
    		candidate.setCertifications(can_certification);
    		candidate.setProgram_language(can_language);
    		candidate.setLast_working_day(can_last_working_dayStr);
    		candidate.setUg_degree(can_bachelors_degree);
    		candidate.setUg_degree_stream(can_bachelors_degree_stream);
    		candidate.setUg_degree_cgpa(can_bachelors_degree_cgpa);
    		candidate.setUg_graduation_year(can_ug_graduation_year);
    		candidate.setPg_degree(can_pg_degree);
    		candidate.setPg_graduation_year(can_pg_year);
    		candidate.setHow_find_me(can_how_find_me);
    		candidate.setResume(para_resume);
    		
    		if(fileName != null) {
    			candidate.setResume_file_name(fileName);
			}
    		
    		candidate.setCurrent_location(can_current_location);
    		candidate.setPreferred_location(can_preferred_location);
    		candidate.setCreated_date(new Date());
    		candidate.setSummary(can_summary);
    		candidate.setActive(true);
    		candidateDAO.saveOrUpdateCandidate(candidate);
    		
    		JobApplication jobApplication = new JobApplication();
    		jobApplication.setCandidate_id(candidate.getId());
    		jobApplication.setJob_id(jobs.getId());
    		jobApplication.setCandidate_name(candidate.getName());
    		jobApplication.setCandidate_email(candidate.getEmail());
    		jobApplication.setCandidate_mobile(candidate.getMobile());
    		jobApplication.setJob_title(jobs.getRole_name());
    		jobApplication.setApplied_date(new Date());
    		jobApplication.setActive(true);
    		
    		jobMasterDAO.saveOrUpdateJobApplication(jobApplication);
    		
    		commonResponse.setStatus("SUCCESS");
			commonResponse.setStatus_code(200);
			commonResponse.setMsg("We have received your enquiry and will respond to you shortly");
			writer.print(gson.toJson(commonResponse));
			writer.close();
			return;
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
 	
 	
 	@RequestMapping(value="/saveCandidateFromJob")
	public void saveCandidateFromJob(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;	
		JobMaster jobs = null;
		try 
   		{
			commonResponse = new CommonResponse();
    		gson = new Gson();	
    		
    		String auth_code = request.getParameter("auth_code");
    		String can_name = request.getParameter("can_name");
    		String can_email = request.getParameter("can_email");
    		String can_mobile = request.getParameter("can_mobile");
    		String can_key_skills = request.getParameter("can_key_skills");
    		String can_company_name = request.getParameter("can_company_name");
    		String can_ctc = request.getParameter("can_ctc");
    		String can_last_working_date = request.getParameter("can_last_working_date");
    		String can_experience = request.getParameter("can_experience");
    		String can_certification = request.getParameter("can_certification");
    		String can_language = request.getParameter("can_language");
    		String can_bachelors_degree = request.getParameter("can_bachelors_degree");
    		String can_bachelors_degree_stream = request.getParameter("can_bachelors_degree_stream");
    		String can_bachelors_degree_cgpa = request.getParameter("can_bachelors_degree_cgpa");
    		String can_ug_graduation_year = request.getParameter("can_ug_graduation_year");
    		String can_pg_degree = request.getParameter("can_pg_degree");
    		String can_pg_year = request.getParameter("can_pg_year");
    		String can_how_find_me = request.getParameter("can_how_find_me");
    		String para_resume = request.getParameter("para_resume");
    		String can_summary = request.getParameter("can_summary");
    		String can_last_working_day = request.getParameter("can_last_working_day");
    		String can_current_location = request.getParameter("can_current_location");
    		String can_preferred_location = request.getParameter("can_preferred_location");
    		
    		if(auth_code == null) {auth_code = "";}
    		if(can_name == null) {can_name = "";}
    		if(can_email == null) {can_email = "";}
    		if(can_mobile == null) {can_mobile = "";}
    		if(can_key_skills == null) {can_key_skills = "";}
    		if(can_company_name == null) {can_company_name = "";}
    		if(can_ctc == null) {can_ctc = "";}
    		if(can_last_working_date == null) {can_last_working_date = "";}
    		if(can_experience == null) {can_experience = "";}
    		if(can_certification == null) {can_certification = "";}    	
    		if(can_language == null) {can_language = "";}
    		if(can_bachelors_degree == null) {can_bachelors_degree = "";}
    		if(can_bachelors_degree_stream == null) {can_bachelors_degree_stream = "";}
    		if(can_bachelors_degree_cgpa == null) {can_bachelors_degree_cgpa = "";}
    		if(can_ug_graduation_year == null) {can_ug_graduation_year = "";}
    		if(can_pg_degree == null) {can_pg_degree = "";}
    		if(can_pg_year == null) {can_pg_year = "";}
    		if(can_how_find_me == null) {can_how_find_me = "";}
    		if(para_resume == null) {para_resume = "";}
    		if(can_last_working_day == null) {can_last_working_day = "";}
    		if(can_summary == null) {can_summary = "";}
    		if(can_current_location == null) {can_current_location = "";}
    		if(can_preferred_location == null) {can_preferred_location = "";}
    		
    		auth_code = auth_code.trim();
    		can_name = can_name.trim();
    		can_email = can_email.trim();
    		can_mobile = can_mobile.trim();
    		can_key_skills = can_key_skills.trim();
    		can_company_name = can_company_name.trim();
    		can_ctc = can_ctc.trim();
    		can_last_working_date = can_last_working_date.trim();
    		can_experience = can_experience.trim();
    		can_certification = can_certification.trim();
    		can_language = can_language.trim();
    		can_bachelors_degree = can_bachelors_degree.trim();
    		can_bachelors_degree_stream = can_bachelors_degree_stream.trim();
    		can_bachelors_degree_cgpa = can_bachelors_degree_cgpa.trim();
    		can_ug_graduation_year = can_ug_graduation_year.trim();
    		can_pg_degree = can_pg_degree.trim();
    		can_pg_year = can_pg_year.trim();
    		can_how_find_me = can_how_find_me.trim();
    		para_resume = para_resume.trim();
    		can_last_working_day = can_last_working_day.trim();
    		can_summary = can_summary.trim();
    		can_current_location = can_current_location.trim();
    		can_preferred_location = can_preferred_location.trim();
    		
    		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
    		
    		Date can_last_working_dayStr = null;
    		
    		if(!can_last_working_day.isEmpty()) {
    			can_last_working_dayStr = new SimpleDateFormat("yyyy-MM-dd").parse(can_last_working_day);
    		}
    		
    		if(!auth_code.isEmpty()) {
    			jobs = jobMasterDAO.getJobsByAuthCode(auth_code);
    		}
    		
    		URL url = null;
			
			if(!para_resume.isEmpty()) {
				url = new URL(para_resume);
			}
			
			String fileName = null;
			
			if(url != null) {
				fileName = FilenameUtils.getName(url.getPath());
			}
			
			String password = Utils.getAutoPassword();
			String enc_pass = Utils.EncodeString(password);
			
			Brand brand = null;
			brand = candidateDAO.getBrandByName("Teksands");
			CmsUser user = new CmsUser();
			if(brand != null)
			{	
				user.setBrand_id(brand.getId());
			}
    		user.setName(can_name);
    		user.setEmail(can_email);
    		user.setMobile(can_mobile);
    		user.setPassword_encrypted(enc_pass);
    		user.setUser_type("candidate");
    		user.setUser_type_id(Utils.candidateId);
    		user.setCreated_date(new Date());
    		user.setLogin_date(new Date());
    		user.setActive(true);    		
    		candidateDAO.saveOrUpdateCmsUser(user);
    		
			Candidate candidate = new Candidate();
    		candidate.setJob_id(jobs.getId());
    		candidate.setBrand_id(brand.getId());
    		candidate.setUser_id(user.getId());
    		candidate.setJob_title(jobs.getRole_name());
    		candidate.setName(can_name);
    		candidate.setEmail(can_email);
    		candidate.setMobile(can_mobile);
    		candidate.setKey_skills(can_key_skills);
    		candidate.setCurr_company_name(can_company_name);
    		candidate.setAnnual_salary(can_ctc);
    		candidate.setNotice_period(can_last_working_date);
    		candidate.setTotal_experience(can_experience);
    		candidate.setCertifications(can_certification);
    		candidate.setProgram_language(can_language);
    		candidate.setLast_working_day(can_last_working_dayStr);
    		candidate.setUg_degree(can_bachelors_degree);
    		candidate.setUg_degree_stream(can_bachelors_degree_stream);
    		candidate.setUg_degree_cgpa(can_bachelors_degree_cgpa);
    		candidate.setUg_graduation_year(can_ug_graduation_year);
    		candidate.setPg_degree(can_pg_degree);
    		candidate.setPg_graduation_year(can_pg_year);
    		candidate.setHow_find_me(can_how_find_me);
    		candidate.setResume(para_resume);
    		
    		if(fileName != null) {
    			candidate.setResume_file_name(fileName);
			}
    		
    		candidate.setCurrent_location(can_current_location);
    		candidate.setPreferred_location(can_preferred_location);
    		candidate.setCreated_date(new Date());
    		candidate.setSummary(can_summary);
    		candidate.setActive(true);
    		candidateDAO.saveOrUpdateCandidate(candidate);
    		
    		JobApplication jobApplication = new JobApplication();
    		jobApplication.setCandidate_id(candidate.getId());
    		jobApplication.setJob_id(jobs.getId());
    		jobApplication.setCandidate_name(candidate.getName());
    		jobApplication.setCandidate_email(candidate.getEmail());
    		jobApplication.setCandidate_mobile(candidate.getMobile());
    		jobApplication.setJob_title(jobs.getRole_name());
    		jobApplication.setApplied_date(new Date());
    		jobApplication.setActive(true);
    		
    		jobMasterDAO.saveOrUpdateJobApplication(jobApplication);
    		
    		commonResponse.setStatus("SUCCESS");
			commonResponse.setStatus_code(200);
			commonResponse.setMsg("We have received your enquiry and will respond to you shortly");
			writer.print(gson.toJson(commonResponse));
			writer.close();
			return;
		
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
 	@RequestMapping("/services")
	public String landing_page(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		try
		{	
			
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "user.services";
	}
 	@RequestMapping(value="/checkIfEmailAlreadyExistOrNot")
	public void checkIfEmailAlreadyExistOrNot(HttpServletRequest request, HttpServletResponse response) throws Exception 
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
    		
    		if(email == null) {email = "";}
    		
    		email = email.trim();    		
    		
    		Integer result = candidateDAO.checkEmailAlreadyExistOrNot(email);
    		System.out.println("result ===="+ result);
    		if(result == 1) 
    		{
    			commonResponse.setStatus("FAILURE");
    			commonResponse.setStatus_code(400);
    			commonResponse.setMsg("This Id is already present and active as another Brand Admin. Please choose a different id or Deactivate the other one.");
    			writer.print(gson.toJson(commonResponse));
    			writer.close();
    			return;
    		}
    		else if(result == 2)
    		{
    			commonResponse.setStatus("FAILURE");
    			commonResponse.setStatus_code(400);
    			commonResponse.setMsg("This Id is already present and active as another Brand Admin. Please choose a different id or Deactivate the other one.");
    			writer.print(gson.toJson(commonResponse));
    			writer.close();
    			return;
    		}
    		else {
    			commonResponse.setStatus("SUCCESS");
    			commonResponse.setStatus_code(200);
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