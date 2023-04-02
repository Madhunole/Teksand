package com.teksands.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.lang.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.teksands.admin.dao.AdminDAO;
import com.teksands.user.model.Article;
import com.teksands.user.model.Blogs;
import com.teksands.user.model.Career;
import com.teksands.user.model.Contactus;
import com.teksands.user.model.Contributor;
import com.teksands.user.model.CorporateEnquiry;
import com.teksands.user.model.Courses;
import com.teksands.user.model.EBPCandidate;
import com.teksands.user.model.Ebooks;
import com.teksands.user.model.EbooksDownload;
import com.teksands.user.model.EbpEmails;
import com.teksands.user.model.Internship;
import com.teksands.user.model.ItStaffing;
import com.teksands.user.model.Jobs;
import com.teksands.user.model.JobsApplications;
import com.teksands.user.model.Leads;
import com.teksands.user.model.Mentors;
import com.teksands.user.model.Trainers;
import com.teksands.user.model.WebinarContacts;
import com.teksands.user.model.Webinars;
import com.teksands.user.response.CommonResponse;
import com.teksands.utils.StatusMessage;
import com.teksands.utils.ViewHelper;
import com.teksands.utils.Properties;

@Controller

@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	AdminDAO adminDAO;
	
	
	@Autowired
	Properties properties;
	
	@RequestMapping("/dashboard")
	public String admin_page(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try
		{	

			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			
			if(accountMap != null) {
				
				List<Leads> leadsList = adminDAO.getLeadsCounts();
				String leadsCount = leadsList.toString().replace("[", "").replace("]", "");
				
				request.setAttribute("leadsCount", leadsCount);
				
				List<Contactus> contactusList = adminDAO.getContactsCounts();
				String contactsCount = contactusList.toString().replace("[", "").replace("]", "");
				
				request.setAttribute("contactsCount", contactsCount);
				
				List<Contributor> contributorList = adminDAO.getContributorCounts();
				String contributorCount = contributorList.toString().replace("[", "").replace("]", "");
				
				request.setAttribute("contributorCount", contributorCount);
				
				List<Trainers> trainersList = adminDAO.getTrainersCounts();
				String trainersCount = trainersList.toString().replace("[", "").replace("]", "");
				
				request.setAttribute("trainersCount", trainersCount);
				
				List<Career> careerList = adminDAO.getCareerCounts();
				String careerCount = careerList.toString().replace("[", "").replace("]", "");
				
				request.setAttribute("careerCount", careerCount);
				
				List<Internship> internshipList = adminDAO.getInternshipCounts();
				String internshipCount = internshipList.toString().replace("[", "").replace("]", "");
				
				request.setAttribute("internshipCount", internshipCount);
				
				List<EbooksDownload> ebooksDownloadList = adminDAO.getEbooksDownloadCounts();
				String ebooksDownloadCount = ebooksDownloadList.toString().replace("[", "").replace("]", "");
				
				request.setAttribute("ebooksDownloadCount", ebooksDownloadCount);
				
				List<JobsApplications> jobsApplicationsList = adminDAO.getJobsApplicationsCounts();
				String jobsApplicationsCount = jobsApplicationsList.toString().replace("[", "").replace("]", "");
				
				request.setAttribute("jobsApplicationsCount", jobsApplicationsCount);
				
				List<WebinarContacts> webinarContactsList = adminDAO.getWebinarContactsCounts();
				String webinarContactsCount = webinarContactsList.toString().replace("[", "").replace("]", "");
				
				request.setAttribute("webinarContactsCount", webinarContactsCount);
				
				List<Blogs> blogsList = adminDAO.getBlogsCounts();
				String blogsCount = blogsList.toString().replace("[", "").replace("]", "");
				
				request.setAttribute("blogsCount", blogsCount);
				
				List<Article> articleList = adminDAO.getArticleCounts();
				String articleCount = articleList.toString().replace("[", "").replace("]", "");
				
				request.setAttribute("articleCount", articleCount);
				
				List<Courses> coursesList = adminDAO.getCoursesCounts();
				String coursesCount = coursesList.toString().replace("[", "").replace("]", "");
				
				request.setAttribute("coursesCount", coursesCount);
				
				List<Ebooks> ebooksList = adminDAO.getEbooksCounts();
				String ebooksCount = ebooksList.toString().replace("[", "").replace("]", "");
				
				request.setAttribute("ebooksCount", ebooksCount);
				
				List<Jobs> jobsList = adminDAO.getJobsCounts();
				String jobsCount = jobsList.toString().replace("[", "").replace("]", "");
				
				request.setAttribute("jobsCount", jobsCount);
				
				List<Webinars> webinarsList = adminDAO.getWebinarsCounts();
				String webinarsCount = webinarsList.toString().replace("[", "").replace("]", "");
				
				request.setAttribute("webinarsCount", webinarsCount);
				
				List<Blogs> techArticleList = adminDAO.getAllBlogs();
				request.setAttribute("techArticleList", techArticleList);
				
				List<Article> blogArticleList = adminDAO.getAllArticles();
				request.setAttribute("shortreadsList", blogArticleList);
				
				List<Courses> coursesAllList = adminDAO.getAllCourses();
				request.setAttribute("coursesAllList", coursesAllList);
				
				List<Ebooks> ebooksAllList = adminDAO.getAllEbooks();
				request.setAttribute("ebooksAllList", ebooksAllList);
				
				List<Jobs> jobsAllList = adminDAO.getAllJobs();
				request.setAttribute("jobsAllList", jobsAllList);
				
				List<Webinars> webinarsAllList = adminDAO.getAllWebinars();
				request.setAttribute("webinarsAllList", webinarsAllList);		
				
				
				//System.out.println("leadsCount ----->" + leadsCount);
				
				request.setAttribute("page", "admin-home");
				
			} else {
				
				response.sendRedirect("/home");
			}			
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "admin.home";
	}
	
	@RequestMapping("/leads")
	public String leads(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try
		{	
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			
			if(accountMap != null) {
				
				List<Leads> leadsList = adminDAO.getAllLeads();
				request.setAttribute("leads", leadsList);
				
				request.setAttribute("page", "admin-leads");
				
			} else {
				
				response.sendRedirect("/home");
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "admin.leads";
	}
	
	@RequestMapping("/contacts")
	public String contacts(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try
		{	
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			
			if(accountMap != null) {
				
				List<Contactus> contactsList = adminDAO.getAllContacts();
				request.setAttribute("contacts", contactsList);
				
				request.setAttribute("page", "admin-contacts");
				
			} else {
				
				response.sendRedirect("/home");
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "admin.contacts";
	}
	@RequestMapping("/contributor")
	public String contributor(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try
		{	
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			
			if(accountMap != null) {
				
				List<Contributor> contributorList = adminDAO.getAllContributor();
				request.setAttribute("contributor", contributorList);
				
				request.setAttribute("page", "admin-contributor");
				
			} else {
				
				response.sendRedirect("/home");
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "admin.contributor";
	}
	@RequestMapping("/trainers")
	public String trainers(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try
		{	
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			
			if(accountMap != null) {
				
				List<Trainers> trainersList = adminDAO.getAllTrainers();
				request.setAttribute("trainers", trainersList);
				
				request.setAttribute("page", "admin-trainers");
				
			} else {
				
				response.sendRedirect("/home");
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "admin.trainers";
	}
	
	
	@RequestMapping(value="/getTrainerById")
	public void saveTrainers(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;	
		try 
   		{
			commonResponse = new CommonResponse();
    		gson = new Gson();	
    		
    		String id = request.getParameter("id");
    		System.out.println("id  = " + id);
    		
    		Trainers trainers = adminDAO.getTrainerById(Integer.parseInt(id));
    	    
    		if(trainers != null) {
    			commonResponse.setStatus("SUCCESS");
    			commonResponse.setStatus_code(200);
    			writer.print(gson.toJson(trainers));
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
	
	@RequestMapping("/careers")
	public String careers(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try
		{	
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			
			if(accountMap != null) {
				
				List<Career> careerList = adminDAO.getAllCareer();
				request.setAttribute("careers", careerList);
				
				request.setAttribute("page", "admin-careers");
				
			} else {
				
				response.sendRedirect("/home");
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "admin.careers";
	}
	
	@RequestMapping(value="/getCareersById")
	public void saveCareers(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;	
		try 
   		{
			commonResponse = new CommonResponse();
    		gson = new Gson();	
    		
    		String id = request.getParameter("id");
    		System.out.println("id  = " + id);
    		
    		Career career = adminDAO.getCareersById(Integer.parseInt(id));
    	    
    		if(career != null) {
    			commonResponse.setStatus("SUCCESS");
    			commonResponse.setStatus_code(200);
    			writer.print(gson.toJson(career));
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
	
	@RequestMapping("/internships")
	public String internships(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try
		{	
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			
			if(accountMap != null) {
				
				List<Internship> internshipList = adminDAO.getAllInternship();
				request.setAttribute("internship", internshipList);
				
				request.setAttribute("page", "admin-internships");
				
			} else {
				
				response.sendRedirect("/home");
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "admin.internships";
	}
	@RequestMapping(value="/getInternshipsById")
	public void saveInternship(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;	
		try 
   		{
			commonResponse = new CommonResponse();
    		gson = new Gson();	
    		
    		String id = request.getParameter("id");
    		System.out.println("id  = " + id);
    		
    		Internship internship = adminDAO.getInternshipById(Integer.parseInt(id));
    	    
    		if(internship != null) {
    			commonResponse.setStatus("SUCCESS");
    			commonResponse.setStatus_code(200);
    			writer.print(gson.toJson(internship));
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
	@RequestMapping("/ebooks")
	public String ebooks(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try
		{	
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			
			if(accountMap != null) {
				
				List<EbooksDownload> ebooksDownloadList = adminDAO.getAllEbooksDownload();
				request.setAttribute("ebooks", ebooksDownloadList);
				
				request.setAttribute("page", "admin-ebooks");
				
			} else {
				
				response.sendRedirect("/home");
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "admin.ebooks";
	}
	@RequestMapping("/webinars")
	public String webinars(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try
		{	
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			
			if(accountMap != null) {
				
				List<Webinars> webinarsList = adminDAO.getWebinarList();
				request.setAttribute("webinarsList", webinarsList);
				
				request.setAttribute("page", "admin-webinars");
				
			} else {
				
				response.sendRedirect("/home");
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "admin.webinars";
	}
	@RequestMapping("/webinars-contacts")
	public String webinars_contacts(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try
		{	
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			
			if(accountMap != null) {
				
				List<WebinarContacts> webinarContactList = adminDAO.getWebinarContacts();
				request.setAttribute("webinars", webinarContactList);
				
				request.setAttribute("page", "admin-webinars-contatcs");
				
			} else {
				
				response.sendRedirect("/home");
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "admin.webinars.contacts";
	}
	@RequestMapping("/webinars-post")
	public String webinars_post(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try
		{	
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			
			if(accountMap != null) {
				
				request.setAttribute("page", "admin-webinars-post");
				
			} else {
				
				response.sendRedirect("/home");
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "admin.webinars.post";
	}
	
	@RequestMapping(value="/getWebinarsById")
	public void getWebinarsById(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;	
		try 
   		{
			commonResponse = new CommonResponse();
    		gson = new Gson();	
    		
    		String id = request.getParameter("id");
    		System.out.println("id  = " + id);
    		
    		Webinars webinars= adminDAO.getWebinarsById(Integer.parseInt(id));
    	    
    		if(webinars != null) {
    			commonResponse.setStatus("SUCCESS");
    			commonResponse.setStatus_code(200);
    			writer.print(gson.toJson(webinars));
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
	
	@RequestMapping(value="/saveWebinarPublish")
	public void saveWebinarPublish(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;	
		try 
   		{
			commonResponse = new CommonResponse();
    		gson = new Gson();	
    		
    		String id = request.getParameter("id");
    		String status = request.getParameter("value");
    		
    		if(id == null) {id = "";}
    		if(status == null) {status = "";}
    		
    		id = id.trim();
    		status = status.trim();
    		
    		System.out.println("id  = " + id);
    		System.out.println("status  = " + status);
    		
    		if(id.isEmpty() || status.isEmpty())
    		{
    			commonResponse.setStatus("FAILURE");
    			commonResponse.setStatus_code(400);
    			writer.print(gson.toJson(commonResponse));
    			writer.close();
    			return;
    		}
    		
    		Webinars webinars= adminDAO.saveWebinarPublish(Integer.parseInt(id), status);
			commonResponse.setStatus("SUCCESS");
			commonResponse.setStatus_code(200);
			writer.print(gson.toJson(webinars));
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
    		
    		String title = request.getParameter("title");
    		System.out.println("title  = " + title);
    		
    		String short_description = request.getParameter("short_description");
    		System.out.println("short_description = " + short_description);
    		
    		String images = request.getParameter("images");
    		System.out.println("images = " + images);
    		
    		String category = request.getParameter("category");
    		System.out.println("category = " + category);
    		
    		Date start_date = new Date();
    		System.out.println("start_date = " + start_date);
    		
    		Date end_date = new Date();
    		System.out.println("end_date = " + end_date);
    		
    		String status = request.getParameter("status");
    		System.out.println("status = " + status);
    		
    		Webinars webinars = new Webinars();
    		webinars.setTitle(title);
    		webinars.setShort_description(short_description);
    		webinars.setImages(images);
    		webinars.setCategory(category);
    		webinars.setStart_date(start_date);
    		webinars.setEnd_date(end_date);
    		webinars.setStatus(status);
    		
    		boolean result = adminDAO.saveWebinars(webinars);
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
	
	@RequestMapping(value="/uploadWebinarsImage")
	public void uploadWebinarsImage(HttpServletRequest request, HttpServletResponse response) throws IOException 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = new CommonResponse();
		Gson gson = new Gson();
				
		System.out.println("uploadWebinarsImage--->");
		try 
		{
   		
			boolean isMultipart = ServletFileUpload.isMultipartContent(request);
			System.out.println("isMultipart--->"+isMultipart);
		    DiskFileItemFactory factory = new DiskFileItemFactory();
		    ServletFileUpload upload = new ServletFileUpload(factory);
	        try
	        { 
	           List fileItems = upload.parseRequest(request);
	           System.out.println("fileItems--->"+fileItems.size());
	           Iterator i = fileItems.iterator();
	           while ( i.hasNext () ) 
	           {
	              FileItem fi = (FileItem)i.next();
	              System.out.println("fi.isFormField()--->"+fi.isFormField());
	              if (!fi.isFormField())	
	              {
	            	 String file_name_original = fi.getName();
	            	 System.out.println("file_name_original--->"+file_name_original);
	            	 String extension = file_name_original.substring(file_name_original.lastIndexOf(".") + 1, file_name_original.length());
	            	 System.out.println("extension--->"+extension);
	            	 String fileName = "webinar_" + file_name_original + "."+extension;
	            	 System.out.println("fileName--->"+fileName);
	        		 String root_path = properties.getWebiDir();
	        		 System.out.println("root_path--->"+root_path);
	        		 String imagePath = ViewHelper.createFile(fi, root_path, fileName);
	        		 System.out.println("imagePath--->"+imagePath);
					
          		       commonResponse.setStatus_code(StatusMessage.SuccessCode);
	     	    	   commonResponse.setStatus(StatusMessage.SuccessMessage);
	     	    	   commonResponse.setMsg(fileName);	
	     	    	   writer.print(gson.toJson(commonResponse));
	     	    	   writer.close();
	     	    	   return;
	              }
	           }
	        }
	        catch(Exception ex)
	        {
			   ex.printStackTrace();
			   commonResponse.setStatus_code(StatusMessage.FailureCode);
	    	   commonResponse.setStatus(StatusMessage.FailureMessage);
	    	   commonResponse.setMsg("File Upload Failure");	
	    	   writer.print(gson.toJson(commonResponse));
	    	   writer.close();
	    	   return;
	        }
		} 
		catch (Exception ex) 
		{
		   ex.printStackTrace();
		   commonResponse.setStatus_code(StatusMessage.FailureCode);
    	   commonResponse.setStatus(StatusMessage.FailureMessage);
    	   commonResponse.setMsg("File Upload Failure");	
    	   writer.print(gson.toJson(commonResponse));
    	   writer.close();
    	   return;
		}    
	}
	
	@RequestMapping("/jobs-applications")
	public String jobs_applications(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try
		{	
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			
			if(accountMap != null) {
				
				List<JobsApplications> jobsApplications = adminDAO.getAllJobsApplication();
				request.setAttribute("jobsApplications", jobsApplications);
				
				request.setAttribute("page", "admin-jobs-applications");
				
			} else {
				
				response.sendRedirect("/home");
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "admin.jobsapplication";
	}
	
	@RequestMapping("/jobs")
	public String jobs(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try
		{	
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			
			if(accountMap != null) {
				
				List<Jobs> jobsList = adminDAO.getAllJobsList();
				request.setAttribute("jobsList", jobsList);
				
				request.setAttribute("page", "admin-jobs");
				
			} else {
				
				response.sendRedirect("/home");
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "admin.jobs";
	}
	
	@RequestMapping(value="/getJobsById")
	public void getJobsById(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;	
		try 
   		{
			commonResponse = new CommonResponse();
    		gson = new Gson();	
    		
    		String id = request.getParameter("id");
    		System.out.println("id  = " + id);
    		
    		Jobs jobs= adminDAO.getJobsById(Integer.parseInt(id));
    	    
    		if(jobs != null) {
    			commonResponse.setStatus("SUCCESS");
    			commonResponse.setStatus_code(200);
    			writer.print(gson.toJson(jobs));
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
	
	@RequestMapping(value="/saveJobsPublish")
	public void saveJobsPublish(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;	
		try 
   		{
			commonResponse = new CommonResponse();
    		gson = new Gson();	
    		
    		String id = request.getParameter("id");
    		String status = request.getParameter("value");
    		
    		if(id == null) {id = "";}
    		if(status == null) {status = "";}
    		
    		id = id.trim();
    		status = status.trim();
    		
    		System.out.println("id  = " + id);
    		System.out.println("status  = " + status);
    		
    		if(id.isEmpty() || status.isEmpty())
    		{
    			commonResponse.setStatus("FAILURE");
    			commonResponse.setStatus_code(400);
    			writer.print(gson.toJson(commonResponse));
    			writer.close();
    			return;
    		}
    		
    		Jobs jobs= adminDAO.saveJobsPublish(Integer.parseInt(id), status);
			commonResponse.setStatus("SUCCESS");
			commonResponse.setStatus_code(200);
			writer.print(gson.toJson(jobs));
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
	
	@RequestMapping("/jobs-post")
	public String jobs_post(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try
		{	
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			
			if(accountMap != null) {
				
				String id = request.getParameter("id");
	    		
				if (id !=null) {
	    			
	    			Jobs jobs= adminDAO.getJobsById(Integer.parseInt(id));

	    			request.setAttribute("jobs",jobs);
	    		}
	    		
	    		request.setAttribute("page", "admin-jobs-post");
			} else {
				
				response.sendRedirect("/home");
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "admin.jobs.post";
	}
	
	@RequestMapping(value="/saveOrUpdateJobs")
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
    		
    		String authCode = RandomStringUtils.random(8, "0123456789abcdef");
    		
    		String id = request.getParameter("id");
    		Date date = new Date();
    		String role_name = request.getParameter("role_name");
    		String total_vacancy = request.getParameter("total_vacancy");
    		String position = request.getParameter("position");
    		String experience = request.getParameter("experience");
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
    		String active = request.getParameter("active");
    		
    		if(id == null) {id = "";}
    		if(role_name == null) {role_name = "";}
    		if(total_vacancy == null) {total_vacancy = "";}
    		if(position == null) {position = "";}
    		if(experience == null) {experience = "";}
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
    		if(active == null) {active = "";}
    		
    		id = id.trim();
    		role_name = role_name.trim();
    		total_vacancy = total_vacancy.trim();
    		position = position.trim();
    		experience = experience.trim();
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
    		active = active.trim();
    		
    		Jobs jobs = null;
    		Boolean isFirstTimeJobPost = false;
    		
    		System.out.println("id = " + id);
    		
    		if(!id.isEmpty()) {
    			jobs = adminDAO.getJobsById(Integer.parseInt(id));
    		}
    		
    		if(jobs != null) {
    			isFirstTimeJobPost = false;
    		}else {
    			jobs = new Jobs();
    			isFirstTimeJobPost = true;
    		}
    		
    		String jobUrl = "";
    		
    		if(!position.isEmpty()) {
    			String convertLowerCaseTitle = position.toLowerCase();
    			jobUrl = convertLowerCaseTitle.replace(' ', '-');
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
    		jobs.setExperience(experience);
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
    		jobs.setActive(active);

    		adminDAO.saveOrUpdateJobs(jobs);
    		
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
	
	@RequestMapping(value="/uploadCompanyLogo")
	public void uploadCompanyLogo(HttpServletRequest request, HttpServletResponse response) throws IOException 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = new CommonResponse();
		Gson gson = new Gson();
				
		try 
		{
			long str = new java.sql.Timestamp(System.currentTimeMillis()).getTime();
        	String resume_mobile = Long.toString(str);
    		
			boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		    DiskFileItemFactory factory = new DiskFileItemFactory();
		    ServletFileUpload upload = new ServletFileUpload(factory);
	        try
	        { 
	           List fileItems = upload.parseRequest(request);
	           Iterator i = fileItems.iterator();
	           while ( i.hasNext () ) 
	           {
	              FileItem fi = (FileItem)i.next();
	              if (!fi.isFormField())	
	              {	            	  
	            	 String file_name_original = fi.getName();
	            	 System.out.println("file_name_original--->"+file_name_original);
	            	 String extension = file_name_original.substring(file_name_original.lastIndexOf(".") + 1, file_name_original.length());
	            	 System.out.println("extension--->"+extension);
	            	 String fileName = "jobs_" + resume_mobile + "."+extension;
	            	 System.out.println("fileName--->"+fileName);
	        		 String root_path = properties.getLogoDir();
	        		 System.out.println("root_path--->"+root_path);
	        		 String imagePath = ViewHelper.createFile(fi, root_path, fileName);
	        		 System.out.println("imagePath--->"+imagePath);
					
          		       commonResponse.setStatus_code(StatusMessage.SuccessCode);
	     	    	   commonResponse.setStatus(StatusMessage.SuccessMessage);
	     	    	   commonResponse.setMsg(fileName);	
	     	    	   writer.print(gson.toJson(commonResponse));
	     	    	   writer.close();
	     	    	   return;
	              }else
	              {
	            	  String fieldName = fi.getFieldName();
	            	  if(fieldName.equalsIgnoreCase("txt_resume_mobile"))
	            	  {
	            		  resume_mobile = fi.getString().trim();
	            	  }
	              }
	           }
	        }
	        catch(Exception ex)
	        {
				ex.printStackTrace();
				   commonResponse.setStatus_code(StatusMessage.FailureCode);
		    	   commonResponse.setStatus(StatusMessage.FailureMessage);
		    	   commonResponse.setMsg("File Upload Failure");	
		    	   writer.print(gson.toJson(commonResponse));
		    	   writer.close();
		    	   return;
	        }
		} 
		catch (Exception ex) 
		{
			ex.printStackTrace();
			   commonResponse.setStatus_code(StatusMessage.FailureCode);
	    	   commonResponse.setStatus(StatusMessage.FailureMessage);
	    	   commonResponse.setMsg("File Upload Failure");	
	    	   writer.print(gson.toJson(commonResponse));
	    	   writer.close();
	    	   return;
		}    
	}
	
	@RequestMapping("/corporate-enquiry")
	public String corporate_enquiry(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try
		{	
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			
			if(accountMap != null) {
				
				List<CorporateEnquiry> corporateEnquiryList = adminDAO.getAllCorporateEnquiry();
				request.setAttribute("corporateEnquiryList", corporateEnquiryList);
				
				request.setAttribute("page", "admin-corporate-enquiry");
				
			} else {
				
				response.sendRedirect("/home");
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "admin.corporate.enquiry";
	}
	
	@RequestMapping("/mentors")
	public String mentors(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try
		{	
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			
			if(accountMap != null) {
				
				List<Mentors> mentorsList = adminDAO.getAllMentors();
				request.setAttribute("mentorsList", mentorsList);
				
				request.setAttribute("page", "admin-mentors");
				
			} else {
				
				response.sendRedirect("/home");
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "admin.mentors";
	}
	
	@RequestMapping(value="/getMentorsById")
	public void getMentorsById(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;	
		try 
   		{
			commonResponse = new CommonResponse();
    		gson = new Gson();	
    		
    		String id = request.getParameter("id");
    		
    		Mentors mentors = adminDAO.getMentorsById(Integer.parseInt(id));
    	    
    		if(mentors != null) {
    			commonResponse.setStatus("SUCCESS");
    			commonResponse.setStatus_code(200);
    			writer.print(gson.toJson(mentors));
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
	
	@RequestMapping("/ebp-candidates")
	public String ebp_candidates(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try
		{	
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			
			if(accountMap != null) {
				
				List<EBPCandidate> ebpCandidateList = adminDAO.getAllEBPCandidate();
				request.setAttribute("ebpCandidateList", ebpCandidateList);
				
				request.setAttribute("page", "admin-ebp-candidates");
				
			} else {
				
				response.sendRedirect("/home");
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "admin.ebp.candidates";
	}
	
	@RequestMapping("/it-staffing-cantacts")
	public String it_staffing_cantacts(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try
		{	
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			
			if(accountMap != null) {
				
				List<ItStaffing> itStaffing = adminDAO.getAllITStaffing();
				request.setAttribute("itStaffing", itStaffing);
				
				request.setAttribute("page", "it-staffing-cantacts");
				
			} else {
				
				response.sendRedirect("/home");
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "admin.it.staffing.contacts";
	}
	
	@RequestMapping(value="/getEBPCandidateById")
	public void getEBPCandidateById(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;	
		try 
   		{
			commonResponse = new CommonResponse();
    		gson = new Gson();	
    		
    		String id = request.getParameter("id");
    		System.out.println("id  = " + id);
    		
    		EBPCandidate ebpCandidate = adminDAO.getEBPCandidateById(Integer.parseInt(id));
    	    
    		if(ebpCandidate != null) {
    			commonResponse.setStatus("SUCCESS");
    			commonResponse.setStatus_code(200);
    			writer.print(gson.toJson(ebpCandidate));
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
	
	@RequestMapping("/ebp-leads")
	public String ebp_leads(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try
		{	
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			
			if(accountMap != null) 
			{
				
				List<EbpEmails> ebpEmailsList = adminDAO.getAllEbpEmails();
				request.setAttribute("ebpEmailsList", ebpEmailsList);
				
				request.setAttribute("page", "admin-ebp-leads");
				
			} else {
				
				response.sendRedirect("/home");
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "admin.ebp.leads";
	}
}
