package com.teksands.bootcamp.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URL;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.stream.Collectors;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.RandomStringUtils;
import org.dhatim.fastexcel.Workbook;
import org.dhatim.fastexcel.Worksheet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.mysql.cj.xdevapi.Client;
//import com.sun.corba.se.spi.orbutil.fsm.Input;
import com.teksands.bootcamp.dao.BootcampDAO;
import com.teksands.bootcamp.dao.BrandAdminDAO;
import com.teksands.bootcamp.dao.CandidateDAO;
import com.teksands.bootcamp.dao.ClientMasterDAO;
import com.teksands.bootcamp.dao.InterviewDAO;
import com.teksands.bootcamp.dao.JobMasterDAO;
import com.teksands.bootcamp.dao.LogDAO;
import com.teksands.bootcamp.dao.MentorMasterDAO;
import com.teksands.bootcamp.dao.SuperAdminDAO;
import com.teksands.bootcamp.model.Bootcamp;
import com.teksands.bootcamp.model.Brand;
import com.teksands.bootcamp.model.BrandDirectors;
import com.teksands.bootcamp.model.CallSchedule;
import com.teksands.bootcamp.model.Candidate;
import com.teksands.bootcamp.model.CandidateFeedback;
import com.teksands.bootcamp.model.ClientContact;
import com.teksands.bootcamp.model.ClientMaster;
import com.teksands.bootcamp.model.CmsParameter;
import com.teksands.bootcamp.model.CmsUser;
import com.teksands.bootcamp.model.Interview;
import com.teksands.bootcamp.model.JobMaster;
import com.teksands.bootcamp.model.Log;
import com.teksands.bootcamp.model.MentorMaster;
import com.teksands.bootcamp.model.TestResults;
import com.teksands.bootcamp.response.JobMasterApplicationResponse;
import com.teksands.user.response.CandidateandJobResponse;
import com.teksands.user.response.CommonResponse;
import com.teksands.utils.Properties;
import com.teksands.utils.SendEmailUtil;
import com.teksands.utils.Utils;

@Controller
@RequestMapping("/bootcamp")
public class BrandAdminController {

	@Autowired
	SuperAdminDAO superAdminDAO;
	
	@Autowired
	BrandAdminDAO brandAdminDAO;
	
	@Autowired
	CandidateDAO candidateDAO;
	
	@Autowired
	JobMasterDAO jobMasterDAO;
	
	@Autowired
	SendEmailUtil sendEmailUtil;
	
	@Autowired
	LogDAO logDAO;
	
	@Autowired
	Properties properties;
	
	@Autowired
	ClientMasterDAO clientMasterDAO;
	
	@Autowired
	MentorMasterDAO mentorMasterDAO;	
	
	@Autowired
	InterviewDAO interviewDAO;
	
	@Autowired
	SuperAdminDAO adminDAO;
	
	@Autowired
	BootcampDAO bootcampDAO;
	
	private static final String SAVE_DIR = "upload";
	
	@RequestMapping({ "/brand-dashboard" })
	public String brand_dashboard(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HashMap<String, String> accountMap = null;
		try {
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null) {

				String user_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				String user_type = accountMap.get("user_type");

				List<Bootcamp> bootcampCountList = candidateDAO.getBootcampCounts();
				String bootcampCount = bootcampCountList.toString().replace("[", "").replace("]", "");
				request.setAttribute("bootcampCount", bootcampCount);

				List<Candidate> candidateCountList = candidateDAO.getCandidateCounts();
				String candidateCount = candidateCountList.toString().replace("[", "").replace("]", "");
				request.setAttribute("candidateCount", candidateCount);

				List<MentorMaster> mentorMasterCountList = candidateDAO.getMentorMasterCounts();
				String mentorCount = mentorMasterCountList.toString().replace("[", "").replace("]", "");
				request.setAttribute("mentorCount", mentorCount);

				List<ClientMaster> clientMasterCountList = candidateDAO.getClientMasterCounts();
				String clientCount = clientMasterCountList.toString().replace("[", "").replace("]", "");
				request.setAttribute("clientCount", clientCount);

				List<Bootcamp> bootcampList = bootcampDAO.getLatestBootcamp(5);
				request.setAttribute("bootcampList", bootcampList);
				
				List<Log> logList = logDAO.getLatestLog(10);
				request.setAttribute("logList", logList);
				
				List<Candidate> candidateList = candidateDAO.getLatestCandidate(5);
				request.setAttribute("candidateList", candidateList);

				request.setAttribute("page", "dashboard");
			} else {
				response.sendRedirect("/bootcamp");
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return "bootcamp.user.brand.dashboard";
	}	
	@RequestMapping({"/brand" })
	public String brand(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try
		{	
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_type_id").equalsIgnoreCase(Utils.brandId.toString()))) {
				
				String user_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				String user_type = accountMap.get("user_type");
				
				CmsUser user = null;
				Brand brand = null;
				List<BrandDirectors> brandDirectors = null;
				
				if(!user_id.isEmpty()) {
					user = candidateDAO.getUserById(Integer.parseInt(user_id));
				}				
				if(user != null) {
					brand = brandAdminDAO.getBrandByUserId(Integer.parseInt(user_id));
				}				
				System.out.println("brand_id /brand"+ brand.getId());
				if(brand != null) {
					brandDirectors = superAdminDAO.getAllBrandDirectorsListByBrandId(brand.getId());
				}				
				request.setAttribute("brand", brand);
				request.setAttribute("brandDirectors", brandDirectors);
				
				request.setAttribute("page", "brand");
			}
			else {
				response.sendRedirect("/bootcamp");
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "bootcamp.user.brand.view";
	}
	
	@RequestMapping({"/edit-brand" })
	public String edit_brand(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try
		{	
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_type_id").equalsIgnoreCase(Utils.brandId.toString()))) {
				
				String user_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				String user_type = accountMap.get("user_type");
				
				CmsUser user = null;
				Brand brand = null;
				List<BrandDirectors> brandDirectors = null;
				
				if(!user_id.isEmpty()) {
					user = candidateDAO.getUserById(Integer.parseInt(user_id));
				}						
				if(!user_id.isEmpty()) {
					brand = brandAdminDAO.getBrandByUserId(Integer.parseInt(user_id));
				}
				System.out.println("brand id edit brand"+brand.getId());
				if(brand != null) {
					brandDirectors = superAdminDAO.getAllBrandDirectorsListByBrandId(brand.getId());
				}
				System.out.println("brandDirectors size"+brandDirectors.size());
				request.setAttribute("brand", brand);
				request.setAttribute("brandDirectors", brandDirectors);
				
				request.setAttribute("page", "brand-edit");
			}
			else {
				response.sendRedirect("/bootcamp");
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "bootcamp.user.brand.edit";
	}
	
	@RequestMapping(value = "/UpdateBrandFromBrandAdmin")
	public void UpdateBrandFromBrandAdmin(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;
		String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%&()";
		HashMap<String, String> accountMap = null;
		try {

			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_type_id").equalsIgnoreCase(Utils.brandId.toString()))) 
			{
				
				String user_login_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				String user_type = accountMap.get("user_type");

				commonResponse = new CommonResponse();
				gson = new Gson();

				String brand_directors_id = request.getParameter("brand_director_id");
				String brand_cin = request.getParameter("brand_cin");
				String brand_gst = request.getParameter("brand_gst");
				String brand_pan = request.getParameter("brand_pan");
				String brand_name = request.getParameter("brand_name");
				String brand_description = request.getParameter("brand_description");
				String brand_nature_business = request.getParameter("brand_nature_business");
				String brand_product_service = request.getParameter("brand_product_service");
				String brand_total_employees = request.getParameter("brand_total_employees");
				String brand_annual_revenue = request.getParameter("brand_annual_revenue");
				String brand_website = request.getParameter("brand_website");
				String brand_address = request.getParameter("brand_address");
				String brand_pincode = request.getParameter("brand_pincode");
				String brand_city = request.getParameter("brand_city");
				String brand_state = request.getParameter("brand_state");
				String brand_country = request.getParameter("brand_country");
				
				String brand_director_name = request.getParameter("brand_director_name");
				String brand_director_designation = request.getParameter("brand_director_designation");
				String brand_director_mobile = request.getParameter("brand_director_mobile");
				String brand_director_email = request.getParameter("brand_director_email");
				String brand_director_notes = request.getParameter("brand_director_notes");
				
				if(brand_directors_id == null) {brand_directors_id = "";}
				if(brand_cin == null) {brand_cin = "";}
				if(brand_gst == null) {brand_gst = "";}
				if(brand_pan == null) {brand_pan = "";}
				if(brand_name == null) {brand_name = "";}
				if(brand_description == null) {brand_description = "";}
				if(brand_nature_business == null) {brand_nature_business = "";}
				if(brand_product_service == null) {brand_product_service = "";}
				if(brand_total_employees == null) {brand_total_employees = "";}
				if(brand_annual_revenue == null) {brand_annual_revenue = "";}
				if(brand_website == null) {brand_website = "";}
				if(brand_address == null) {brand_address = "";}
				if(brand_pincode == null) {brand_pincode = "";}
				if(brand_city == null) {brand_city = "";}
				if(brand_state == null) {brand_state = "";}
				if(brand_country == null) {brand_country = "";}
				if(brand_director_name == null) {brand_director_name = "";}
				if(brand_director_designation == null) {brand_director_designation = "";}
				if(brand_director_mobile == null) {brand_director_mobile = "";}
				if(brand_director_email == null) {brand_director_email = "";}
				if(brand_director_notes == null) {brand_director_notes = "";}
				
				brand_directors_id = brand_directors_id.trim();
				brand_cin = brand_cin.trim();
				brand_gst = brand_gst.trim();
				brand_pan = brand_pan.trim();
				brand_name = brand_name.trim();
				brand_description = brand_description.trim();
				brand_nature_business = brand_nature_business.trim();
				brand_product_service = brand_product_service.trim();
				brand_total_employees = brand_total_employees.trim();
				brand_annual_revenue = brand_annual_revenue.trim();
				brand_website = brand_website.trim();
				brand_address = brand_address.trim();
				brand_pincode = brand_pincode.trim();
				brand_city = brand_city.trim();
				brand_state = brand_state.trim();
				brand_country = brand_country.trim();
				brand_director_name = brand_director_name.trim();
				brand_director_designation = brand_director_designation.trim();
				brand_director_mobile = brand_director_mobile.trim();
				brand_director_email = brand_director_email.trim();
				brand_director_notes = brand_director_notes.trim();
				
				Brand brand = null;
				
				if(!user_login_id.isEmpty()) {
					brand = brandAdminDAO.getBrandByUserId((Integer.parseInt(user_login_id)));
				}
				
				if(brand != null) {
					brand.setName(brand_name);
					brand.setDescription(brand_description);
					brand.setCin(brand_cin);
					brand.setGst(brand_gst);
					brand.setPan(brand_pan);
					brand.setAddress(brand_address);
					brand.setCity(brand_city);
					brand.setState(brand_state);
					brand.setCountry(brand_country);
					brand.setPinocde(brand_pincode);
					brand.setNature_of_business(brand_nature_business);
					brand.setProduct_and_service(brand_product_service);
					brand.setTotal_no_employee(brand_total_employees);
					brand.setAnnual_revenue(brand_annual_revenue);
					brand.setWebsite(brand_website);
					brand.setCreated_date(new Date());
					brand.setActive(true);
					
					superAdminDAO.saveOrUpdateBrand(brand);
				}
            	
				List<String> brand_directors_idArr = null;
				
				if(!brand_directors_id.isEmpty()) {
					brand_directors_idArr = Arrays.asList(brand_directors_id.split(","));
				}
				
				List<String> brand_director_nameArr = Arrays.asList(brand_director_name.split(","));
	    		List<String> brand_director_designationArr = Arrays.asList(brand_director_designation.split(","));
	    		List<String> brand_director_mobileArr = Arrays.asList(brand_director_mobile.split(","));
	    		List<String> brand_director_emailArr = Arrays.asList(brand_director_email.split(","));
	    		List<String> brand_director_notesArr = Arrays.asList(brand_director_notes.split("\\|"));
	    		
	    		for (int i = 0; i < brand_director_nameArr.size(); i++) 
	            {
	    			BrandDirectors brandDirector = null;
	    			
	            	if(brand_directors_idArr != null) {
	            		if(i < brand_directors_idArr.size()) {
		            		brandDirector = superAdminDAO.getBrandDirectorById(Integer.parseInt(brand_directors_idArr.get(i)));
		            	}
	            	}
	    			
	    			if(brandDirector == null) {
	            		brandDirector = new BrandDirectors();
	            	}
	    			
	    			brandDirector.setBrand_id(brand.getId());
	            	brandDirector.setBrand_name(brand.getName());
	            	brandDirector.setName(brand_director_nameArr.get(i));
	            	brandDirector.setEmail(brand_director_emailArr.get(i));
	            	brandDirector.setMobile(brand_director_mobileArr.get(i));
	            	brandDirector.setDesignation(brand_director_designationArr.get(i));
	            	brandDirector.setNotes(brand_director_notesArr.get(i));
	            	brandDirector.setCreated_date(new Date());
	            	brandDirector.setActive(true);
	            	
	            	superAdminDAO.saveOrUpdateBrandDirector(brandDirector);
	    		}
	    		
	    		Log log = new Log();
		 		log.setUser_id(Integer.parseInt(user_login_id));
		 		log.setUser_name(user_name);
		 		log.setTitle("The Brand Details Updated");
		 		log.setDescription(user_name+" has updated the brand details ("+brand.getName()+")");
		 		log.setActivity_time(new Date());
		 		String ipAddr = Utils.getIpAddr(request);
				if(ipAddr == null){ipAddr="";}
		 		log.setIp_addr(ipAddr);
		 		logDAO.saveLog(log);
		 		
    			commonResponse.setStatus("SUCCESS");
				commonResponse.setStatus_code(200);
				commonResponse.setMsg("The Brand Details Updated Successfully.");
				writer.print(gson.toJson(commonResponse));
				writer.close();
				return;
				
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
	
	@RequestMapping({"/users" })
	public String brand_users(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try
		{	
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_type_id").equalsIgnoreCase(Utils.brandId.toString()))) {
				
				String user_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				String user_type = accountMap.get("user_type");
				
				Brand brand = null;
				
				if(user_id != null) {
					brand = brandAdminDAO.getBrandByUserId(Integer.parseInt(user_id));
				}
				
				List<CmsUser> cmsUser = brandAdminDAO.getAllClientAdminAndRecruiterUsersByBrandId(brand.getId());
				request.setAttribute("cmsUser", cmsUser);
				
				List<JobMaster> jobsMaster = jobMasterDAO.getAllActiveJobsByBrandId(brand.getId());
				request.setAttribute("jobsMaster", jobsMaster);
				
				request.setAttribute("page", "brand-user-list");
			}
			else {
				response.sendRedirect("/bootcamp");
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "bootcamp.user.brand.user.list";
	}
	@RequestMapping({"/brand-add-update-user"})
	public String brand_add_update_user(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try
		{	
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_type_id").equalsIgnoreCase(Utils.brandId.toString()))) {
				
				String user_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				String user_type = accountMap.get("user_type");
				
				Brand brand = null;
				
				if(user_id != null) {
					brand = brandAdminDAO.getBrandByUserId(Integer.parseInt(user_id));
				}
				String brand_user_id = request.getParameter("id");
				
				CmsUser cmsUser = null;
	    		
	    		if(brand_user_id != null) {
	    			cmsUser = candidateDAO.getUserById(Integer.parseInt(brand_user_id));
	    			request.setAttribute("user", cmsUser);
	    			
	    			List<Object[]> object_list = null;	
	    			
	    			object_list = brandAdminDAO.getClientIdByUserId(brand.getId(),brand_user_id);
	    		
	    			StringBuilder sb = new StringBuilder();
	    			
					for (Object[] objects : object_list) 
	    			{		
					 sb.append(objects[0]);
   				  	 sb.append(",");
					}	
					String clientIds = sb.toString();
					clientIds = clientIds.replaceAll(",$", "");
					request.setAttribute("clientIds", clientIds);
	    		}
	    		
	    		List<JobMaster> jobsMaster = jobMasterDAO.getAllActiveJobsByBrandId(brand.getId());
				request.setAttribute("jobsMaster", jobsMaster);
				
				List<ClientMaster> clientMaster = brandAdminDAO.getAllActiveClientsByBrandId(brand.getId());
				request.setAttribute("clientMaster", clientMaster);
				
				
				
				request.setAttribute("page", "brand-new-user");
			}
			else {
				response.sendRedirect("/bootcamp");
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "bootcamp.user.brand.newuser";
	}
	
	@RequestMapping(value = "/addNewUserForBrand")
	public void addNewUserForBrand(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;
		HashMap<String, String> accountMap = null;
		try {

			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_type_id").equalsIgnoreCase(Utils.brandId.toString()))) 
			{
				String user_login_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				String user_type = accountMap.get("user_type");

				commonResponse = new CommonResponse();
				gson = new Gson();

				String brand_user_id = request.getParameter("brand_user_id");
				String brand_user_name = request.getParameter("brand_user_name");
				String brand_user_mobile = request.getParameter("brand_user_mobile");
				String brand_user_email = request.getParameter("brand_user_email");
				String brand_access_permission = request.getParameter("brand_access_permission");
				String brand_access_client = request.getParameter("brand_access_client");
				
				if(brand_user_id == null) {brand_user_id ="";}
				if(brand_user_name == null) {brand_user_name ="";}
				if(brand_user_mobile == null) {brand_user_mobile ="";}
				if(brand_user_email == null) {brand_user_email ="";}
				if(brand_access_permission == null) {brand_access_permission ="";}
				if(brand_access_client == null) {brand_access_client ="";}
	    		
				brand_user_id = brand_user_id.trim();
				brand_user_name = brand_user_name.trim();
				brand_user_mobile = brand_user_mobile.trim();
				brand_user_email = brand_user_email.trim();
				brand_access_permission = brand_access_permission.trim();
				brand_access_client = brand_access_client.trim();
				
				CmsUser cmsUser = null;
				Boolean isFirstTimeUser = false;
				Brand brand = null;
				
				String password = Utils.getAutoPassword();
				String enc_pass = Utils.EncodeString(password);
				
				if(!brand_user_id.isEmpty()) {
					cmsUser = candidateDAO.getUserById(Integer.parseInt(brand_user_id));
				}
				
				if(user_login_id != null || !user_login_id.isEmpty()) {
					brand = brandAdminDAO.getBrandByUserId(Integer.parseInt(user_login_id));
				}
				
				if(cmsUser == null) {
					cmsUser = new CmsUser();
					isFirstTimeUser = true;
				}
				
				cmsUser.setBrand_id(brand.getId());
				cmsUser.setName(brand_user_name);
				cmsUser.setMobile(brand_user_mobile);
				cmsUser.setEmail(brand_user_email);
				cmsUser.setPassword_encrypted("");
				cmsUser.setPassword_encrypted(enc_pass);
				if(brand_access_permission.equalsIgnoreCase("7")) {
					cmsUser.setUser_type("clientAdmin");					
				}
				if(brand_access_permission.equalsIgnoreCase("8")){
					cmsUser.setUser_type("recruiter");
				}
				cmsUser.setUser_type_id(Integer.parseInt(brand_access_permission));
				cmsUser.setCreated_date(new Date());
				cmsUser.setLogin_date(new Date());
				cmsUser.setActive(true);
				
				candidateDAO.saveOrUpdateCmsUser(cmsUser);
				
			    ClientMaster clients = null;
			    List<Object[]> object_list = null;			    
			 
			    Boolean updResult =  false;
			    String user_id ="";
				if(brand_access_permission.equalsIgnoreCase("7")) {		
					
					
					System.out.println("brand_access_client  = " + brand_access_client);
					
					if(!brand_access_client.isEmpty())
					{
						String upduser_ids ="";
						user_id = cmsUser.getId().toString();	
						List<String> clientList = Arrays.asList(brand_access_client.split(","));
						for(String clientId : clientList)
						{	
							
							System.out.println("clientId" + clientId);
							
						    clients = brandAdminDAO.getclientById(Integer.parseInt(clientId));
						    
						    System.out.println("clients = " + clients.getName());
						    
							String clientUsersId = clients.getUser_id();
							
							if(clientUsersId == null) { clientUsersId = "";}
							
								if(!clientUsersId.isEmpty())
			    				{
									upduser_ids = clientUsersId +","+ user_id;
									
									String trim_upduser_ids = String.join(",",Arrays.asList(upduser_ids.split(",")).stream().distinct().collect(Collectors.toList()));								
									updResult = brandAdminDAO.updateUsersIdByClientId(Integer.parseInt(clientId),trim_upduser_ids);
									
									List<Object[]> not_in_client_list = null;	
									not_in_client_list = brandAdminDAO.getClientNotInById(brand.getId(),brand_access_client);
									String notInClientIds ="";
									for (Object[] objects : not_in_client_list) 
					    			{		
										String clientNotInId = String.valueOf(objects[0]);	
										notInClientIds = String.valueOf(objects[2]);
										notInClientIds =notInClientIds.replaceAll(user_id,"");	
										notInClientIds =notInClientIds.replaceAll("^(,|\\s)*|(,|\\s)*$", "").replaceAll("(\\,\\s*)+", ",");											
										updResult = brandAdminDAO.updateUsersIdByClientId(Integer.parseInt(clientNotInId),notInClientIds);	
									}
									
			    				}
								else
			    				{
			    					upduser_ids = user_id;			    					
			    					updResult = brandAdminDAO.updateUsersIdByClientId(Integer.parseInt(clientId),upduser_ids);
			    				}								
						}
					}
					else
					{
						user_id = cmsUser.getId().toString();					
						object_list = brandAdminDAO.getObjclientById(brand.getId());
						String clientUsernewIds ="";
						for (Object[] objects : object_list) 
		    			{		
						String clientIds = String.valueOf(objects[2]);
					    clientUsernewIds =clientIds.replaceAll(user_id,"");						
					    clientUsernewIds =clientUsernewIds.replaceAll("^(,|\\s)*|(,|\\s)*$", "").replaceAll("(\\,\\s*)+", ",");
					    updResult = brandAdminDAO.updateUsersIdByClientId(Integer.parseInt(String.valueOf(objects[0])),clientUsernewIds);			    
						}		
						
					}
				}
				if(isFirstTimeUser) {
					sendEmailUtil.sendBrandAdminLoginDetails(cmsUser.getName(), cmsUser.getEmail(), password);
            	}
				
				if(isFirstTimeUser) {
					commonResponse.setStatus_code(200);
					if(brand_access_permission.equalsIgnoreCase("7")) {
	    				commonResponse.setMsg("Client Admin Added Successfully");
	    			}
	    			
	    			if(brand_access_permission.equalsIgnoreCase("8")){
	    				commonResponse.setMsg("Recruiter Added Successfully");
	    			}
	    			writer.print(gson.toJson(commonResponse));
	    			writer.close();
	    			return;
	    		} else {
	    			commonResponse.setStatus_code(200);
	    			
					if(brand_access_permission.equalsIgnoreCase("7")) {
	    				commonResponse.setMsg("Client Admin Details Updated Successfully");
	    			}
	    			
	    			if(brand_access_permission.equalsIgnoreCase("8")){
	    				commonResponse.setMsg("Recruiter Details Updated Successfully");
	    			}
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
	
	@RequestMapping(value="/getBrandUserById")
	public void getBrandUserById(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;	
		HashMap<String, String> accountMap = null;
		try 
   		{
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_type_id").equalsIgnoreCase(Utils.adminId.toString())) || (accountMap.get("user_type_id").equalsIgnoreCase(Utils.brandId.toString()))) 
			{
				
				String user_login_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				String user_type = accountMap.get("user_type");
				
				commonResponse = new CommonResponse();
	    		gson = new Gson();	
	    		
	    		String brand_user_id = request.getParameter("brand_user_id");
	    		
	    		if(brand_user_id == null) {brand_user_id = "";}
	    		
	    		brand_user_id = brand_user_id.trim();
	    		
	    		CmsUser cmsUser = null;
	    		
	    		if(!brand_user_id.isEmpty()) {
	    			cmsUser = candidateDAO.getUserById(Integer.parseInt(brand_user_id));
	    		}
	    	    
	    		if(cmsUser != null) {
	    			commonResponse.setStatus("SUCCESS");
	    			commonResponse.setStatus_code(200);
	    			writer.print(gson.toJson(cmsUser));
	    			writer.close();
	    			return;
	    		} else {
	    			commonResponse.setStatus("FAILURE");
	    			commonResponse.setStatus_code(400);
	    			commonResponse.setMsg("Failure!, Please Try Again");
	    			writer.print(gson.toJson(commonResponse));
	    			writer.close();
	    			return;
	    		}
			}else {
				response.sendRedirect("/bootcamp");
			}
   		}
		catch(Exception ex)
       	{
       		ex.printStackTrace();
       		
       		commonResponse.setStatus("FAILURE");
			commonResponse.setStatus_code(400);
			commonResponse.setMsg("Failure!, Please Try Again");
			writer.print(gson.toJson(commonResponse));
			writer.close();
			return;
       	}
	}
	
	@RequestMapping(value = "/deleteUserById")
	public void deleteUserById(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;
		HashMap<String, String> accountMap = null;
		try {

			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_type_id").equalsIgnoreCase(Utils.brandId.toString()))) 
			{
				
				String user_login_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				String user_type = accountMap.get("user_type");

				commonResponse = new CommonResponse();
				gson = new Gson();

				String brand_user_id = request.getParameter("brand_user_id");
				
				if(brand_user_id == null) {brand_user_id ="";}
	    		
				brand_user_id = brand_user_id.trim();
				
				Brand brand = null;
				CmsUser cmsUser = null;
				
				if(!brand_user_id.isEmpty()) {
					cmsUser = candidateDAO.getUserById(Integer.parseInt(brand_user_id));
				}
				
				if(cmsUser != null) {
					brand = superAdminDAO.getBrandById(cmsUser.getBrand_id());
				}
				
				Boolean userResult = false;
	    		
	    		if(!brand_user_id.isEmpty()) {
	    			
	    			Log log = new Log();
			 		log.setUser_id(Integer.parseInt(user_login_id));
			 		log.setUser_name(user_name);
			 		log.setTitle("The User Deleted");
			 		log.setDescription(user_name+" has deleted the user details ("+cmsUser.getName()+" with following brand "+brand.getName()+")");
			 		log.setActivity_time(new Date());
			 		String ipAddr = Utils.getIpAddr(request);
					if(ipAddr == null){ipAddr="";}
			 		log.setIp_addr(ipAddr);
			 		logDAO.saveLog(log);
			 		
	    			userResult = superAdminDAO.deleteUserById(Integer.parseInt(brand_user_id));
	    			
	    		}
	    		
	    		if(userResult) {
	    			commonResponse.setMsg("User Deleted successfully");
	    			commonResponse.setStatus_code(200);
	    			writer.print(gson.toJson(commonResponse));
	    			writer.close();
	    			return;
	    		} else {
	    			commonResponse.setStatus("FAILURE");
	    			commonResponse.setStatus_code(400);
	    			commonResponse.setMsg("Failure, Please Try Again");
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
	
	
	@RequestMapping({"/skills" })
	public String skills(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try
		{	
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_type_id").equalsIgnoreCase(Utils.brandId.toString()))) {
				
				String user_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				String user_type = accountMap.get("user_type");
				
				CmsUser cmsUser = null;
				
				if(user_id != null) {
					cmsUser = candidateDAO.getUserById(Integer.parseInt(user_id));
				}			
				
				List<CmsParameter> cmsParameter =  null;
				Integer brand_id = null;	
				
				if(cmsUser != null) {
					brand_id = cmsUser.getBrand_id();
				}				
				if(brand_id != null) {
					cmsParameter = brandAdminDAO.getAllParametersByBrandId(brand_id, "skills");
				}
				
				request.setAttribute("cmsParameter", cmsParameter);				
				request.setAttribute("page", "brand-skills-list");
			}
			else {
				response.sendRedirect("/bootcamp");
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "bootcamp.user.brand.skills";
	}
	
	@RequestMapping({"/domains" })
	public String domains(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try
		{	
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_type_id").equalsIgnoreCase(Utils.brandId.toString()))) {
				
				String user_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				String user_type = accountMap.get("user_type");
				
				CmsUser cmsUser = null;
				
				if(user_id != null) {
					cmsUser = candidateDAO.getUserById(Integer.parseInt(user_id));
				}			
				
				List<CmsParameter> cmsParameter =  null;
				Integer brand_id = null;	
				
				if(cmsUser != null) {
					brand_id = cmsUser.getBrand_id();
				}
				
				if(brand_id != null) {
					cmsParameter = brandAdminDAO.getAllParametersByBrandId(brand_id, "domains");
				}
				
				request.setAttribute("cmsParameter", cmsParameter);
				
				request.setAttribute("page", "brand-domains-list");
			}
			else {
				response.sendRedirect("/bootcamp");
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "bootcamp.user.brand.domains";
	}
	
	@RequestMapping({"/application-status" })
	public String applicationstatus(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try
		{	
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_type_id").equalsIgnoreCase(Utils.brandId.toString()))) {
				
				String user_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				String user_type = accountMap.get("user_type");
				
				CmsUser cmsUser = null;
				
				if(user_id != null) {
					cmsUser = candidateDAO.getUserById(Integer.parseInt(user_id));
				}			
				
				List<CmsParameter> cmsParameter =  null;
				Integer brand_id = null;	
				
				if(cmsUser != null) {
					brand_id = cmsUser.getBrand_id();
				}
				
				if(brand_id != null) {
					cmsParameter = brandAdminDAO.getAllParametersByBrandId(brand_id, "application_status");
				}
				
				request.setAttribute("cmsParameter", cmsParameter);
				
				request.setAttribute("page", "brand-application-status-list");
			}
			else {
				response.sendRedirect("/bootcamp");
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "bootcamp.user.brand.application.status";
	}
	
	@RequestMapping({"/interview-status" })
	public String interviewstatus(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try
		{	
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_type_id").equalsIgnoreCase(Utils.brandId.toString()))) {
				
				String user_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				String user_type = accountMap.get("user_type");
				
				CmsUser cmsUser = null;
				
				if(user_id != null) {
					cmsUser = candidateDAO.getUserById(Integer.parseInt(user_id));
				}			
				
				List<CmsParameter> cmsParameter =  null;
				Integer brand_id = null;	
				
				if(cmsUser != null) {
					brand_id = cmsUser.getBrand_id();
				}
				
				if(brand_id != null) {
					cmsParameter = brandAdminDAO.getAllParametersByBrandId(brand_id, "interview_status");
				}
				
				request.setAttribute("cmsParameter", cmsParameter);
				
				request.setAttribute("page", "brand-interview-status-list");
			}
			else {
				response.sendRedirect("/bootcamp");
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "bootcamp.user.brand.interview.status";
	}
	
	@RequestMapping({"/interview-rounds" })
	public String interviewrounds(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try
		{	
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_type_id").equalsIgnoreCase(Utils.brandId.toString()))) {
				
				String user_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				String user_type = accountMap.get("user_type");
				
				CmsUser cmsUser = null;
				
				if(user_id != null) {
					cmsUser = candidateDAO.getUserById(Integer.parseInt(user_id));
				}			
				
				List<CmsParameter> cmsParameter =  null;
				Integer brand_id = null;	
				
				if(cmsUser != null) {
					brand_id = cmsUser.getBrand_id();
				}
				
				if(brand_id != null) {
					cmsParameter = brandAdminDAO.getAllParametersByBrandId(brand_id, "interview_rounds");
				}
				
				request.setAttribute("cmsParameter", cmsParameter);
				
				request.setAttribute("page", "brand-interview-rounds-list");
			}
			else {
				response.sendRedirect("/bootcamp");
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "bootcamp.user.brand.interview.rounds";
	}
	
	@RequestMapping({"/interview-results" })
	public String interviewresults(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try
		{	
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_type_id").equalsIgnoreCase(Utils.brandId.toString()))) {
				
				String user_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				String user_type = accountMap.get("user_type");
				
				CmsUser cmsUser = null;
				
				if(user_id != null) {
					cmsUser = candidateDAO.getUserById(Integer.parseInt(user_id));
				}			
				
				List<CmsParameter> cmsParameter =  null;
				Integer brand_id = null;	
				
				if(cmsUser != null) {
					brand_id = cmsUser.getBrand_id();
				}
				
				if(brand_id != null) {
					cmsParameter = brandAdminDAO.getAllParametersByBrandId(brand_id, "interview_results");
				}
				
				request.setAttribute("cmsParameter", cmsParameter);
				
				request.setAttribute("page", "brand-interview-results-list");
			}
			else {
				response.sendRedirect("/bootcamp");
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "bootcamp.user.brand.interview.results";
	}
	
	@RequestMapping({"/joining-status" })
	public String joiningstatus(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try
		{	
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_type_id").equalsIgnoreCase(Utils.brandId.toString()))) {
				
				String user_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				String user_type = accountMap.get("user_type");
				
				CmsUser cmsUser = null;
				
				if(user_id != null) {
					cmsUser = candidateDAO.getUserById(Integer.parseInt(user_id));
				}			
				
				List<CmsParameter> cmsParameter =  null;
				Integer brand_id = null;	
				
				if(cmsUser != null) {
					brand_id = cmsUser.getBrand_id();
				}
				
				if(brand_id != null) {
					cmsParameter = brandAdminDAO.getAllParametersByBrandId(brand_id, "joining_status");
				}
				
				request.setAttribute("cmsParameter", cmsParameter);
				
				request.setAttribute("page", "brand-joining-status-list");
			}
			else {
				response.sendRedirect("/bootcamp");
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "bootcamp.user.brand.joining.status";
	}
	
	@RequestMapping({"/offer-status" })
	public String offerstatus(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try
		{	
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_type_id").equalsIgnoreCase(Utils.brandId.toString()))) {
				
				String user_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				String user_type = accountMap.get("user_type");
				
				CmsUser cmsUser = null;
				
				if(user_id != null) {
					cmsUser = candidateDAO.getUserById(Integer.parseInt(user_id));
				}			
				
				List<CmsParameter> cmsParameter =  null;
				Integer brand_id = null;	
				
				if(cmsUser != null) {
					brand_id = cmsUser.getBrand_id();
				}
				
				if(brand_id != null) {
					cmsParameter = brandAdminDAO.getAllParametersByBrandId(brand_id, "offer_status");
				}
				
				request.setAttribute("cmsParameter", cmsParameter);
				
				request.setAttribute("page", "brand-offer-status-list");
			}
			else {
				response.sendRedirect("/bootcamp");
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "bootcamp.user.brand.offer.status";
	}
	
	@RequestMapping({"/document-status" })
	public String documentstatus(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try
		{	
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_type_id").equalsIgnoreCase(Utils.brandId.toString()))) {
				
				String user_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				String user_type = accountMap.get("user_type");
				
				CmsUser cmsUser = null;
				
				if(user_id != null) {
					cmsUser = candidateDAO.getUserById(Integer.parseInt(user_id));
				}			
				
				List<CmsParameter> cmsParameter =  null;
				Integer brand_id = null;	
				
				if(cmsUser != null) {
					brand_id = cmsUser.getBrand_id();
				}
				
				if(brand_id != null) {
					cmsParameter = brandAdminDAO.getAllParametersByBrandId(brand_id, "document_status");
				}
				
				request.setAttribute("cmsParameter", cmsParameter);
				
				request.setAttribute("page", "brand-document-status-list");
			}
			else {
				response.sendRedirect("/bootcamp");
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "bootcamp.user.brand.document.status";
	}
	
	@RequestMapping(value = "/addNewParameterForBrand")
	public void addNewParameterForBrand(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;
		HashMap<String, String> accountMap = null;
		try {

			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_type_id").equalsIgnoreCase(Utils.brandId.toString()))) 
			{
				String user_login_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				String user_type = accountMap.get("user_type");

				commonResponse = new CommonResponse();
				gson = new Gson();
				
				String id = request.getParameter("id");
				String para_type = request.getParameter("para_type");
				String para_title = request.getParameter("para_title");
				String para_description = request.getParameter("para_description");
				
				if(para_type == null) {para_type ="";}
				if(para_title == null) {para_title ="";}
				if(para_description == null) {para_description ="";}
	    		
				para_type = para_type.trim();
				para_title = para_title.trim();
				para_description = para_description.trim();
				
				CmsParameter cmsParameter = null;
				Boolean isFirstTimeParameter = false;
				CmsUser cmsuser = null;
				
				if(!id.isEmpty()) {
					cmsParameter = brandAdminDAO.getParameterById(Integer.parseInt(id));
				}
				
				if(user_login_id != null || !user_login_id.isEmpty()) {
					cmsuser = candidateDAO.getUserById(Integer.parseInt(user_login_id));
				}
				
				if(cmsParameter == null) {
					cmsParameter = new CmsParameter();
					isFirstTimeParameter = true;
				}
				
				cmsParameter.setBrand_id(cmsuser.getBrand_id());
				cmsParameter.setPara_type(para_type);
				cmsParameter.setPara_title(para_title);			
				cmsParameter.setPara_description(para_description);
				
				brandAdminDAO.saveOrUpdateCmsParamer(cmsParameter);			
				
				String str = para_type;
				String capsparaType = str.substring(0, 1).toUpperCase() + str.substring(1);
				
				if(isFirstTimeParameter) {
					commonResponse.setStatus_code(200);
	    			commonResponse.setMsg(capsparaType+" Added Successfully");	    			
	    			writer.print(gson.toJson(commonResponse));
	    			writer.close();
	    			return;
	    		} else {
	    			commonResponse.setStatus_code(200);					
	    			commonResponse.setMsg(capsparaType+" Updated Successfully");
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
	
	@RequestMapping(value="/getParameterById")
	public void getParameterById(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;	
		HashMap<String, String> accountMap = null;
		try 
   		{
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_type_id").equalsIgnoreCase(Utils.adminId.toString())) || (accountMap.get("user_type_id").equalsIgnoreCase(Utils.brandId.toString()))) 
			{
				
				String user_login_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				String user_type = accountMap.get("user_type");
				
				commonResponse = new CommonResponse();
	    		gson = new Gson();	
	    		
	    		String id = request.getParameter("id");
	    		
	    		if(id == null) {id = "";}
	    		
	    		id = id.trim();
	    		
	    		CmsParameter cmsParameter = null;
	    		
	    		if(!id.isEmpty()) {
	    			cmsParameter = brandAdminDAO.getParameterById(Integer.parseInt(id));
	    		}
	    	    
	    		if(cmsParameter != null) {
	    			commonResponse.setStatus("SUCCESS");
	    			commonResponse.setStatus_code(200);
	    			writer.print(gson.toJson(cmsParameter));
	    			writer.close();
	    			return;
	    		} else {
	    			commonResponse.setStatus("FAILURE");
	    			commonResponse.setStatus_code(400);
	    			commonResponse.setMsg("Failure!, Please Try Again");
	    			writer.print(gson.toJson(commonResponse));
	    			writer.close();
	    			return;
	    		}
			}else {
				response.sendRedirect("/bootcamp");
			}
   		}
		catch(Exception ex)
       	{
       		ex.printStackTrace();
       		
       		commonResponse.setStatus("FAILURE");
			commonResponse.setStatus_code(400);
			commonResponse.setMsg("Failure!, Please Try Again");
			writer.print(gson.toJson(commonResponse));
			writer.close();
			return;
       	}
	}
	
	@RequestMapping(value = "/deleteParameterById")
	public void deleteParameterById(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;
		HashMap<String, String> accountMap = null;
		try {

			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_type_id").equalsIgnoreCase(Utils.brandId.toString()))) 
			{
				
				String user_login_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				String user_type = accountMap.get("user_type");

				commonResponse = new CommonResponse();
				gson = new Gson();

				String param_id = request.getParameter("id");
				
				if(param_id == null) {param_id ="";}
	    		
				param_id = param_id.trim();
				
				Brand brand = null;
				CmsParameter cmsParameter = null;
				
				if(!param_id.isEmpty()) {
					cmsParameter = brandAdminDAO.getParameterById(Integer.parseInt(param_id));
				}
				
				if(cmsParameter != null) {
					brand = superAdminDAO.getBrandById(cmsParameter.getBrand_id());
				}
				String str = cmsParameter.getPara_type();
				String capsparaType = str.substring(0, 1).toUpperCase() + str.substring(1);
				
				
				Boolean paramResult = false;
	    		
	    		if(!param_id.isEmpty()) {
	    			
	    			Log log = new Log();
			 		log.setUser_id(Integer.parseInt(user_login_id));
			 		log.setUser_name(user_name);
			 		log.setTitle("The Parameter Deleted");
			 		log.setDescription(user_name+" has deleted the Parameter details ("+cmsParameter.getPara_type()+" and "+cmsParameter.getPara_title()+")");
			 		log.setActivity_time(new Date());
			 		String ipAddr = Utils.getIpAddr(request);
					if(ipAddr == null){ipAddr="";}
			 		log.setIp_addr(ipAddr);
			 		logDAO.saveLog(log);
			 		
			 		paramResult = brandAdminDAO.deleteParameterById(Integer.parseInt(param_id));
	    			
	    		}
	    		
	    		if(paramResult) {
	    			commonResponse.setMsg(capsparaType+" Deleted successfully");
	    			commonResponse.setStatus_code(200);
	    			writer.print(gson.toJson(commonResponse));
	    			writer.close();
	    			return;
	    		} else {
	    			commonResponse.setStatus("FAILURE");
	    			commonResponse.setStatus_code(400);
	    			commonResponse.setMsg("Failure, Please Try Again");
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
	
	@RequestMapping({"/clients" })
	public String clients(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try
		{	
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_type_id").equalsIgnoreCase(Utils.brandId.toString()))) {
				
				String user_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				String user_type = accountMap.get("user_type");
				
				
				
				request.setAttribute("page", "brand-clients");
			}
			else {
				response.sendRedirect("/bootcamp");
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "bootcamp.user.brand.clients";
	}
	

	@RequestMapping({"/brand-jobs" })
	public String brandJobs(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		List<Object[]> object_list = null;
		try
		{	
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_type_id").equalsIgnoreCase(Utils.brandId.toString()))) {
				
				String user_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				String user_type = accountMap.get("user_type");
				
				CmsUser cmsUser = null;
				Integer brand_id = null;
				List<JobMaster> jobMasterList = null;
				if(!user_id.isEmpty()) {
					cmsUser = candidateDAO.getUserById(Integer.parseInt(user_id));
				}
				
				if(cmsUser != null) {
					brand_id = cmsUser.getBrand_id();
				}
				List<JobMasterApplicationResponse> jobMasterApplicationResponseList = new ArrayList<JobMasterApplicationResponse>();
				
				if(brand_id != null) {
					object_list = clientMasterDAO.getJobMasterApplicationCountByBrandId(brand_id);
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
				}				
								
				request.setAttribute("jobMasterList", jobMasterApplicationResponseList);	
				
				request.setAttribute("page", "brand-jobs");
			}
			else {
				response.sendRedirect("/bootcamp");
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "bootcamp.user.brand.jobs";
	}
	@RequestMapping({ "/brand-add-update-jobs" })
	public String client_add_update_jobs(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HashMap<String, String> accountMap = null;
		try {
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_type_id").equalsIgnoreCase(Utils.brandId.toString()))) {
				
				String user_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				String user_type = accountMap.get("user_type");
				
				CmsUser cmsUser = null;
				Integer brand_id = null;
				if(!user_id.isEmpty()) {
					cmsUser = candidateDAO.getUserById(Integer.parseInt(user_id));
				}
				
				if(cmsUser != null) {
					brand_id = cmsUser.getBrand_id();
				}

				String id = request.getParameter("id");
				String source = request.getParameter("source");
				
				request.setAttribute("source",source);
				JobMaster jobMaster = null;

				if (id != null) {
					jobMaster = jobMasterDAO.getJobsById(Integer.parseInt(id));
					request.setAttribute("jobMaster", jobMaster);
				}
				
				List<ClientMaster> clientMaster = brandAdminDAO.getAllActiveClientsByBrandId(brand_id);
				request.setAttribute("clientMaster", clientMaster);
				
				request.setAttribute("page", "add-update-jobs");

			} else {
				response.sendRedirect("/bootcamp");
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return "bootcamp.user.brand.add.update.jobs";
	}
	@RequestMapping(value = "/brandaddOrUpdateNewJob")
	public void brandaddOrUpdateNewJob(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;	
		HashMap<String, String> accountMap = null;
		try 
   		{
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_type_id").equalsIgnoreCase(Utils.brandId.toString()))) {
				
				String user_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				String user_type = accountMap.get("user_type");
				
				CmsUser cmsUser = null;
				Integer brand_id = null;
				if(!user_id.isEmpty()) {
					cmsUser = candidateDAO.getUserById(Integer.parseInt(user_id));
				}				
				if(cmsUser != null) {
					brand_id = cmsUser.getBrand_id();
				}
			commonResponse = new CommonResponse();
    		gson = new Gson();	
    		
    		String authCode = RandomStringUtils.random(8, "0123456789abcdef");
    		
    		String id = request.getParameter("id");
    		Date date = new Date();
    		String client_ids = request.getParameter("client_ids");
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
    		String meta_title = request.getParameter("meta_title");
    		String meta_desc = request.getParameter("meta_desc");
    		String meta_keywords = request.getParameter("meta_keywords");
    		String active = request.getParameter("active");
    		
    		if(id == null) {id = "";}
    		if(client_ids == null) {client_ids = "";}
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
    		if(meta_title == null) {meta_title = "";}
    		if(meta_desc == null) {meta_desc = "";}
    		if(meta_keywords == null) {meta_keywords = "";}
    		if(active == null) {active = "";}
    		
    		id = id.trim();
    		client_ids = client_ids.trim();
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
    		
    		jobs.setBrand_id(brand_id);
    		jobs.setDate(date);
    		jobs.setClient_id(client_ids);
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
			else
			{
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
	
	@RequestMapping({ "/brand-view-jobs" })
	public String brand_view_jobs(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HashMap<String, String> accountMap = null;
		
		try {
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_type_id").equalsIgnoreCase(Utils.brandId.toString()))) {

				String id = request.getParameter("id");
				//String jobs_id = id;
				JobMaster jobMaster = null;
					System.out.println("id ========"+id);
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
					System.out.println("size ========"+candidateresponseList.size());
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
		
		return "bootcamp.user.brand.view.job";
	}
	
	@RequestMapping(value="/brandactivateDeactivateJob")
	public void brandactivateDeactivateJob(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;	
		
		HashMap<String, String> accountMap = null;
		try 
   		{			
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_type_id").equalsIgnoreCase(Utils.brandId.toString()))) {
				
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
	
	@RequestMapping(value="/branddownloadXLForAppliedCandidatesByJobID")
	public void downloadXLForAppliedCandidatesByJobID(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try 
		{
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_type_id").equalsIgnoreCase(Utils.brandId.toString()))) {
				
			String user_id = accountMap.get("user_id");
			String user_email = accountMap.get("user_email");
			String user_name = accountMap.get("user_name");
			String user_type_id = accountMap.get("user_type_id");
			
			String job_id = request.getParameter("job_id");
			
			if(job_id == null) {job_id = "";}
			
			job_id = job_id.trim();
			
			List<Candidate> candidateList = null;
			JobMaster jobMaster = null;
			
			if(!job_id.isEmpty()) {
				candidateList = candidateDAO.getAllCandidatesByJobId(Integer.parseInt(job_id));
				jobMaster = jobMasterDAO.getJobsById(Integer.parseInt(job_id));
			}
			
			Date date = new Date();  
		    SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");  
		    String strDate = formatter.format(date);  
		   
		    formatter = new SimpleDateFormat("dd-MMMM-yyyy");  
		    strDate = formatter.format(date);  
		    
			response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-Disposition", "attachment;filename=Application-List-"+strDate+"-"+jobMaster.getRole_name()+".xlsx");
			
			Workbook wb = new Workbook(response.getOutputStream(), "MyApplication", "1.0");
			Worksheet ws = wb.newWorksheet("Teksands Applied Candidate List");
			
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
									
			ws.value(0, 0, jobMaster.getRole_name());
			ws.range(0, 0, 0, 5).merge();
			ws.range(0, 0, 0, 5).style().horizontalAlignment("center").set();
			ws.style(0, 0).bold().fontSize(11).set(); 

			int i = 1;
			int j = 0;
			for(j = 0; j <= 48; j++) {
				ws.style(i, j).bold().fontSize(9).borderStyle("bold").borderColor("0f76bd").wrapText(true).set();	
			}
			
			ws.value(i, 0, "Date of Application.");
			ws.value(i, 1, "Id");
			ws.value(i, 2, "Job Title");
	        ws.value(i, 3, "Name");
		    ws.value(i, 4, "Email");
		    ws.value(i, 5, "Mobile");
		    ws.value(i, 6, "Gender");
		    ws.value(i, 7, "Marital Status");
		    ws.value(i, 8, "Home Town");
		    ws.value(i, 9, "Date of Birth");
		    ws.value(i, 10, "Current Location");
		    ws.value(i, 11, "Preferred Location");
		    ws.value(i, 12, "Permanent Address");
		    ws.value(i, 13, "Permanent City");
		    ws.value(i, 14, "Permanent State");
		    ws.value(i, 15, "Permanent Country");
		    ws.value(i, 16, "Pincode");
		    ws.value(i, 17, "Resume");
		    ws.value(i, 18, "Total Experience");
		    ws.value(i, 19, "Current Company Name");
		    ws.value(i, 20, "Current Company Resigination");
		    ws.value(i, 21, "Functional Area");
		    ws.value(i, 22, "Role");
		    ws.value(i, 23, "Industry");
		    ws.value(i, 24, "Key Skills");
		    ws.value(i, 25, "Annual Salary");
		    ws.value(i, 26, "Notice Period");
		    ws.value(i, 27, "Last Working Day");
		    ws.value(i, 28, "Resume Heading");
		    ws.value(i, 29, "Summary");
		    ws.value(i, 30, "UG Degree");
		    ws.value(i, 31, "UG Specialization");
		    ws.value(i, 32, "UG College Name");
		    ws.value(i, 33, "UG Graduation Year");
		    ws.value(i, 34, "PG Degree");
		    ws.value(i, 35, "PG Specialization");
		    ws.value(i, 36, "PG College Name");
		    ws.value(i, 37, "PG Graduation Year");
		    ws.value(i, 38, "Doctorate Degree");
		    ws.value(i, 39, "Doctorate Specialization");
		    ws.value(i, 40, "Doctorate College Name");
		    ws.value(i, 41, "Doctorate Graduation Year");
		    ws.value(i, 42, "Work Permit Status");
		    ws.value(i, 43, "TS Screening Comment 1");
		    ws.value(i, 44, "TS Screening Comment 2");
		    ws.value(i, 45, "TS Screening Comment 3");
		    ws.value(i, 46, "TS Grade");
		    ws.value(i, 47, "Placed Company");
		    ws.value(i, 48, "Placed Date");
		    ws.value(i++, 49, "Inactive Reason");
		    
	 		for(Candidate downloadCanidateList : candidateList)
	 		{
	 			if(downloadCanidateList.getCreated_date() != null) {
					ws.value(i, 0, sdf.format(downloadCanidateList.getCreated_date()));
					ws.style(i, 0).fontSize(9).wrapText(true).set();
				}else {
					ws.value(i, 0, "--");
					ws.style(i, 0).fontSize(9).wrapText(true).set();
				}
	 			
	 			ws.value(i, 1, downloadCanidateList.getId());
				ws.style(i, 1).fontSize(9).wrapText(true).set();
				
				ws.value(i, 2, downloadCanidateList.getJob_title());
				ws.style(i, 2).fontSize(9).wrapText(true).set();

				ws.value(i, 3, downloadCanidateList.getName());
				ws.style(i, 3).fontSize(9).wrapText(true).set();
				
				ws.value(i, 4, downloadCanidateList.getEmail());
				ws.style(i, 4).fontSize(9).wrapText(true).set();
				
				ws.value(i, 5, downloadCanidateList.getMobile());
				ws.style(i, 5).fontSize(9).wrapText(true).set();
				
				ws.value(i, 6, downloadCanidateList.getGender());
				ws.style(i, 6).fontSize(9).wrapText(true).set();
				
				ws.value(i, 7, downloadCanidateList.getMarital_status());
				ws.style(i, 7).fontSize(9).wrapText(true).set();
				
				ws.value(i, 8, downloadCanidateList.getHome_town());
				ws.style(i, 8).fontSize(9).wrapText(true).set();
				
				if(downloadCanidateList.getDate_of_birth() != null) {
					ws.value(i, 9, sdf.format(downloadCanidateList.getDate_of_birth()));
					ws.style(i, 9).fontSize(9).wrapText(true).set();
				}else {
					ws.value(i, 9, "--");
					ws.style(i, 9).fontSize(9).wrapText(true).set();
				}
				
				ws.value(i, 10, downloadCanidateList.getCurrent_location());
				ws.style(i, 10).fontSize(9).wrapText(true).set();
				
				ws.value(i, 11, downloadCanidateList.getPreferred_location());
				ws.style(i, 11).fontSize(9).wrapText(true).set();

				ws.value(i, 12, downloadCanidateList.getPermanent_address());
				ws.style(i, 12).fontSize(9).wrapText(true).set();
				
				ws.value(i, 13, downloadCanidateList.getPermanent_city());
				ws.style(i, 13).fontSize(9).wrapText(true).set();
				
				ws.value(i, 14, downloadCanidateList.getPermanent_state());
				ws.style(i, 14).fontSize(9).wrapText(true).set();
				
				ws.value(i, 15, downloadCanidateList.getPermanent_country());
				ws.style(i, 15).fontSize(9).wrapText(true).set();
				
				ws.value(i, 16, downloadCanidateList.getPermanent_pincode());
				ws.style(i, 16).fontSize(9).wrapText(true).set();
				
				ws.value(i, 17, downloadCanidateList.getResume());
				ws.style(i, 17).fontSize(9).wrapText(true).set();
				
				ws.value(i, 18, downloadCanidateList.getTotal_experience());
				ws.style(i, 18).fontSize(9).wrapText(true).set();
				
				ws.value(i, 19, downloadCanidateList.getCurr_company_name());
				ws.style(i, 19).fontSize(9).wrapText(true).set();
				
				ws.value(i, 20, downloadCanidateList.getCurr_company_desigination());
				ws.style(i, 20).fontSize(9).wrapText(true).set();
				
				ws.value(i, 21, downloadCanidateList.getFunctional_area());
				ws.style(i, 21).fontSize(9).wrapText(true).set();
				
				ws.value(i, 22, downloadCanidateList.getRole());
				ws.style(i, 22).fontSize(9).wrapText(true).set();
				
				ws.value(i, 23, downloadCanidateList.getIndustry());
				ws.style(i, 23).fontSize(9).wrapText(true).set();
				
				ws.value(i, 24, downloadCanidateList.getKey_skills());
				ws.style(i, 24).fontSize(9).wrapText(true).set();
				
				ws.value(i, 25, downloadCanidateList.getAnnual_salary());
				ws.style(i, 25).fontSize(9).wrapText(true).set();
				
				ws.value(i, 26, downloadCanidateList.getNotice_period());
				ws.style(i, 26).fontSize(9).wrapText(true).set();
				
				
				if(downloadCanidateList.getLast_working_day() != null) {
					ws.value(i, 27, sdf.format(downloadCanidateList.getLast_working_day()));
					ws.style(i, 27).fontSize(9).wrapText(true).set();
				}else {
					ws.value(i, 27, "--");
					ws.style(i, 27).fontSize(9).wrapText(true).set();
				}
				
				ws.value(i, 28, downloadCanidateList.getResume_headling());
				ws.style(i, 28).fontSize(9).wrapText(true).set();
				
				ws.value(i, 29, downloadCanidateList.getSummary());
				ws.style(i, 29).fontSize(9).wrapText(true).set();
				
				ws.value(i, 30, downloadCanidateList.getUg_degree());
				ws.style(i, 30).fontSize(9).wrapText(true).set();
				
				ws.value(i, 31, downloadCanidateList.getUg_specialization());
				ws.style(i, 31).fontSize(9).wrapText(true).set();
				
				ws.value(i, 32, downloadCanidateList.getUg_college_name());
				ws.style(i, 32).fontSize(9).wrapText(true).set();
				
				ws.value(i, 33, downloadCanidateList.getUg_graduation_year());
				ws.style(i, 33).fontSize(9).wrapText(true).set();
				
				ws.value(i, 34, downloadCanidateList.getPg_degree());
				ws.style(i, 34).fontSize(9).wrapText(true).set();
				
				ws.value(i, 35, downloadCanidateList.getPg_specialization());
				ws.style(i, 35).fontSize(9).wrapText(true).set();
				
				ws.value(i, 36, downloadCanidateList.getPg_college_name());
				ws.style(i, 36).fontSize(9).wrapText(true).set();
				
				ws.value(i, 37, downloadCanidateList.getPg_graduation_year());
				ws.style(i, 37).fontSize(9).wrapText(true).set();
				
				ws.value(i, 38, downloadCanidateList.getDoctorate_degree());
				ws.style(i, 38).fontSize(9).wrapText(true).set();
				
				ws.value(i, 39, downloadCanidateList.getDoctorate_specialization());
				ws.style(i, 39).fontSize(9).wrapText(true).set();
				
				ws.value(i, 40, downloadCanidateList.getDoctorate_university());
				ws.style(i, 40).fontSize(9).wrapText(true).set();
				
				ws.value(i, 41, downloadCanidateList.getDoctorate_graduation_year());
				ws.style(i, 41).fontSize(9).wrapText(true).set();
				
				ws.value(i, 42, downloadCanidateList.getWork_permit_status());
				ws.style(i, 42).fontSize(9).wrapText(true).set();
				
				ws.value(i, 43, downloadCanidateList.getTs_screening_comment_1());
				ws.style(i, 43).fontSize(9).wrapText(true).set();
				
				ws.value(i, 44, downloadCanidateList.getTs_screening_comment_2());
				ws.style(i, 44).fontSize(9).wrapText(true).set();
				
				ws.value(i, 45, downloadCanidateList.getTs_screening_comment_3());
				ws.style(i, 45).fontSize(9).wrapText(true).set();
				
				ws.value(i, 46, downloadCanidateList.getTs_screening_grade());
				ws.style(i, 46).fontSize(9).wrapText(true).set();

				ws.value(i, 47, downloadCanidateList.getPlaced_company());
				ws.style(i, 47).fontSize(9).wrapText(true).set();
				
				if(downloadCanidateList.getPlaced_date() != null) {
					ws.value(i, 48, sdf.format(downloadCanidateList.getPlaced_date()));
					ws.style(i, 48).fontSize(9).wrapText(true).set();
				}else {
					ws.value(i, 48, "--");
					ws.style(i, 48).fontSize(9).wrapText(true).set();
				}
				
				ws.value(i, 49, downloadCanidateList.getInactive_reason());
				ws.style(i++, 49).fontSize(9).wrapText(true).set();
				
	 		}
	 		wb.finish();

	 		Log log = new Log();
	 		log.setUser_id(Integer.parseInt(user_id));
	 		log.setUser_name(user_name);
	 		log.setTitle("Candidate Excell Downloaded");
	 		log.setDescription(user_name + " was Downloaded the Candidate List");
	 		log.setActivity_time(new Date());
	 		String ipAddr = Utils.getIpAddr(request);
			if(ipAddr == null){ipAddr="";}
	 		log.setIp_addr(ipAddr);
	 		logDAO.saveLog(log);
		} 
		else {
			
			response.sendRedirect("/bootcamp");
			}
		}
 		catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}
	
	@RequestMapping(value="/brandgetAllAppliedCandidateCvAndZipAndDownload")
	public void zipAndDownloadCVForAppliedCandidatesByJobID(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		
		try 
		{
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_type_id").equalsIgnoreCase(Utils.brandId.toString()))) {
				String user_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				
				String job_id = request.getParameter("job_id");
				
				if(job_id == null) {job_id = "";}
				
				job_id = job_id.trim();
				
				List<Candidate> candidateList = null;
				
				if(!job_id.isEmpty()) {
					candidateList = candidateDAO.getAllCandidatesByJobId(Integer.parseInt(job_id));
				}
		 		
				response.setContentType("application/zip");
		        response.setHeader("Content-Disposition", "attachment; filename=Canidate-Resumes.zip");
		        
		        try ( ZipOutputStream zos = new ZipOutputStream(response.getOutputStream()) ) 
		        {
		        	String path = properties.getCandidateResume();
		    		
		    		List<String> srcFiles = new ArrayList<>();

		    		for (Candidate candidate : candidateList) {
		    			
		    			URL url = null;
		    			
		    			if(!candidate.getResume().isEmpty()) {
		    				url = new URL(candidate.getResume());
		    			}

		    			String fileName = null;
		    			
		    			if(url != null) {
		    				fileName = FilenameUtils.getName(url.getPath());
		    			}
		    	        
		    	        File file  = null;
		    	        
		    	        if(fileName != null) {
		    	        	file = new File(path+"/"+fileName);
		    	        }
		    			
		    	        if(file != null) {
		    				if(file.exists()) {
			    				srcFiles.add(path +"/"+ fileName);
			    			}
		    			}
					}
		            
		    		srcFiles = srcFiles.stream().distinct().collect(Collectors.toList()); //duplicate remove
		    		
		    		for (String srcFile : srcFiles) {
		                File fileToZip = new File(srcFile);
		                FileInputStream fis = new FileInputStream(fileToZip);
		                ZipEntry zipEntry = new ZipEntry(fileToZip.getName());
		                zos.putNextEntry(zipEntry);

		                byte[] bytes = new byte[1024];
		                int length;
		                while((length = fis.read(bytes)) >= 0) {
		                	zos.write(bytes, 0, length);
		                }
		                fis.close();
		            }
		    		zos.close();
		    		
		    		Log log = new Log();
			 		log.setUser_id(Integer.parseInt(user_id));
			 		log.setUser_name(user_name);
			 		log.setTitle("Candidate Resumes Downloaded");
			 		log.setDescription(user_name + " was Downloaded the Candidate Resumes");
			 		log.setActivity_time(new Date());
			 		String ipAddr = Utils.getIpAddr(request);
					if(ipAddr == null){ipAddr="";}
			 		log.setIp_addr(ipAddr);
			 		logDAO.saveLog(log);
		        }
		        
			}else {
				response.sendRedirect("/bootcamp");
			}
		}
 		catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}
	@RequestMapping({ "/brand-view-candidate" })
	public String view_candidate(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HashMap<String, String> accountMap = null;
		try {
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_type_id").equalsIgnoreCase(Utils.brandId.toString()))) {

				String id = request.getParameter("id");
				String jobId = request.getParameter("jobId");

				Candidate candidate = null;

				if (id != null) {
					candidate = candidateDAO.getCandidateById(Integer.parseInt(id));
					request.setAttribute("candidate", candidate);
				}
				
				if(id != null) {
					List<CandidateFeedback> candidateFeedbackList = candidateDAO.getCandidateFeedbackByCandidateId(Integer.parseInt(id));
					request.setAttribute("candidateFeedbackList", candidateFeedbackList);
				}

				if (id != null) {
					List<CallSchedule> callScheduleList = candidateDAO.getAllCallScheduleByCandidateId(Integer.parseInt(id));
					request.setAttribute("callScheduleList", callScheduleList);
				}
				
				if (id != null) {
					List<TestResults> testResultsList = candidateDAO.getAllTestResultbyCandidateIt(Integer.parseInt(id));
					request.setAttribute("testResultsList", testResultsList);
				}
				
				if (id != null) {
					List<Interview> activeInterviewList = interviewDAO.getAllInterviewbyCandidateId(Integer.parseInt(id));
					request.setAttribute("activeInterviewList", activeInterviewList);
				}

				request.setAttribute("page", "view-candidate");
				request.setAttribute("jobId", jobId);

			} else {
				response.sendRedirect("/bootcamp");
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return "bootcamp.brand.view.candidate";
	}
	@RequestMapping({ "/brand-candidate-list" })
	public String candidate(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HashMap<String, String> accountMap = null;
		try {
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_type_id").equalsIgnoreCase(Utils.brandId.toString()))) {

				List<Candidate> candidateList = candidateDAO.getAllCandidate();
				request.setAttribute("candidateList", candidateList);
				
				List<MentorMaster> mentorMasterList = mentorMasterDAO.getAllMentorMaster();
				request.setAttribute("mentorMasterList", mentorMasterList);
				
				request.setAttribute("page", "candidate");

			} else {
				response.sendRedirect("/bootcamp");
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return "bootcamp.brand.candidate";
	}
	@RequestMapping({ "/brand-add-update-candidate" })
	public String add_candidate(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HashMap<String, String> accountMap = null;
		try {
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_type_id").equalsIgnoreCase(Utils.brandId.toString()))) {

				String domain = properties.getHostDomainUrl();
				request.setAttribute("resume_path",  domain + "resources/cms/img/candidate-resumes/");

				String id = request.getParameter("id");
				String source = request.getParameter("source");
				
				request.setAttribute("source",source);
				Candidate candidate = null;

				if (id != null) {
					candidate = candidateDAO.getCandidateById(Integer.parseInt(id));
					request.setAttribute("candidate", candidate);
				}

				List<ClientMaster> clientMasterList = clientMasterDAO.getAllClientMaster();
				request.setAttribute("clientMasterList", clientMasterList);

				request.setAttribute("page", "add-candidate");

			} else {
				response.sendRedirect("/bootcamp");
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return "bootcamp.brand.add.candidate";
	}
	@RequestMapping(value = "/brandaddOrUpdateCandidate")
	public void addEditCandidate(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;

		HashMap<String, String> accountMap = null;
		try {
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_type_id").equalsIgnoreCase(Utils.brandId.toString()))) {
				
				String user_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				String user_type = accountMap.get("user_type");

				commonResponse = new CommonResponse();
				gson = new Gson();

				String id = request.getParameter("id");
				String name = request.getParameter("name");
				String mobile = request.getParameter("mobile");
				String email = request.getParameter("email");
				String gender = request.getParameter("gender");
				String birth_of_date = request.getParameter("birth_of_date");
				String marital_status = request.getParameter("marital_status");
				String curr_location = request.getParameter("curr_location");
				String pre_location = request.getParameter("pre_location");
				String permanent_address = request.getParameter("permanent_address");
				String permanent_pincode = request.getParameter("permanent_picode");
				String permanent_city = request.getParameter("permanent_city");
				String permanent_state = request.getParameter("permanent_state");
				String permanent_country = request.getParameter("permanent_country");

				String resume_heading = request.getParameter("resume_heading");
				String summary = request.getParameter("summary");
				String current_company_name = request.getParameter("current_company_name");
				String current_designation = request.getParameter("current_designation");
				String functional_area = request.getParameter("functional_area");
				String industry = request.getParameter("industry");
				String total_experience = request.getParameter("total_experience");
				String role = request.getParameter("role");
				String key_skills = request.getParameter("key_skills");
				String annual_salary = request.getParameter("annual_salary");
				String notice_period = request.getParameter("notice_period");
				String work_permit_status = request.getParameter("work_permit_status");

				String ug_college_name = request.getParameter("ug_college_name");
				String ug_degree = request.getParameter("ug_degree");
				String ug_specialization = request.getParameter("ug_specialization");
				String ug_graduation_year = request.getParameter("ug_graduation_year");
				String pg_college_name = request.getParameter("pg_college_name");
				String pg_degree = request.getParameter("pg_degree");
				String pg_specialization = request.getParameter("pg_specialization");
				String pg_graduation_year = request.getParameter("pg_graduation_year");
				String doctorate_university = request.getParameter("doctorate_university");
				String doctorate_degree = request.getParameter("doctorate_degree");
				String doctorate_specialization = request.getParameter("doctorate_specialization");
				String doctorate_graduation_year = request.getParameter("doctorate_graduation_year");

				String ts_screening_1 = request.getParameter("ts_screening_1");
				String ts_screening_2 = request.getParameter("ts_screening_2");
				String ts_screening_3 = request.getParameter("ts_screening_3");
				String placed_company = request.getParameter("placed_company");
				String ts_screening_grade = request.getParameter("ts_screening_grade");
				String placed = request.getParameter("placed");
				String placed_date = request.getParameter("placed_date");
				String resume = request.getParameter("resume");

				String active = request.getParameter("active");

				if (id == null) {id = "";}

				Date birth_date = null;

				if (birth_of_date != null && !birth_of_date.isEmpty()) {
					birth_date = new SimpleDateFormat("yyyy-MM-dd").parse(birth_of_date);
				}

				Candidate candidate = null;
				Boolean isCandidateRegisteringForFirstTime = false;

				if (!id.isEmpty()) {
					candidate = candidateDAO.getCandidateById(Integer.parseInt(id));
				}

				if (candidate == null) {
					candidate = new Candidate();
					isCandidateRegisteringForFirstTime = true;
				}
				
				candidate.setBootcamp_ids("0");
				candidate.setBootcamp_name("");
				candidate.setName(name);
				candidate.setEmail(email);
				candidate.setMobile(mobile);
				candidate.setGender(gender);
				candidate.setDate_of_birth(birth_date);
				candidate.setMarital_status(marital_status);
				candidate.setCurrent_location(curr_location);
				candidate.setPreferred_location(pre_location);
				candidate.setPermanent_address(permanent_address);
				candidate.setPermanent_city(permanent_city);
				candidate.setPermanent_state(permanent_state);
				candidate.setPermanent_country(permanent_country);
				candidate.setPermanent_pincode(permanent_pincode);

				candidate.setResume_headling(resume_heading);
				candidate.setSummary(summary);
				candidate.setCurr_company_name(current_company_name);
				candidate.setCurr_company_desigination(current_designation);
				candidate.setFunctional_area(functional_area);
				candidate.setIndustry(industry);

				if (total_experience != null && !total_experience.isEmpty()) {
					candidate.setTotal_experience(total_experience);
				} else {
					candidate.setTotal_experience("");
				}

				candidate.setRole(role);
				candidate.setKey_skills(key_skills);
				candidate.setAnnual_salary(annual_salary);
				candidate.setNotice_period(notice_period);
				candidate.setWork_permit_status(work_permit_status);

				candidate.setUg_college_name(ug_college_name);
				candidate.setUg_degree(ug_degree);
				candidate.setUg_specialization(ug_specialization);

				if (ug_graduation_year != null && !ug_graduation_year.isEmpty()) {
					candidate.setUg_graduation_year(ug_graduation_year);
				} else {
					candidate.setUg_graduation_year("");
				}

				candidate.setPg_college_name(pg_college_name);
				candidate.setPg_degree(pg_degree);
				candidate.setPg_specialization(pg_specialization);

				if (pg_graduation_year != null && !pg_graduation_year.isEmpty()) {
					candidate.setPg_graduation_year(pg_graduation_year);
				} else {
					candidate.setPg_graduation_year("");
				}

				candidate.setDoctorate_university(doctorate_university);
				candidate.setDoctorate_degree(doctorate_degree);
				candidate.setDoctorate_specialization(doctorate_specialization);

				if (doctorate_graduation_year != null && !doctorate_graduation_year.isEmpty()) {
					candidate.setDoctorate_graduation_year(doctorate_graduation_year);
				} else {
					candidate.setDoctorate_graduation_year("");
				}

				candidate.setTs_screening_comment_1(ts_screening_1);
				candidate.setTs_screening_comment_2(ts_screening_2);
				candidate.setTs_screening_comment_3(ts_screening_3);

				candidate.setPlaced_company(placed_company);
				candidate.setTs_screening_grade(ts_screening_grade);
				candidate.setResume(resume);

				if (placed.equalsIgnoreCase("Yes")) {
					candidate.setPlaced(true);
				} else {
					candidate.setPlaced(false);
				}

				Date date_of_placed = null;

				if (placed_date != null && !placed_date.isEmpty()) {
					date_of_placed = new SimpleDateFormat("yyyy-MM-dd").parse(placed_date);
					candidate.setPlaced_date(date_of_placed);
				} else {
					candidate.setPlaced_date(null);
				}

				candidate.setCreated_date(new Date());

				if (active.equalsIgnoreCase("1")) {
					candidate.setInactive_reason("");
					candidate.setActive(true);
				} else {
					String rejection_reason = request.getParameter("rejection_reason");
					candidate.setInactive_reason(rejection_reason);
					candidate.setActive(false);
				}

				candidateDAO.saveOrUpdateCandidate(candidate);

				if (isCandidateRegisteringForFirstTime) {
					Log log = new Log();
			 		log.setUser_id(Integer.parseInt(user_id));
			 		log.setUser_name(user_name);
			 		log.setTitle("New Candidate Created");
			 		log.setDescription(user_name+" has created the new candidate ("+name+")");
			 		log.setActivity_time(new Date());
			 		String ipAddr = Utils.getIpAddr(request);
					if(ipAddr == null){ipAddr="";}
			 		log.setIp_addr(ipAddr);
			 		logDAO.saveLog(log);

					commonResponse.setStatus("SUCCESS");
					commonResponse.setStatus_code(200);
					commonResponse.setMsg("The New Candidate Added Successfully.");
					writer.print(gson.toJson(commonResponse));
					writer.close();
					return;

				} else {
					Log log = new Log();
			 		log.setUser_id(Integer.parseInt(user_id));
			 		log.setUser_name(user_name);
			 		log.setTitle("New Candidate Details Updated");
			 		log.setDescription(user_name+" has updated details to the following candidate ("+name+")");
			 		log.setActivity_time(new Date());
			 		String ipAddr = Utils.getIpAddr(request);
					if(ipAddr == null){ipAddr="";}
			 		log.setIp_addr(ipAddr);
			 		logDAO.saveLog(log);
			 		
					commonResponse.setStatus("SUCCESS");
					commonResponse.setStatus_code(200);
					commonResponse.setMsg("The Candidate Details are Updated Successfully.");
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
	
	@RequestMapping(value = "/brandactivateDeactivateCandidate")
	public void activateDeactivateCandidate(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;

		HashMap<String, String> accountMap = null;
		try {
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_type_id").equalsIgnoreCase(Utils.brandId.toString()))) {
				
				String user_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				String user_type = accountMap.get("user_type");

				commonResponse = new CommonResponse();
				gson = new Gson();

				String id = request.getParameter("id");

				Candidate candidate = null;
				Boolean activateDeactivateCandidate = false;

				if (!id.isEmpty()) {
					candidate = candidateDAO.getCandidateById(Integer.parseInt(id));
				}

				Boolean active = candidate.getActive();

				if (active == true) {
					candidate.setActive(false);
				} else {
					candidate.setActive(true);
				}

				candidateDAO.saveOrUpdateCandidate(candidate);

				if (active == true) {
					
					Log log = new Log();
			 		log.setUser_id(Integer.parseInt(user_id));
			 		log.setUser_name(user_name);
			 		log.setTitle("Candidate Deactivated");
			 		log.setDescription(user_name+" has deactivated the following candidate ("+candidate.getName()+")");
			 		log.setActivity_time(new Date());
			 		String ipAddr = Utils.getIpAddr(request);
					if(ipAddr == null){ipAddr="";}
			 		log.setIp_addr(ipAddr);
			 		logDAO.saveLog(log);

					commonResponse.setStatus("SUCCESS");
					commonResponse.setStatus_code(200);
					commonResponse.setMsg("The Candidate Deactivated Successfully");
					writer.print(gson.toJson(commonResponse));
					writer.close();
					return;

				} else {
					Log log = new Log();
			 		log.setUser_id(Integer.parseInt(user_id));
			 		log.setUser_name(user_name);
			 		log.setTitle("Candidate Activated");
			 		log.setDescription(user_name+" has activated the following candidate ("+candidate.getName()+")");
			 		log.setActivity_time(new Date());
			 		String ipAddr = Utils.getIpAddr(request);
					if(ipAddr == null){ipAddr="";}
			 		log.setIp_addr(ipAddr);
			 		logDAO.saveLog(log);
			 		
					commonResponse.setStatus("SUCCESS");
					commonResponse.setStatus_code(200);
					commonResponse.setMsg("The Candidate Activated Successfully.");
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
	
	@RequestMapping(value = "/brandscheduleCallToCandidate")
	public void brandscheduleCallToCandidate(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;

		HashMap<String, String> accountMap = null;
		try {
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_type_id").equalsIgnoreCase(Utils.brandId.toString()))) {
				
				String user_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				String user_type = accountMap.get("user_type");

				commonResponse = new CommonResponse();
				gson = new Gson();

				String candidate_id = request.getParameter("candidate_id");
				String call_dat_Str = request.getParameter("call_date");
				String call_time = request.getParameter("call_time");
				String call_reason = request.getParameter("call_reason");

				Date call_date = null;
				
				if(call_dat_Str != null && !call_dat_Str.isEmpty()) {
					call_date = new SimpleDateFormat("yyyy-MM-dd").parse(call_dat_Str);
				}

				DateFormat f1 = new SimpleDateFormat("HH:mm");
				Date d = f1.parse(call_time);
				DateFormat f2 = new SimpleDateFormat("h:mma");
				f2.format(d).toLowerCase();

				if (candidate_id == null || candidate_id == "") {
					commonResponse.setStatus("FAILURE");
					commonResponse.setStatus_code(400);
					commonResponse.setMsg("Candidate Not Found");
					writer.print(gson.toJson(commonResponse));
					writer.close();
					return;
				}

				if (!candidate_id.isEmpty()) {
					
					Candidate candidate = candidateDAO.getCandidateById(Integer.parseInt(candidate_id));

					String candidate_name = candidate.getName();
					String candidate_email = candidate.getEmail();
					String call_timeStr = f2.format(d).toLowerCase();

					sendEmailUtil.schedulecallToCandidate(candidate_name, candidate_email, call_dat_Str, call_timeStr,call_reason);

					CallSchedule callSchedule = new CallSchedule();
					callSchedule.setCandidate_id(Integer.parseInt(candidate_id));
					callSchedule.setCandidate_name(candidate.getName());
					callSchedule.setCall_time(f2.format(d).toLowerCase());
					callSchedule.setCall_date(call_date);
					callSchedule.setCall_reason(call_reason);
					callSchedule.setMail_status(true);
					callSchedule.setCreated_date(new Date());
					callSchedule.setActive(true);
					candidateDAO.saveOrUpdateCallSchedule(callSchedule);
					
					if(candidate != null) {
						candidate.setCall_schedule_id(callSchedule.getId());
						candidate.setCall_schedule_status(true);
						candidateDAO.saveOrUpdateCandidate(candidate);
					}
					
					Log log = new Log();
			 		log.setUser_id(Integer.parseInt(user_id));
			 		log.setUser_name(user_name);
			 		log.setTitle("Call Scheduled to Candidate");
			 		log.setDescription(user_name+" has scheduled a call to the following candidate ("+candidate.getName()+")");
			 		log.setActivity_time(new Date());
			 		String ipAddr = Utils.getIpAddr(request);
					if(ipAddr == null){ipAddr="";}
			 		log.setIp_addr(ipAddr);
			 		logDAO.saveLog(log);
			 		
					commonResponse.setStatus("SUCCESS");
					commonResponse.setStatus_code(200);
					commonResponse.setMsg("Call Scheduled Successfully.");
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
			commonResponse.setMsg("Something Error, Please Try Again");
			writer.print(gson.toJson(commonResponse));
			writer.close();
			return;
		}
	}
	@RequestMapping(value = "/brandupdateCandidateFeedback")
	public void brandupdateCandidateFeedback(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;

		HashMap<String, String> accountMap = null;
		try {
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_type_id").equalsIgnoreCase(Utils.brandId.toString()))) {
				
				String user_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				String user_type = accountMap.get("user_type");

				commonResponse = new CommonResponse();
				gson = new Gson();

				String id = request.getParameter("id");
				String interview_type = request.getParameter("interview_type");
				String mentor_id = request.getParameter("mentor_id");
				String ts_screening_grade = request.getParameter("ts_screening_grade");
				String feedback = request.getParameter("feedback");

				if (id == null || id == "") {
					commonResponse.setStatus("FAILURE");
					commonResponse.setStatus_code(400);
					commonResponse.setMsg("Candidate Not Found");
					writer.print(gson.toJson(commonResponse));
					writer.close();
					return;
				}

				if (!id.isEmpty()) {
					Candidate candidate = candidateDAO.getCandidateById(Integer.parseInt(id));
					MentorMaster mentorMaster = mentorMasterDAO.getMentorMasterById(Integer.parseInt(mentor_id));

					CandidateFeedback candidateFeedback = new CandidateFeedback();
					candidateFeedback.setCandidate_id(Integer.parseInt(id));
					candidateFeedback.setCandidate_name(candidate.getName());
					candidateFeedback.setMentor_id(Integer.parseInt(mentor_id));
					candidateFeedback.setMentor_name(mentorMaster.getFirst_name() + " " + mentorMaster.getLast_name());
					candidateFeedback.setInterview_type(interview_type);
					candidateFeedback.setTs_grade(Integer.parseInt(ts_screening_grade));
					candidateFeedback.setFeedback(feedback);
					candidateFeedback.setCreated_date(new Date());
					candidateFeedback.setActive(true);

					candidateDAO.saveCandidateFeedback(candidateFeedback);
					
					Log log = new Log();
			 		log.setUser_id(Integer.parseInt(user_id));
			 		log.setUser_name(user_name);
			 		log.setTitle("Candidate Feedback Created");
			 		log.setDescription(user_name+" has created feedback to the following candidate ("+candidate.getName()+")");
			 		log.setActivity_time(new Date());
			 		String ipAddr = Utils.getIpAddr(request);
					if(ipAddr == null){ipAddr="";}
			 		log.setIp_addr(ipAddr);
			 		logDAO.saveLog(log);

					commonResponse.setStatus("SUCCESS");
					commonResponse.setStatus_code(200);
					commonResponse.setMsg("The Candidate Interview Feedback are Saved Successfully.");
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
			commonResponse.setMsg("Something Error, Please Try Again");
			writer.print(gson.toJson(commonResponse));
			writer.close();
			return;
		}
	}
	@RequestMapping({"/brand-clients" })
	public String brand_clients(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try
		{	
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
				if(accountMap != null && (accountMap.get("user_type_id").equalsIgnoreCase(Utils.brandId.toString()))) {
				
				String user_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				String user_type = accountMap.get("user_type");
				
				CmsUser cmsUser = null;
				Integer brand_id = null;
				List<ClientMaster> clients = null;
				if(!user_id.isEmpty()) {
					cmsUser = candidateDAO.getUserById(Integer.parseInt(user_id));
				}				
				if(cmsUser != null) {
					brand_id = cmsUser.getBrand_id();
				}				
				if(brand_id != null) {
				clients = brandAdminDAO.getAllActiveClientsByBrandId(brand_id);
				}
				request.setAttribute("clients", clients);								
				request.setAttribute("page", "brand-clients");
			}
			else {
				response.sendRedirect("/bootcamp");
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "bootcamp.user.brand.client.list";
	}
	
	@RequestMapping({ "/brand-add-update-client" })
	public String client_add_update_client(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HashMap<String, String> accountMap = null;
		try {
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_type_id").equalsIgnoreCase(Utils.brandId.toString()))) {
				
				String user_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				String user_type = accountMap.get("user_type");
				
				CmsUser cmsUser = null;
				Integer brand_id = null;
				if(!user_id.isEmpty()) {
					cmsUser = candidateDAO.getUserById(Integer.parseInt(user_id));
				}
				
				if(cmsUser != null) {
					brand_id = cmsUser.getBrand_id();
				}

				String id = request.getParameter("client_id");
				String source = request.getParameter("source");
				
				request.setAttribute("source",source);
				ClientMaster clientMaster = null;
				List<ClientContact> clientContact = null;

				if (id != null) {
					clientMaster = brandAdminDAO.getclientById(Integer.parseInt(id));
					clientContact = brandAdminDAO.getAllClientContactByBrandandClientId(Integer.parseInt(id),brand_id);
				}
				request.setAttribute("client", clientMaster);
				request.setAttribute("clientcontact", clientContact);
				request.setAttribute("page", "add-update-client");

			} else {
				response.sendRedirect("/bootcamp");
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return "bootcamp.user.brand.add.update.client";
	}
	
	@RequestMapping(value = "/brandaddOrUpdateClient")
	public void brandaddOrUpdateNewClient(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;	
		HashMap<String, String> accountMap = null;
		try 
   		{
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_type_id").equalsIgnoreCase(Utils.brandId.toString()))) {
				
				String user_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				String user_type = accountMap.get("user_type");
				
				Brand brand = null;
				CmsUser cmsUser = null;
				Integer brand_id = null;
				if(!user_id.isEmpty()) {
					cmsUser = candidateDAO.getUserById(Integer.parseInt(user_id));
				}
				
				if(cmsUser != null) {
					brand_id = cmsUser.getBrand_id();
				}
				if(brand_id != null) {
					brand = adminDAO.getBrandById(brand_id);
				}
				commonResponse = new CommonResponse();
	    		gson = new Gson();	
	    		
	    		String authCode = RandomStringUtils.random(8, "0123456789abcdef");
	    		
	    		String client_id = request.getParameter("client_id");
				String client_contact_id = request.getParameter("client_contact_id");
				String client_cin = request.getParameter("client_cin");
				String client_gst = request.getParameter("client_gst");
				String client_pan = request.getParameter("client_pan");
				String client_name = request.getParameter("client_name");
				String client_description = request.getParameter("client_description");
				String client_nature_business = request.getParameter("client_nature_business");
				String client_product_service = request.getParameter("client_product_service");
				String client_total_employees = request.getParameter("client_total_employees");
				String client_annual_revenue = request.getParameter("client_annual_revenue");
				String client_website = request.getParameter("client_website");
				String client_address = request.getParameter("client_address");
				String client_pincode = request.getParameter("client_pincode");
				String client_city = request.getParameter("client_city");
				String client_state = request.getParameter("client_state");
				String client_country = request.getParameter("client_country");
				String client_contact_name = request.getParameter("client_contact_name");
				String client_contact_designation = request.getParameter("client_contact_designation");
				String client_contact_department = request.getParameter("client_contact_department");
				String client_contact_mobile = request.getParameter("client_contact_mobile");
				String client_contact_email = request.getParameter("client_contact_email");
				String client_contact_notes = request.getParameter("client_contact_notes");
				
				if(client_id == null) {client_id = "";}
				if(client_contact_id == null) {client_contact_id = "";}
				if(client_cin == null) {client_cin = "";}
				if(client_gst == null) {client_gst = "";}
				if(client_pan == null) {client_pan = "";}
				if(client_name == null) {client_name = "";}
				if(client_description == null) {client_description = "";}
				if(client_nature_business == null) {client_nature_business = "";}
				if(client_product_service == null) {client_product_service = "";}
				if(client_total_employees == null) {client_total_employees = "";}
				if(client_annual_revenue == null) {client_annual_revenue = "";}
				if(client_website == null) {client_website = "";}
				if(client_address == null) {client_address = "";}
				if(client_pincode == null) {client_pincode = "";}
				if(client_city == null) {client_city = "";}
				if(client_state == null) {client_state = "";}
				if(client_country == null) {client_country = "";}
				if(client_contact_name == null) {client_contact_name = "";}
				if(client_contact_designation == null) {client_contact_designation = "";}
				if(client_contact_department == null) {client_contact_department = "";}
				if(client_contact_mobile == null) {client_contact_mobile = "";}
				if(client_contact_email == null) {client_contact_email = "";}
				if(client_contact_notes == null) {client_contact_notes = "";}
				
				
				client_id = client_id.trim();
				client_contact_id = client_contact_id.trim();
				client_cin = client_cin.trim();
				client_gst = client_gst.trim();
				client_pan = client_pan.trim();
				client_name = client_name.trim();
				client_description = client_description.trim();
				client_nature_business = client_nature_business.trim();
				client_product_service = client_product_service.trim();
				client_total_employees = client_total_employees.trim();
				client_annual_revenue = client_annual_revenue.trim();
				client_website = client_website.trim();
				client_address = client_address.trim();
				client_pincode = client_pincode.trim();
				client_city = client_city.trim();
				client_state = client_state.trim();
				client_country = client_country.trim();
				client_contact_name = client_contact_name.trim();
				client_contact_designation = client_contact_designation.trim();
				client_contact_department = client_contact_department.trim();
				client_contact_mobile = client_contact_mobile.trim();
				client_contact_email = client_contact_email.trim();
				client_contact_notes = client_contact_notes.trim();
					
				
				ClientMaster clients = null;
	    		Boolean isFirstTimeClient = false;    		
	    	    		
	    		if(!client_id.isEmpty()) {
	    			clients = brandAdminDAO.getclientById(Integer.parseInt(client_id));
	    		}
	    		
	    		if(clients != null) {
	    			isFirstTimeClient = false;
	    		}else {
	    			clients = new ClientMaster();
	    			isFirstTimeClient = true;
	    		}	
							
	        	
	        	clients.setBrand_id(brand_id);
	        	clients.setName(client_name);
				clients.setDescription(client_description);
				clients.setCin(client_cin);
				clients.setGst(client_gst);
				clients.setPan(client_pan);
				clients.setAddress(client_address);
				clients.setCity(client_city);
				clients.setState(client_state);
				clients.setCountry(client_country);
				clients.setPinocde(client_pincode);
				clients.setNature_of_business(client_nature_business);
				clients.setProduct_and_service(client_product_service);
				clients.setTotal_no_employee(client_total_employees);
				clients.setAnnual_revenue(client_annual_revenue);
				clients.setWebsite(client_website);
				clients.setCreated_date(new Date());
				clients.setActive(true);
				
				brandAdminDAO.saveOrUpdateClient(clients);
				
				List<String> client_contact_idArr = null;
				
				if(!client_contact_id.isEmpty()) {
					client_contact_idArr = Arrays.asList(client_contact_id.split(","));
				}
				
				List<String> client_contact_nameArr = Arrays.asList(client_contact_name.split(","));
	    		List<String> client_contact_designationArr = Arrays.asList(client_contact_designation.split(","));
	    		List<String> client_contact_mobileArr = Arrays.asList(client_contact_mobile.split(","));
	    		List<String> client_contact_emailArr = Arrays.asList(client_contact_email.split(","));	    		
	    		List<String> client_contact_departmentArr = Arrays.asList(client_contact_department.split(","));
	    		List<String> client_contact_notesArr = Arrays.asList(client_contact_notes.split("\\|"));
	    		
	    		for (int i = 0; i < client_contact_nameArr.size(); i++) 
	            {
	    			ClientContact clientContact = null;
	    			
	            	if(client_contact_idArr != null) {
	            		if(i < client_contact_idArr.size()) {
	            			clientContact = brandAdminDAO.getClientContactById(Integer.parseInt(client_contact_idArr.get(i)));
		            	}
	            	}
	    			
	    			if(clientContact == null) {
	    				clientContact = new ClientContact();
	            	}
	    			
	    			clientContact.setBrand_id(brand.getId());
	    			clientContact.setClient_id(clients.getId());
	    			clientContact.setName(client_contact_nameArr.get(i));
	    			clientContact.setEmail(client_contact_emailArr.get(i));
	    			clientContact.setMobile(client_contact_mobileArr.get(i));
	    			clientContact.setDesignation(client_contact_designationArr.get(i));
	    			clientContact.setDepartment(client_contact_departmentArr.get(i));
	    			clientContact.setNotes(client_contact_notesArr.get(i));
	    			clientContact.setCreated_date(new Date());
	    			clientContact.setActive(true);
	            	
	            	brandAdminDAO.saveOrUpdateClientContact(clientContact);
	    		}    	
	    		if(isFirstTimeClient) {    					 		
	    			Log log = new Log();
			 		log.setUser_id(Integer.parseInt(user_id));
			 		log.setUser_name(user_name);
			 		log.setTitle("New Client Created");
			 		log.setDescription(user_name+" has created the new brand ("+cmsUser.getName()+")");
			 		log.setActivity_time(new Date());
			 		String ipAddr = Utils.getIpAddr(request);
					if(ipAddr == null){ipAddr="";}
			 		log.setIp_addr(ipAddr);
			 		logDAO.saveLog(log);
	    			
	    			commonResponse.setStatus("SUCCESS");
					commonResponse.setStatus_code(200);
					commonResponse.setMsg("The New Client Added Successfully.");
					writer.print(gson.toJson(commonResponse));
					writer.close();
					return;
	    		}else {
	    			
	    			Log log = new Log();
			 		log.setUser_id(Integer.parseInt(user_id));
			 		log.setUser_name(user_name);
			 		log.setTitle("The Client Details Updated");
			 		log.setDescription(user_name+" has updated the client details ("+cmsUser.getName()+")");
			 		log.setActivity_time(new Date());
			 		String ipAddr = Utils.getIpAddr(request);
					if(ipAddr == null){ipAddr="";}
			 		log.setIp_addr(ipAddr);
			 		logDAO.saveLog(log);
			 		
	    			commonResponse.setStatus("SUCCESS");
					commonResponse.setStatus_code(200);
					commonResponse.setMsg("The Client Details Updated Successfully.");
					writer.print(gson.toJson(commonResponse));
					writer.close();
					return;
	    		}			
			}
			else
			{
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
	
	@RequestMapping({"/brand-view-client" })
	public String brand_view_client(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try
		{	
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_type_id").equalsIgnoreCase(Utils.brandId.toString()))) {
				
				String user_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				String user_type = accountMap.get("user_type");
				
				CmsUser cmsUser = null;
				Integer brand_id = null;
				if(!user_id.isEmpty()) {
					cmsUser = candidateDAO.getUserById(Integer.parseInt(user_id));
				}
				
				if(cmsUser != null) {
					brand_id = cmsUser.getBrand_id();
				}
				
				String client_id = request.getParameter("client_id");
				
				if(client_id == null) {client_id = "";}
				
				client_id = client_id.trim();
				
				ClientMaster clientMaster = null;
				List<ClientContact> clientContact = null;
				
				if(!client_id.isEmpty()) {
					clientMaster = brandAdminDAO.getclientById(Integer.parseInt(client_id));
					clientContact = brandAdminDAO.getAllClientContactByBrandandClientId(Integer.parseInt(client_id),brand_id);
				}
				
				if(clientMaster != null) {
					cmsUser = candidateDAO.getUserById(Integer.parseInt(user_id));
				}
				
				request.setAttribute("client", clientMaster);
				request.setAttribute("clientcontacts", clientContact);
				request.setAttribute("cmsUser", cmsUser);
				
				request.setAttribute("page", "view-client");
			}
			else {
				response.sendRedirect("/bootcamp");
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "bootcamp.user.brand.client.view";
	}	
	
	@RequestMapping(value = "/branddeleteClientById")
	public void branddeleteClientById(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;
		HashMap<String, String> accountMap = null;
		try {

			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_type_id").equalsIgnoreCase(Utils.brandId.toString()))) {			
				
				String user_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				String user_type = accountMap.get("user_type");

				commonResponse = new CommonResponse();
				gson = new Gson();

				String client_id = request.getParameter("client_id");
				
				if(client_id == null) {client_id ="";}
	    		
				client_id = client_id.trim();
				
				ClientMaster clientMaster = null;
				
				CmsUser cmsUser = null;
				Integer brand_id = null;
				if(!user_id.isEmpty()) {
					cmsUser = candidateDAO.getUserById(Integer.parseInt(user_id));
				}
				
				if(cmsUser != null) {
					brand_id = cmsUser.getBrand_id();
				}
				
				if(!client_id.isEmpty()) {
					clientMaster = brandAdminDAO.getclientById(Integer.parseInt(client_id));
				}
	    		
	    		Boolean brandresult =  false;
	    		Boolean clientcontactResult =  false;
	    		
	    		if(!client_id.isEmpty()) {
	    			
	    			Log log = new Log();
			 		log.setUser_id(Integer.parseInt(user_id));
			 		log.setUser_name(user_name);
			 		log.setTitle("The Client Deleted");
			 		log.setDescription(user_name+" has deleted the client details ("+clientMaster.getName()+")");
			 		log.setActivity_time(new Date());
			 		String ipAddr = Utils.getIpAddr(request);
					if(ipAddr == null){ipAddr="";}
			 		log.setIp_addr(ipAddr);
			 		logDAO.saveLog(log);
			 		
	    			brandresult = brandAdminDAO.deleteClientById(Integer.parseInt(client_id),brand_id);
	    			clientcontactResult = brandAdminDAO.deleteClientContactByClientId(Integer.parseInt(client_id),brand_id);
	    		}
	    		
	    		if(brandresult && clientcontactResult) {
	    			
	    			commonResponse.setMsg("Client Deleted successfully");
	    			commonResponse.setStatus_code(200);
	    			writer.print(gson.toJson(commonResponse));
	    			writer.close();
	    			return;
	    		} else {
	    			commonResponse.setStatus("FAILURE");
	    			commonResponse.setStatus_code(400);
	    			commonResponse.setMsg("Failure, Please Try Again");
	    			writer.print(gson.toJson(commonResponse));
	    			writer.close();
	    			return;
	    		}
				
			}
			else {
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
	@RequestMapping(value = "/branddeleteClientContactById")
	public void branddeleteClientContactById(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;
		HashMap<String, String> accountMap = null;
		try {

			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_type_id").equalsIgnoreCase(Utils.brandId.toString()))) {			
				System.out.println("client contact try");
				String user_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				String user_type = accountMap.get("user_type");

				commonResponse = new CommonResponse();
				gson = new Gson();

				String client_contact_id = request.getParameter("client_contact_id");
				if(client_contact_id == null) {client_contact_id ="";}
	    		
				client_contact_id = client_contact_id.trim();
				
				ClientContact clientContact = null;
				
				CmsUser cmsUser = null;
				Integer brand_id = null;
				if(!user_id.isEmpty()) {
					cmsUser = candidateDAO.getUserById(Integer.parseInt(user_id));
				}
				
				if(cmsUser != null) {
					brand_id = cmsUser.getBrand_id();
				}
				
				if(!client_contact_id.isEmpty()) {
					clientContact = brandAdminDAO.getClientContactById(Integer.parseInt(client_contact_id));
				}
	    		
	    		Boolean brandresult =  false;
	    		Boolean clientcontactResult =  false;
	    		
	    		if(!client_contact_id.isEmpty()) {
	    			
	    			Log log = new Log();
			 		log.setUser_id(Integer.parseInt(user_id));
			 		log.setUser_name(user_name);
			 		log.setTitle("The Client Contact Deleted");
			 		log.setDescription(user_name+" has deleted the client contact details ("+cmsUser.getName()+")");
			 		log.setActivity_time(new Date());
			 		String ipAddr = Utils.getIpAddr(request);
					if(ipAddr == null){ipAddr="";}
			 		log.setIp_addr(ipAddr);
			 		logDAO.saveLog(log);		
	    			clientcontactResult = brandAdminDAO.deleteClientContactByClientId(Integer.parseInt(client_contact_id),brand_id);	    	
	    		}
	    		
	    		if(clientcontactResult) {
	    			
	    			commonResponse.setMsg("Client Contact Deleted successfully");
	    			commonResponse.setStatus_code(200);
	    			writer.print(gson.toJson(commonResponse));
	    			writer.close();
	    			return;
	    		} else {
	    			commonResponse.setStatus("FAILURE");
	    			commonResponse.setStatus_code(400);
	    			commonResponse.setMsg("Failure, Please Try Again");
	    			writer.print(gson.toJson(commonResponse));
	    			writer.close();
	    			return;
	    		}
				
			}
			else {
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
	@RequestMapping(value="/brandaddUpdateClientContact")
	public void brandaddUpdateClientContact(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;	
		HashMap<String, String> accountMap = null;
		try 
   		{
				accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
				if(accountMap != null && (accountMap.get("user_type_id").equalsIgnoreCase(Utils.brandId.toString()))) {			
				
				String user_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				String user_type = accountMap.get("user_type");

				CmsUser cmsUser = null;
				Integer brand_id = null;
				if(!user_id.isEmpty()) {
					cmsUser = candidateDAO.getUserById(Integer.parseInt(user_id));
				}
				
				if(cmsUser != null) {
					brand_id = cmsUser.getBrand_id();
				}
				
				commonResponse = new CommonResponse();
	    		gson = new Gson();	
	    		
	    		String client_id = request.getParameter("client_id");
	    		String client_contact_id = request.getParameter("client_contact_id");
	    		String client_contact_name = request.getParameter("client_contact_name");
	    		String client_contact_designation = request.getParameter("client_contact_designation");
	    		String client_contact_department = request.getParameter("client_contact_department");
	    		String client_contact_mobile = request.getParameter("client_contact_mobile");
	    		String client_contact_email = request.getParameter("client_contact_email");
	    		String client_contact_notes = request.getParameter("client_contact_notes");
	    		
	    		if(client_id == null) {client_id = "";}
	    		if(client_contact_id == null) {client_contact_id = "";}
	    		if(client_contact_name == null) {client_contact_name = "";}
	    		if(client_contact_designation == null) {client_contact_designation = "";}
	    		if(client_contact_department == null) {client_contact_department = "";}
	    		if(client_contact_mobile == null) {client_contact_mobile = "";}
	    		if(client_contact_email == null) {client_contact_email = "";}
	    		if(client_contact_notes == null) {client_contact_notes = "";}
	    		
	    		client_id = client_id.trim();
	    		client_contact_id = client_contact_id.trim();
	    		client_contact_name = client_contact_name.trim();
	    		client_contact_designation = client_contact_designation.trim();
	    		client_contact_department = client_contact_department.trim();
	    		client_contact_mobile = client_contact_mobile.trim();
	    		client_contact_email = client_contact_email.trim();
	    		client_contact_notes = client_contact_notes.trim();
	    		
	    		ClientContact clientContact = null;
	    		Boolean isFirstTimeClientContact = false;
	    		
	    		if(!client_contact_id.isEmpty()) {
	    			clientContact = brandAdminDAO.getClientContactById(Integer.parseInt(client_contact_id));
	    		}
	    		
	    		if(clientContact == null) {
	    			clientContact = new ClientContact();
	    			isFirstTimeClientContact = true;
	    		}
	    		
	    		clientContact.setBrand_id(brand_id);
	    		clientContact.setClient_id(Integer.parseInt(client_id));
	    		clientContact.setName(client_contact_name);
	    		clientContact.setDesignation(client_contact_designation);
	    		clientContact.setDepartment(client_contact_department);
	    		clientContact.setMobile(client_contact_mobile);
	    		clientContact.setEmail(client_contact_email);
	    		clientContact.setNotes(client_contact_notes);
	    		clientContact.setCreated_date(new Date());
	    		clientContact.setActive(true);
	    		
	    		brandAdminDAO.saveOrUpdateClientContact(clientContact);
	    		
	    		if(isFirstTimeClientContact) {
	    			
	    			Log log = new Log();
			 		log.setUser_id(Integer.parseInt(user_id));
			 		log.setUser_name(user_name);
			 		log.setTitle("The Client Contact Created");
			 		log.setDescription(user_name+" has created the new Client Contact details ("+clientContact.getName()+")");
			 		log.setActivity_time(new Date());
			 		String ipAddr = Utils.getIpAddr(request);
					if(ipAddr == null){ipAddr="";}
			 		log.setIp_addr(ipAddr);
			 		logDAO.saveLog(log);
			 		
	    			commonResponse.setStatus("SUCCESS");
	    			commonResponse.setStatus_code(200);
	    			commonResponse.setMsg("Client Contact Added Successfully");
	    			writer.print(gson.toJson(commonResponse));
	    			writer.close();
	    			return;
	    		}else {
	    			
	    			Log log = new Log();
			 		log.setUser_id(Integer.parseInt(user_id));
			 		log.setUser_name(user_name);
			 		log.setTitle("The Client Contact Updated");
			 		log.setDescription(user_name+" has updated the client contact details ("+clientContact.getName()+")");
			 		log.setActivity_time(new Date());
			 		String ipAddr = Utils.getIpAddr(request);
					if(ipAddr == null){ipAddr="";}
			 		log.setIp_addr(ipAddr);
			 		logDAO.saveLog(log);
			 		
	    			commonResponse.setStatus("SUCCESS");
	    			commonResponse.setStatus_code(200);
	    			commonResponse.setMsg("Client Contact Details Updated");
	    			writer.print(gson.toJson(commonResponse));
	    			writer.close();
	    			return;
	    		}
			}else {
				response.sendRedirect("/bootcamp");
			}
   		}
		catch(Exception ex)
       	{
       		ex.printStackTrace();
       		
       		commonResponse.setStatus("FAILURE");
			commonResponse.setStatus_code(400);
			commonResponse.setMsg("Failure!, Please Try Again");
			writer.print(gson.toJson(commonResponse));
			writer.close();
			return;
       	}
	}
	@RequestMapping(value="/getClientContactById")
	public void getClientContactById(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;	
		HashMap<String, String> accountMap = null;
		try 
   		{
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_type_id").equalsIgnoreCase(Utils.brandId.toString()))) {			
				
				String user_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				String user_type = accountMap.get("user_type");

				CmsUser cmsUser = null;
				Integer brand_id = null;
				if(!user_id.isEmpty()) {
					cmsUser = candidateDAO.getUserById(Integer.parseInt(user_id));
				}
				
				if(cmsUser != null) {
					brand_id = cmsUser.getBrand_id();
				}
				
				commonResponse = new CommonResponse();
	    		gson = new Gson();	
	    		
	    		String client_contact_id = request.getParameter("client_contact_id");
	    		
	    		if(client_contact_id == null) {client_contact_id = "";}
	    		
	    		client_contact_id = client_contact_id.trim();
	    		
	    		ClientContact clientContact = null;
	    		
	    		if(!client_contact_id.isEmpty()) {
	    			clientContact = brandAdminDAO.getClientContactById(Integer.parseInt(client_contact_id));
	    		}
	    	    
	    		if(clientContact != null) {
	    			commonResponse.setStatus("SUCCESS");
	    			commonResponse.setStatus_code(200);
	    			writer.print(gson.toJson(clientContact));
	    			writer.close();
	    			return;
	    		} else {
	    			commonResponse.setStatus("FAILURE");
	    			commonResponse.setStatus_code(400);
	    			commonResponse.setMsg("Failure!, Please Try Again");
	    			writer.print(gson.toJson(commonResponse));
	    			writer.close();
	    			return;
	    		}
			}else {
				response.sendRedirect("/bootcamp");
			}
   		}
		catch(Exception ex)
       	{
       		ex.printStackTrace();
       		
       		commonResponse.setStatus("FAILURE");
			commonResponse.setStatus_code(400);
			commonResponse.setMsg("Failure!, Please Try Again");
			writer.print(gson.toJson(commonResponse));
			writer.close();
			return;
       	}
	}
	@RequestMapping(value = "/brandeleteDirectorById")
	public void brandeleteDirectorById(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;
		HashMap<String, String> accountMap = null;
		try {

			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_type_id").equalsIgnoreCase(Utils.adminId.toString())) || (accountMap.get("user_type_id").equalsIgnoreCase(Utils.brandId.toString()))) 
			{
				
				String user_login_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				String user_type = accountMap.get("user_type");

				commonResponse = new CommonResponse();
				gson = new Gson();

				CmsUser cmsUser = null;
				Brand brand = null;
				Integer brand_id = null;
				if(!user_login_id.isEmpty()) {
					cmsUser = candidateDAO.getUserById(Integer.parseInt(user_login_id));
				}
								
				if(cmsUser != null) {
					brand = brandAdminDAO.getBrandByUserId(Integer.parseInt(user_login_id));
				}					
				String brand_director_id = request.getParameter("brand_director_id");
				
				if(brand_director_id == null) {brand_director_id ="";}
	    		
				brand_director_id = brand_director_id.trim();
				
				Boolean brandDirectorResult =  false;
				
				BrandDirectors brandDirector = adminDAO.getBrandDirectorById(Integer.parseInt(brand_director_id));
    			
    			if(!brand_director_id.isEmpty()) {    				
    				Log log = new Log();
    		 		log.setUser_id(Integer.parseInt(user_login_id));
    		 		log.setUser_name(user_name);
    		 		log.setTitle("The Brand Directors Deleted");
    		 		log.setDescription(user_name+" has Deleted the brand director details ("+brandDirector.getBrand_name()+") and Brand Director Name was "+brandDirector.getName());
    		 		log.setActivity_time(new Date());
    		 		String ipAddr = Utils.getIpAddr(request);
    				if(ipAddr == null){ipAddr="";}
    		 		log.setIp_addr(ipAddr);
    		 		logDAO.saveLog(log);
    		 		
    		 		brandDirectorResult = brandAdminDAO.deleteBrandDirectorsById(Integer.parseInt(brand_director_id), brand.getId());
	    		}
	    		
	    		if(brandDirectorResult) {
	    			
	    			commonResponse.setMsg("Brand Director Deleted successfully");
	    			commonResponse.setStatus_code(200);
	    			writer.print(gson.toJson(commonResponse));
	    			writer.close();
	    			return;
	    		} else {
	    			commonResponse.setStatus("FAILURE");
	    			commonResponse.setStatus_code(400);
	    			commonResponse.setMsg("Failure, Please Try Again");
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

	@RequestMapping(value="/brandcanidateDownloadXL")
	public void canidateDownloadXL(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try 
		{
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_type_id").equalsIgnoreCase(Utils.brandId.toString()))) {			
				
			String user_id = accountMap.get("user_id");
			String user_email = accountMap.get("user_email");
			String user_name = accountMap.get("user_name");
			String user_type_id = accountMap.get("user_type_id");
				
			List<Candidate> memberList = candidateDAO.getAllCandidate();
			request.setAttribute("memberList", memberList);
	 		
	 		response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-Disposition", "attachment;filename=Teksands-Candidate-List.xlsx");
			
			Workbook wb = new Workbook(response.getOutputStream(), "MyApplication", "1.0");
			Worksheet ws = wb.newWorksheet("Teksands Candidate List");
			
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
									
			ws.value(0, 0, "Teksands Candidate List");
			ws.range(0, 0, 0, 5).merge();
			ws.range(0, 0, 0, 5).style().horizontalAlignment("center").set();
			ws.style(0, 0).bold().fontSize(11).set(); 

			int i = 1;
			int j = 0;
			for(j = 0; j <= 48; j++) {
				ws.style(i, j).bold().fontSize(9).borderStyle("bold").borderColor("0f76bd").wrapText(true).set();	
			}
			
			ws.value(i, 0, "Id");
			ws.value(i, 1, "Job Title");
	        ws.value(i, 2, "Name");
		    ws.value(i, 3, "Email");
		    ws.value(i, 4, "Mobile");
		    ws.value(i, 5, "Gender");
		    ws.value(i, 6, "Marital Status");
		    ws.value(i, 7, "Home Town");
		    ws.value(i, 8, "Date of Birth");
		    ws.value(i, 9, "Current Location");
		    ws.value(i, 10, "Preferred Location");
		    ws.value(i, 11, "Permanent Address");
		    ws.value(i, 12, "Permanent City");
		    ws.value(i, 13, "Permanent State");
		    ws.value(i, 14, "Permanent Country");
		    ws.value(i, 15, "Pincode");
		    ws.value(i, 16, "Resume");
		    ws.value(i, 17, "Total Experience");
		    ws.value(i, 18, "Current Company Name");
		    ws.value(i, 19, "Current Company Resigination");
		    ws.value(i, 20, "Functional Area");
		    ws.value(i, 21, "Role");
		    ws.value(i, 22, "Industry");
		    ws.value(i, 23, "Key Skills");
		    ws.value(i, 24, "Annual Salary");
		    ws.value(i, 25, "Notice Period");
		    ws.value(i, 26, "Last Working Day");
		    ws.value(i, 27, "Resume Heading");
		    ws.value(i, 28, "Summary");
		    ws.value(i, 29, "UG Degree");
		    ws.value(i, 30, "UG Specialization");
		    ws.value(i, 31, "UG College Name");
		    ws.value(i, 32, "UG Graduation Year");
		    ws.value(i, 33, "PG Degree");
		    ws.value(i, 34, "PG Specialization");
		    ws.value(i, 35, "PG College Name");
		    ws.value(i, 36, "PG Graduation Year");
		    ws.value(i, 37, "Doctorate Degree");
		    ws.value(i, 38, "Doctorate Specialization");
		    ws.value(i, 39, "Doctorate College Name");
		    ws.value(i, 40, "Doctorate Graduation Year");
		    ws.value(i, 41, "Work Permit Status");
		    ws.value(i, 42, "TS Screening Comment 1");
		    ws.value(i, 43, "TS Screening Comment 2");
		    ws.value(i, 44, "TS Screening Comment 3");
		    ws.value(i, 45, "TS Grade");
		    ws.value(i, 46, "Placed Company");
		    ws.value(i, 47, "Placed Date");
		    ws.value(i++, 48, "Inactive Reason");
		    
	 		for(Candidate downloadCanidateList : candidateDAO.getAllCandidate())
	 		{
	 			ws.value(i, 0, downloadCanidateList.getId());
				ws.style(i, 0).fontSize(9).wrapText(true).set();
				
				ws.value(i, 1, downloadCanidateList.getJob_title());
				ws.style(i, 1).fontSize(9).wrapText(true).set();

				ws.value(i, 2, downloadCanidateList.getName());
				ws.style(i, 2).fontSize(9).wrapText(true).set();
				
				ws.value(i, 3, downloadCanidateList.getEmail());
				ws.style(i, 3).fontSize(9).wrapText(true).set();
				
				ws.value(i, 4, downloadCanidateList.getMobile());
				ws.style(i, 4).fontSize(9).wrapText(true).set();
				
				ws.value(i, 5, downloadCanidateList.getGender());
				ws.style(i, 5).fontSize(9).wrapText(true).set();
				
				ws.value(i, 6, downloadCanidateList.getMarital_status());
				ws.style(i, 6).fontSize(9).wrapText(true).set();
				
				ws.value(i, 7, downloadCanidateList.getHome_town());
				ws.style(i, 7).fontSize(9).wrapText(true).set();
				
				if(downloadCanidateList.getDate_of_birth() != null) {
					ws.value(i, 8, sdf.format(downloadCanidateList.getDate_of_birth()));
					ws.style(i, 8).fontSize(9).wrapText(true).set();
				}else {
					ws.value(i, 8, "--");
					ws.style(i, 8).fontSize(9).wrapText(true).set();
				}
				
				ws.value(i, 9, downloadCanidateList.getCurrent_location());
				ws.style(i, 9).fontSize(9).wrapText(true).set();
				
				ws.value(i, 10, downloadCanidateList.getPreferred_location());
				ws.style(i, 10).fontSize(9).wrapText(true).set();

				ws.value(i, 11, downloadCanidateList.getPermanent_address());
				ws.style(i, 11).fontSize(9).wrapText(true).set();
				
				ws.value(i, 12, downloadCanidateList.getPermanent_city());
				ws.style(i, 12).fontSize(9).wrapText(true).set();
				
				ws.value(i, 13, downloadCanidateList.getPermanent_state());
				ws.style(i, 13).fontSize(9).wrapText(true).set();
				
				ws.value(i, 14, downloadCanidateList.getPermanent_country());
				ws.style(i, 14).fontSize(9).wrapText(true).set();
				
				ws.value(i, 15, downloadCanidateList.getPermanent_pincode());
				ws.style(i, 15).fontSize(9).wrapText(true).set();
				
				ws.value(i, 16, downloadCanidateList.getResume());
				ws.style(i, 16).fontSize(9).wrapText(true).set();
				
				ws.value(i, 17, downloadCanidateList.getTotal_experience());
				ws.style(i, 17).fontSize(9).wrapText(true).set();
				
				ws.value(i, 18, downloadCanidateList.getCurr_company_name());
				ws.style(i, 18).fontSize(9).wrapText(true).set();
				
				ws.value(i, 19, downloadCanidateList.getCurr_company_desigination());
				ws.style(i, 19).fontSize(9).wrapText(true).set();
				
				ws.value(i, 20, downloadCanidateList.getFunctional_area());
				ws.style(i, 20).fontSize(9).wrapText(true).set();
				
				ws.value(i, 21, downloadCanidateList.getRole());
				ws.style(i, 21).fontSize(9).wrapText(true).set();
				
				ws.value(i, 22, downloadCanidateList.getIndustry());
				ws.style(i, 22).fontSize(9).wrapText(true).set();
				
				ws.value(i, 23, downloadCanidateList.getKey_skills());
				ws.style(i, 23).fontSize(9).wrapText(true).set();
				
				ws.value(i, 24, downloadCanidateList.getAnnual_salary());
				ws.style(i, 24).fontSize(9).wrapText(true).set();
				
				ws.value(i, 25, downloadCanidateList.getNotice_period());
				ws.style(i, 25).fontSize(9).wrapText(true).set();
				
				
				if(downloadCanidateList.getLast_working_day() != null) {
					ws.value(i, 26, sdf.format(downloadCanidateList.getLast_working_day()));
					ws.style(i, 26).fontSize(9).wrapText(true).set();
				}else {
					ws.value(i, 26, "--");
					ws.style(i, 26).fontSize(9).wrapText(true).set();
				}
				
				ws.value(i, 27, downloadCanidateList.getResume_headling());
				ws.style(i, 27).fontSize(9).wrapText(true).set();
				
				ws.value(i, 28, downloadCanidateList.getSummary());
				ws.style(i, 28).fontSize(9).wrapText(true).set();
				
				ws.value(i, 29, downloadCanidateList.getUg_degree());
				ws.style(i, 29).fontSize(9).wrapText(true).set();
				
				ws.value(i, 30, downloadCanidateList.getUg_specialization());
				ws.style(i, 30).fontSize(9).wrapText(true).set();
				
				ws.value(i, 31, downloadCanidateList.getUg_college_name());
				ws.style(i, 31).fontSize(9).wrapText(true).set();
				
				ws.value(i, 32, downloadCanidateList.getUg_graduation_year());
				ws.style(i, 32).fontSize(9).wrapText(true).set();
				
				ws.value(i, 33, downloadCanidateList.getPg_degree());
				ws.style(i, 33).fontSize(9).wrapText(true).set();
				
				ws.value(i, 34, downloadCanidateList.getPg_specialization());
				ws.style(i, 34).fontSize(9).wrapText(true).set();
				
				ws.value(i, 35, downloadCanidateList.getPg_college_name());
				ws.style(i, 35).fontSize(9).wrapText(true).set();
				
				ws.value(i, 36, downloadCanidateList.getPg_graduation_year());
				ws.style(i, 36).fontSize(9).wrapText(true).set();
				
				ws.value(i, 37, downloadCanidateList.getDoctorate_degree());
				ws.style(i, 37).fontSize(9).wrapText(true).set();
				
				ws.value(i, 38, downloadCanidateList.getDoctorate_specialization());
				ws.style(i, 38).fontSize(9).wrapText(true).set();
				
				ws.value(i, 39, downloadCanidateList.getDoctorate_university());
				ws.style(i, 39).fontSize(9).wrapText(true).set();
				
				ws.value(i, 40, downloadCanidateList.getDoctorate_graduation_year());
				ws.style(i, 40).fontSize(9).wrapText(true).set();
				
				ws.value(i, 41, downloadCanidateList.getWork_permit_status());
				ws.style(i, 41).fontSize(9).wrapText(true).set();
				
				ws.value(i, 42, downloadCanidateList.getTs_screening_comment_1());
				ws.style(i, 42).fontSize(9).wrapText(true).set();
				
				ws.value(i, 43, downloadCanidateList.getTs_screening_comment_2());
				ws.style(i, 43).fontSize(9).wrapText(true).set();
				
				ws.value(i, 44, downloadCanidateList.getTs_screening_comment_3());
				ws.style(i, 44).fontSize(9).wrapText(true).set();
				
				ws.value(i, 45, downloadCanidateList.getTs_screening_grade());
				ws.style(i, 45).fontSize(9).wrapText(true).set();

				ws.value(i, 46, downloadCanidateList.getPlaced_company());
				ws.style(i, 46).fontSize(9).wrapText(true).set();
				
				if(downloadCanidateList.getPlaced_date() != null) {
					ws.value(i, 47, sdf.format(downloadCanidateList.getPlaced_date()));
					ws.style(i, 47).fontSize(9).wrapText(true).set();
				}else {
					ws.value(i, 47, "--");
					ws.style(i, 47).fontSize(9).wrapText(true).set();
				}
				
				ws.value(i, 48, downloadCanidateList.getInactive_reason());
				ws.style(i++, 48).fontSize(9).wrapText(true).set();
				
	 		}
	 		wb.finish();

	 		Log log = new Log();
	 		log.setUser_id(Integer.parseInt(user_id));
	 		log.setUser_name(user_name);
	 		log.setTitle("Candidate Excell Downloaded");
	 		log.setDescription(user_name + " was Downloaded the Candidate List");
	 		log.setActivity_time(new Date());
	 		String ipAddr = Utils.getIpAddr(request);
			if(ipAddr == null){ipAddr="";}
	 		log.setIp_addr(ipAddr);
	 		logDAO.saveLog(log);
		} 
		else {
			
			response.sendRedirect("/bootcamp");
			}
		}
 		catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}
	@RequestMapping(value="/brandbulkUploadCandidateDetails")
	public void upload_insurance_report(HttpServletRequest request, HttpServletResponse response) throws IOException 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;

        String appPath = request.getServletContext().getRealPath("");
        String savePath = appPath + File.separator + SAVE_DIR;
        String file_name = "";

        File fileSaveDir = new File(savePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdir();
        }
		
		try 
		{
			HashMap<String, String> accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_id").equalsIgnoreCase(Utils.brandId.toString()))) {
				
            	String user_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				String user_type = accountMap.get("user_type");
				
            	commonResponse = new CommonResponse();
				gson = new Gson();
				
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
    	                 String fileName = fi.getName();
    	                 System.out.println("fileName---->" + fileName);
    	                 String filePath = savePath + File.separator + fileName;
    	                 System.out.println("filePath---->" + filePath);
    	                 File file = new File(filePath);
    	                 fi.write(file);
    	                 boolean status = true;
    	                 
    	                 System.out.println("file---->" + file);
    	                 
    	                 status = candidateDAO.bulkUploadCandidateDetails(file);
    	                 
    	                 if(status)
    	                 {
    	                	Log log = new Log();
    	 			 		log.setUser_id(Integer.parseInt(user_id));
    	 			 		log.setUser_name(user_name);
    	 			 		log.setTitle("Candidate Test Results Added");
    	 			 		log.setDescription(user_name+" has uploaded the candidate's list");
    	 			 		log.setActivity_time(new Date());
    	 			 		String ipAddr = Utils.getIpAddr(request);
    	 					if(ipAddr == null){ipAddr="";}
    	 			 		log.setIp_addr(ipAddr);
    	 			 		logDAO.saveLog(log);
    	                	 
    	                	commonResponse.setStatus("SUCCESS");
    	 					commonResponse.setStatus_code(200);
    	 					commonResponse.setMsg("Candiate Details are Updated Successfully");
    	 					writer.print(gson.toJson(commonResponse));
    	 					writer.close();
    	 					return;
    	                 }
    	                 else
    	                 {
    	                	commonResponse.setStatus("SUCCESS");
     	 					commonResponse.setStatus_code(400);
     	 					commonResponse.setMsg("File Upload Failure");
     	 					writer.print(gson.toJson(commonResponse));
     	 					writer.close();
     	 					return;
    	                 }
    	              }
    	              else
    	              {
    	            	  
    	              }
    	           }
    	        }
    	        catch(Exception ex)
    	        {
    	        	ex.printStackTrace();
    	        	commonResponse.setStatus("FAILURE");
					commonResponse.setStatus_code(400);
					commonResponse.setMsg("File Upload Failure");
					writer.print(gson.toJson(commonResponse));
					writer.close();
					return;
    	        }
			
			 }
		} 
		catch (Exception ex) 
		{
			ex.printStackTrace();
            commonResponse.setStatus("FAILURE");
			commonResponse.setStatus_code(400);
			commonResponse.setMsg("File Uplaod Error");
			writer.print(gson.toJson(commonResponse));
			writer.close();
			return;
		}    
	}
	@RequestMapping(value = "/brandactivateDeactivateCalls")
	public void activateDeactivateCalls(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;

		HashMap<String, String> accountMap = null;
		try {
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_type_id").equalsIgnoreCase(Utils.brandId.toString()))) {

				String user_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				String user_type = accountMap.get("user_type");
				
				commonResponse = new CommonResponse();
				gson = new Gson();

				String id = request.getParameter("id");

				Candidate candidate = null;
				CallSchedule callSchedule = null;
				
				if (!id.isEmpty()) {
					callSchedule = candidateDAO.getCallScheduleById(Integer.parseInt(id));
				}
				
				if (id != null) {
					Integer candidate_id = callSchedule.getCandidate_id();
					candidate = candidateDAO.getCandidateById(candidate_id);
					candidate.setCall_schedule_status(false);
					candidateDAO.saveOrUpdateCandidate(candidate);
					
					String candidate_name = candidate.getName();
					String candidate_email = candidate.getEmail();
					
					sendEmailUtil.candidateCallCancelled(candidate_name, candidate_email);
				}
				
				Boolean active = callSchedule.getActive();

				if (active == true) {
					callSchedule.setActive(false);
				}

				candidateDAO.saveOrUpdateCallSchedule(callSchedule);

				if (active == true) {
					
					Log log = new Log();
			 		log.setUser_id(Integer.parseInt(user_id));
			 		log.setUser_name(user_name);
			 		log.setTitle("Candidate Call Cancelled");
			 		log.setDescription(user_name+" has cancelled a call to the following candidate ("+candidate.getName()+")");
			 		log.setActivity_time(new Date());
			 		String ipAddr = Utils.getIpAddr(request);
					if(ipAddr == null){ipAddr="";}
			 		log.setIp_addr(ipAddr);
			 		logDAO.saveLog(log);
			 		
					commonResponse.setStatus("SUCCESS");
					commonResponse.setStatus_code(200);
					commonResponse.setMsg("The Candidate Call Cancelled Successfully");
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
	@RequestMapping(value = "/brandaddTestResultToCandidate")
	public void addTestResultToCandidate(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;

		HashMap<String, String> accountMap = null;
		try {
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_type_id").equalsIgnoreCase(Utils.brandId.toString()))) {

				String user_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				String user_type = accountMap.get("user_type");
				System.out.println("user_id = "+ user_id);
				commonResponse = new CommonResponse();
				gson = new Gson();

				String candidate_id = request.getParameter("candidate_id");
				String test_name = request.getParameter("test_name");
				String test_topics = request.getParameter("test_topics");
				String test_total_marks = request.getParameter("test_total_marks");
				String test_marks_scored = request.getParameter("test_marks_scored");

				if (candidate_id == null || candidate_id == "") {
					commonResponse.setStatus("FAILURE");
					commonResponse.setStatus_code(400);
					commonResponse.setMsg("Candidate Not Found");
					writer.print(gson.toJson(commonResponse));
					writer.close();
					return;
				}

				if (!candidate_id.isEmpty()) {
					System.out.println("not empty");
					Candidate candidate = candidateDAO.getCandidateById(Integer.parseInt(candidate_id));

					String candidate_name = candidate.getName();

					TestResults testResults = new TestResults();
					testResults.setCandidate_id(Integer.parseInt(candidate_id));
					testResults.setCandidate_name(candidate_name);
					testResults.setTest_name(test_name);
					testResults.setTest_topic(test_topics);
					testResults.setTotal_marks(Integer.parseInt(test_total_marks));
					testResults.setMarks_scores(Integer.parseInt(test_marks_scored));
					testResults.setCreated_date(new Date());
					testResults.setActive(true);
					
					candidateDAO.saveOrUpdateTestResult(testResults);
					
					Log log = new Log();
			 		log.setUser_id(Integer.parseInt(user_id));
			 		log.setUser_name(user_name);
			 		log.setTitle("Candidate Test Results Added");
			 		log.setDescription(user_name+" has added test result to the following candidate ("+candidate.getName()+")");
			 		log.setActivity_time(new Date());
			 		String ipAddr = Utils.getIpAddr(request);
					if(ipAddr == null){ipAddr="";}
			 		log.setIp_addr(ipAddr);
			 		logDAO.saveLog(log);
					
					commonResponse.setStatus("SUCCESS");
					commonResponse.setStatus_code(200);
					commonResponse.setMsg("Test Results are Saved Successfully");
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
			commonResponse.setMsg("Something Error, Please Try Again");
			writer.print(gson.toJson(commonResponse));
			writer.close();
			return;
		}
	}
	@RequestMapping(value = "/brandactivateDeactivateBrand")
	public void brandactivateDeactivateBrand(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;

		HashMap<String, String> accountMap = null;
		try {
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_type_id").equalsIgnoreCase(Utils.brandId.toString()))) {
				
				String user_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				String user_type = accountMap.get("user_type");

				commonResponse = new CommonResponse();
				gson = new Gson();

				String id = request.getParameter("id");

				Brand brand = null;
				CmsUser cmsUser = null; 
				Boolean activateDeactivateCandidate = false;
				
				if(!user_id.equals(0)) {
					cmsUser = candidateDAO.getUserById(Integer.parseInt(user_id));
				}
				
				if (!user_id.isEmpty()) {
					brand = adminDAO.getBrandById(Integer.parseInt(id));
				}

				Boolean active = brand.getActive();

				if (active == true) {
					brand.setActive(false);
				} else {
					brand.setActive(true);
				}

				adminDAO.saveOrUpdateBrand(brand);

				if (active == true) {
					
					Log log = new Log();
			 		log.setUser_id(Integer.parseInt(user_id));
			 		log.setUser_name(user_name);
			 		log.setTitle("Brand Deactivated");
			 		log.setDescription(user_name+" has deactivated the following brand ("+brand.getName()+")");
			 		log.setActivity_time(new Date());
			 		String ipAddr = Utils.getIpAddr(request);
					if(ipAddr == null){ipAddr="";}
			 		log.setIp_addr(ipAddr);
			 		logDAO.saveLog(log);

					commonResponse.setStatus("SUCCESS");
					commonResponse.setStatus_code(200);
					commonResponse.setMsg("The Brad Deactivated Successfully");
					writer.print(gson.toJson(commonResponse));
					writer.close();
					return;

				} else {
					Log log = new Log();
			 		log.setUser_id(Integer.parseInt(user_id));
			 		log.setUser_name(user_name);
			 		log.setTitle("Brand Activated");
			 		log.setDescription(user_name+" has activated the following brand ("+brand.getName()+")");
			 		log.setActivity_time(new Date());
			 		String ipAddr = Utils.getIpAddr(request);
					if(ipAddr == null){ipAddr="";}
			 		log.setIp_addr(ipAddr);
			 		logDAO.saveLog(log);
			 		
					commonResponse.setStatus("SUCCESS");
					commonResponse.setStatus_code(200);
					commonResponse.setMsg("The Brand Activated Successfully.");
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
	@RequestMapping(value = "/brandactivateDeactivateClient")
	public void brandactivateDeactivateClient(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;

		HashMap<String, String> accountMap = null;
		try {
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_type_id").equalsIgnoreCase(Utils.brandId.toString()))) {
				
				String user_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				String user_type = accountMap.get("user_type");

				commonResponse = new CommonResponse();
				gson = new Gson();

				String id = request.getParameter("id");

				ClientMaster client = null;
				CmsUser cmsUser = null; 
				Boolean activateDeactivateCandidate = false;
				
				if(!user_id.equals(0)) {
					cmsUser = candidateDAO.getUserById(Integer.parseInt(user_id));
				}
				
				if (!user_id.isEmpty()) {
					client = brandAdminDAO.getclientById(Integer.parseInt(id));
				}

				Boolean active = client.getActive();

				if (active == true) {
					client.setActive(false);
				} else {
					client.setActive(true);
				}

				brandAdminDAO.saveOrUpdateClient(client);

				if (active == true) {
					
					Log log = new Log();
			 		log.setUser_id(Integer.parseInt(user_id));
			 		log.setUser_name(user_name);
			 		log.setTitle("Client Deactivated");
			 		log.setDescription(user_name+" has deactivated the following client ("+client.getName()+")");
			 		log.setActivity_time(new Date());
			 		String ipAddr = Utils.getIpAddr(request);
					if(ipAddr == null){ipAddr="";}
			 		log.setIp_addr(ipAddr);
			 		logDAO.saveLog(log);

					commonResponse.setStatus("SUCCESS");
					commonResponse.setStatus_code(200);
					commonResponse.setMsg("The Client Deactivated Successfully");
					writer.print(gson.toJson(commonResponse));
					writer.close();
					return;

				} else {
					Log log = new Log();
			 		log.setUser_id(Integer.parseInt(user_id));
			 		log.setUser_name(user_name);
			 		log.setTitle("Client Activated");
			 		log.setDescription(user_name+" has activated the following client ("+client.getName()+")");
			 		log.setActivity_time(new Date());
			 		String ipAddr = Utils.getIpAddr(request);
					if(ipAddr == null){ipAddr="";}
			 		log.setIp_addr(ipAddr);
			 		logDAO.saveLog(log);
			 		
					commonResponse.setStatus("SUCCESS");
					commonResponse.setStatus_code(200);
					commonResponse.setMsg("The Client Activated Successfully.");
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
