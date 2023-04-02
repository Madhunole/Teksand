package com.teksands.bootcamp.controller;

import java.io.PrintWriter;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.Unirest;
import com.mysql.cj.util.Util;
import com.teksands.bootcamp.dao.BootcampDAO;
import com.teksands.bootcamp.dao.CandidateDAO;
import com.teksands.bootcamp.dao.JobMasterDAO;
import com.teksands.bootcamp.dao.LogDAO;
import com.teksands.bootcamp.dao.SuperAdminDAO;
import com.teksands.bootcamp.model.Bootcamp;
import com.teksands.bootcamp.model.Brand;
import com.teksands.bootcamp.model.BrandDirectors;
import com.teksands.bootcamp.model.Candidate;
import com.teksands.bootcamp.model.ClientMaster;
import com.teksands.bootcamp.model.CmsUser;
import com.teksands.bootcamp.model.JobMaster;
import com.teksands.bootcamp.model.Log;
import com.teksands.bootcamp.model.MentorMaster;
import com.teksands.bootcamp.pojo.CIN;
import com.teksands.bootcamp.pojo.Gst;
import com.teksands.bootcamp.pojo.Llp;
import com.teksands.bootcamp.response.AuthenticateResponse;
import com.teksands.bootcamp.response.CINResponse;
import com.teksands.bootcamp.response.GSTResponse;
import com.teksands.bootcamp.response.LlpResponse;
import com.teksands.bootcamp.response.SandboxErrorResponse;
import com.teksands.user.response.CommonResponse;
import com.teksands.utils.SendEmailUtil;
import com.teksands.utils.Utils;

@Controller
@RequestMapping("/bootcamp")
public class SuperAdminController {
	
	@Autowired
	SuperAdminDAO adminDAO;
	
	@Autowired
	CandidateDAO candidateDAO;
	
	@Autowired
	JobMasterDAO jobMasterDAO;
	
	@Autowired
	SendEmailUtil sendEmailUtil;
	
	@Autowired
	BootcampDAO bootcampDAO;
	
	@Autowired
	LogDAO logDAO;
	
	@RequestMapping({ "/dashboard" })
	public String dashboard(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HashMap<String, String> accountMap = null;
		try {
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_type_id").equalsIgnoreCase(Utils.adminId.toString()))) {

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
		return "bootcamp.dashboard";
	}
	
	@RequestMapping({"/brands" })
	public String bootcamp_list(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try
		{	
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_type_id").equalsIgnoreCase(Utils.adminId.toString()))) {
				
				String user_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				String user_type = accountMap.get("user_type");
				
				List<Brand> brands = adminDAO.getAllActiveBrands();
				request.setAttribute("brands", brands);
				
				request.setAttribute("page", "brand-list");
			}
			else {
				response.sendRedirect("/bootcamp");
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "bootcamp.admin.brands.list";
	}
	
	@RequestMapping({"/add-update-brand" })
	public String add_update_brand(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try
		{	
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_type_id").equalsIgnoreCase(Utils.adminId.toString()))) {
				
				String user_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				String user_type = accountMap.get("user_type");
				
				String brand_id = request.getParameter("brand_id");
				String source = request.getParameter("source");
				
				if(brand_id == null) {brand_id = "";}
				
				brand_id = brand_id.trim();
				
				Brand brand = null;
				List<BrandDirectors> brandDirectors = null;
				
				if(!brand_id.isEmpty()) {
					brand = adminDAO.getBrandById(Integer.parseInt(brand_id));
					brandDirectors = adminDAO.getAllBrandDirectorsListByBrandId(Integer.parseInt(brand_id));
				}
				
				request.setAttribute("brand", brand);
				request.setAttribute("brandDirectors", brandDirectors);
				request.setAttribute("source", source);
				request.setAttribute("page", "brand-add-update");
			}
			else {
				response.sendRedirect("/bootcamp");
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "bootcamp.admin.brands.add.update";
	}
	
	@RequestMapping(value="/getCompanyDetailsFromCIN")
	public void getCompanyDetailsFromCIN(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");	
		Gson gson = new Gson();
		HashMap<String, String> accountMap = null;
		try
		{
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_type_id").equalsIgnoreCase(Utils.adminId.toString()))) 
			{
				
				String user_login_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				String user_type = accountMap.get("user_type");
				
				String brand_cin = request.getParameter("brand_cin");
			
				if(brand_cin == null) {brand_cin = "";}
				
				// Authentication
				Unirest.setTimeouts(0, 0);
				HttpResponse<String> accessTokenResponse = Unirest.post("https://api.sandbox.co.in/authenticate")
				  .header("Accept", "application/json")
				  .header("x-api-key", "key_live_PLrqnIhTgqoTHHjzH0gUA3H7JpwLInQ7")
				  .header("x-api-secret", "secret_live_CsOHJz1p27YeYDUYt1rBDufMW04yjL3d")
				  .header("x-api-version", "1.0")
				  .asString();
				String accessTokenJson  = accessTokenResponse.getBody().toString();
				AuthenticateResponse authenticateResponse= new Gson().fromJson(accessTokenJson, AuthenticateResponse.class);
				String access_token = authenticateResponse.getAccess_token();
				// SEARCH CIN
				Unirest.setTimeouts(0, 0);
				HttpResponse<String> companySearchResponse = Unirest.get("https://api.sandbox.co.in/mca/companies/" + brand_cin + "?consent=Y&reason=ForGSTregistration")
				  .header("Accept", "application/json")
				  .header("Authorization", access_token)
			      .header("x-api-key", "key_live_PLrqnIhTgqoTHHjzH0gUA3H7JpwLInQ7")
				  .header("x-api-version", "3.4.0")
				  .asString();
				
				String cinJson = companySearchResponse.getBody().toString();
				
				if(brand_cin.length() == 21) {
					
					CINResponse cinResponse = new CINResponse();
					
					if(cinJson.contains("message")) {
						
						SandboxErrorResponse sandboxErrorResponse = gson.fromJson(cinJson, SandboxErrorResponse.class);
						
						cinResponse.setStatus_code(sandboxErrorResponse.getCode());
						cinResponse.setStatus("FAILURE");
						cinResponse.setMsg(sandboxErrorResponse.getMessage());
						
					} else {
						
						CIN cin = gson.fromJson(cinJson, CIN.class);
						
						String companyName =  cin.getData().getCompanyMasterData().getCompanyName();
						String emailId =  cin.getData().getCompanyMasterData().getEmailId();
						String completeAddress = cin.getData().getCompanyMasterData().getRegisteredAddress();
						String pincode = completeAddress.substring(completeAddress.length()-9, completeAddress.length()-3);
						String country = "India";
						String stateCode = completeAddress.substring(completeAddress.length()-12, completeAddress.length()-10);
						String state = Utils.getStateFromStateCode(stateCode);
						String addressWoStateCode = completeAddress.substring(0, completeAddress.length()-13);
						String city = addressWoStateCode.substring(addressWoStateCode.lastIndexOf(" ") + 1, addressWoStateCode.length());
						String address = completeAddress.substring(0, addressWoStateCode.indexOf(city) - 1);
						
						/*System.out.println(companyName);
						System.out.println(emailId);
						System.out.println(pincode);
						System.out.println(country);
						System.out.println(stateCode);
						System.out.println(state);
						//System.out.println(addressWoStateCode);
						System.out.println(city);
						System.out.println(address);*/
						
						cinResponse.setStatus_code(200);
						cinResponse.setStatus("Success");
						cinResponse.setMsg("We have succesfully validated your CIN details");
						
						cinResponse.setCompanyName(companyName);
						cinResponse.setEmailId(emailId);
						cinResponse.setAddress(address);
						cinResponse.setCity(city);
						cinResponse.setState(state);
						cinResponse.setCountry(country);
						cinResponse.setPincode(pincode);
	
					}
					
					writer.print(new Gson().toJson(cinResponse));
					writer.close();
					return;
				}
				
				if(brand_cin.length() == 8) {
					
					LlpResponse llpResponse = new LlpResponse();
					
					if(cinJson.contains("message")) {
						
						SandboxErrorResponse sandboxErrorResponse = gson.fromJson(cinJson, SandboxErrorResponse.class);
						
						llpResponse.setStatus_code(sandboxErrorResponse.getCode());
						llpResponse.setStatus("FAILURE");
						llpResponse.setMsg(sandboxErrorResponse.getMessage());
						
					} else {
						
						Llp llp = gson.fromJson(cinJson, Llp.class);
						
						//System.out.println(llp.getData().getLlpMasterData().getRegisteredAddress());
			
						String companyName =  llp.getData().getLlpMasterData().getLlpName();
						String emailId =  llp.getData().getLlpMasterData().getEmailId();
						String completeAddress = llp.getData().getLlpMasterData().getRegisteredAddress();
						String pincode = completeAddress.substring(completeAddress.length()-6, completeAddress.length()-0);
						String country = "India";
						
						String stateCode = completeAddress.substring(completeAddress.length()-16, completeAddress.length()-14);
						String state = Utils.getStateFromStateCode(stateCode);
						String addressWoStateCode = completeAddress.substring(0, completeAddress.length()-17);
						String city = addressWoStateCode.substring(addressWoStateCode.lastIndexOf(" ") + 1, addressWoStateCode.length());
						String address = completeAddress.substring(0, addressWoStateCode.indexOf(city) - 1);
						
						/*System.out.println(companyName);
						System.out.println(emailId);
						System.out.println(pincode);
						System.out.println(country);
						System.out.println(stateCode);
						System.out.println(state);
						System.out.println(city);
						System.out.println(address);*/
						
						llpResponse.setStatus_code(200);
						llpResponse.setStatus("Success");
						llpResponse.setMsg("We have succesfully validated your LLPIN details");
						
						llpResponse.setCompanyName(companyName);
						llpResponse.setEmailId(emailId);
						llpResponse.setAddress(address);
						llpResponse.setCity(city);
						llpResponse.setState(state);
						llpResponse.setCountry(country);
						llpResponse.setPincode(pincode);
	
					}
					
					writer.print(new Gson().toJson(llpResponse));
					writer.close();
					return;
	
				}
			}else {
				response.sendRedirect("/bootcamp");
			}
		}
		catch(Exception ex)
		{
			writer.print("");
			writer.close();
			ex.printStackTrace();
		}
	}
	
	@RequestMapping(value="/getCompanyDetailsByGST")
	public void getCompanyDetailsByGST(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");	
		Gson gson = new Gson();
		HashMap<String, String> accountMap = null;
		try
		{
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_type_id").equalsIgnoreCase(Utils.adminId.toString()))) 
			{
				
				String user_login_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				String user_type = accountMap.get("user_type");
				
				String brand_gst = request.getParameter("brand_gst");
				//System.out.println("gst_no-->"+brand_gst);
				
				if(brand_gst == null) {brand_gst = "";}
				
				// Authentication
				Unirest.setTimeouts(0, 0);
				HttpResponse<String> accessTokenResponse = Unirest.post("https://api.sandbox.co.in/authenticate")
				  .header("Accept", "application/json")
				  .header("x-api-key", "key_live_PLrqnIhTgqoTHHjzH0gUA3H7JpwLInQ7")
				  .header("x-api-secret", "secret_live_CsOHJz1p27YeYDUYt1rBDufMW04yjL3d")
				  .header("x-api-version", "1.0")
				  .asString();
				String accessTokenJson  = accessTokenResponse.getBody().toString();
				AuthenticateResponse authenticateResponse= new Gson().fromJson(accessTokenJson, AuthenticateResponse.class);
				String access_token = authenticateResponse.getAccess_token();
				//System.out.println(access_token);
				
				// SEARCH CIN
				Unirest.setTimeouts(0, 0);
				HttpResponse<String> gstinSearchResponse = Unirest.get("https://api.sandbox.co.in/gsp/public/gstin/"+brand_gst)
				  .header("Accept", "application/json")
				  .header("Authorization", access_token)
			      .header("x-api-key", "key_live_PLrqnIhTgqoTHHjzH0gUA3H7JpwLInQ7")
				  .header("x-api-version", "1.0")
				  .asString();
				
				String gstJson = gstinSearchResponse.getBody().toString();
				//System.out.println("gstJson - " + gstJson);
				
				GSTResponse gstResponse = new GSTResponse();
				
				if(gstJson.contains("message")) {
					SandboxErrorResponse sandboxErrorResponse = gson.fromJson(gstJson, SandboxErrorResponse.class);
					gstResponse.setStatus_code(sandboxErrorResponse.getCode());
					gstResponse.setStatus("FAILURE");
					gstResponse.setMsg(sandboxErrorResponse.getMessage());
				} else {
					Gst gst = gson.fromJson(gstJson, Gst.class);
					
					//System.out.println(gst.getData().getTradeNam());
		
					gstResponse.setStatus_code(200);
					gstResponse.setStatus("Success");
					gstResponse.setMsg("Success");
					
					gstResponse.setCompanyName(gst.getData().getTradeNam());
		
				}
				
				writer.print(new Gson().toJson(gstResponse));
				writer.close();
				return;
			}else {
				response.sendRedirect("/bootcamp");
			}
		}
		catch(Exception ex)
		{
			writer.print("");
			writer.close();
			ex.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/addUpdateBrand")
	public void addUpdateBrand(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;
		HashMap<String, String> accountMap = null;
		try {

			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_type_id").equalsIgnoreCase(Utils.adminId.toString()))) 
			{
				
				String user_login_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				String user_type = accountMap.get("user_type");

				commonResponse = new CommonResponse();
				gson = new Gson();

				String brand_id = request.getParameter("brand_id");
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
				String brand_admin_name = request.getParameter("brand_admin_name");
				String brand_admin_email = request.getParameter("brand_admin_email");
				String brand_admin_mobile = request.getParameter("brand_admin_mobile");
				
				if(brand_id == null) {brand_id = "";}
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
				if(brand_admin_name == null) {brand_admin_name = "";}
				if(brand_admin_email == null) {brand_admin_email = "";}
				if(brand_admin_mobile == null) {brand_admin_mobile = "";}
				
				brand_id = brand_id.trim();
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
				brand_admin_name = brand_admin_name.trim();
				brand_admin_email = brand_admin_email.trim();
				brand_admin_mobile = brand_admin_mobile.trim();
				
				Brand brand = null;
				Integer user_id = 0;
				CmsUser cmsUser = null; 
				Boolean isFirstTimeBrand = false;
				Boolean isFirstTimeUser = false;
				
				String password = Utils.getAutoPassword();
				String enc_pass = Utils.EncodeString(password);
				
				if(!brand_id.isEmpty()) {
					brand = adminDAO.getBrandById(Integer.parseInt(brand_id));
				}
				
				if(brand != null) {
					user_id = brand.getUser_id();
				}else {
					brand = new Brand();
					isFirstTimeBrand = true;
				}
				
				if(!user_id.equals(0)) {
					cmsUser = candidateDAO.getUserById(user_id);
				}
				
				if(cmsUser == null) {
					cmsUser = new CmsUser();
					isFirstTimeUser = true;
				}
				
				cmsUser.setName(brand_admin_name);
				cmsUser.setEmail(brand_admin_email);
				cmsUser.setMobile(brand_admin_mobile);
				cmsUser.setPassword_encrypted("");
				cmsUser.setPassword_encrypted(enc_pass);
				cmsUser.setUser_type("brandAdmin");
            	cmsUser.setUser_type_id(Utils.brandId);
            	cmsUser.setCreated_date(new Date());
            	cmsUser.setLogin_date(new Date());
            	cmsUser.setActive(true);
            	
            	candidateDAO.saveOrUpdateCmsUser(cmsUser);
            	
            	brand.setUser_id(cmsUser.getId());
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
				brand.setAdmin_name(brand_admin_name);
				brand.setAdmin_email(brand_admin_email);
				brand.setAdmin_mobile(brand_admin_mobile);
				brand.setCreated_date(new Date());
				brand.setActive(true);
				
				adminDAO.saveOrUpdateBrand(brand);
				
				cmsUser.setBrand_id(brand.getId());
				candidateDAO.saveOrUpdateCmsUser(cmsUser);
				
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
		            		brandDirector = adminDAO.getBrandDirectorById(Integer.parseInt(brand_directors_idArr.get(i)));
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
	            	
	            	adminDAO.saveOrUpdateBrandDirector(brandDirector);
	    		}
	    		
	    		if(isFirstTimeUser) {
            		sendEmailUtil.sendBrandAdminLoginDetails(brand_admin_name, brand_admin_email, password);
            	}
	    		
	    		if(isFirstTimeBrand) {
	    			
	    			Log log = new Log();
			 		log.setUser_id(Integer.parseInt(user_login_id));
			 		log.setUser_name(user_name);
			 		log.setTitle("New Brand Created");
			 		log.setDescription(user_name+" has created the new brand ("+brand.getName()+")");
			 		log.setActivity_time(new Date());
			 		String ipAddr = Utils.getIpAddr(request);
					if(ipAddr == null){ipAddr="";}
			 		log.setIp_addr(ipAddr);
			 		logDAO.saveLog(log);
	    			
	    			commonResponse.setStatus("SUCCESS");
					commonResponse.setStatus_code(200);
					commonResponse.setMsg("The New Brand Added Successfully.");
					writer.print(gson.toJson(commonResponse));
					writer.close();
					return;
	    		}else {
	    			
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
	
	@RequestMapping({"/view-brand" })
	public String view_brand(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try
		{	
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_type_id").equalsIgnoreCase(Utils.adminId.toString()))) {
				
				String user_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				String user_type = accountMap.get("user_type");
				
				String brand_id = request.getParameter("brand_id");
				
				if(brand_id == null) {brand_id = "";}
				
				brand_id = brand_id.trim();
				
				Brand brand = null;
				List<BrandDirectors> brandDirectors = null;
				List<CmsUser> cmsUserBrandAdminList = null;
				CmsUser cmsUser = null;
				
				if(!brand_id.isEmpty()) {
					brand = adminDAO.getBrandById(Integer.parseInt(brand_id));
					brandDirectors = adminDAO.getAllBrandDirectorsListByBrandId(Integer.parseInt(brand_id));
					cmsUserBrandAdminList = adminDAO.getAllBrandAdmin();
				}
				
				if(brand != null) {
					cmsUser = candidateDAO.getUserById(brand.getUser_id());
				}
				
				request.setAttribute("brand", brand);
				request.setAttribute("brandDirectors", brandDirectors);
				request.setAttribute("cmsUserBrandAdmin", cmsUserBrandAdminList);
				request.setAttribute("cmsUser", cmsUser);
				
				request.setAttribute("page", "view-brand");
			}
			else {
				response.sendRedirect("/bootcamp");
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "bootcamp.admin.brands.view";
	}
	
	@RequestMapping(value = "/deleteBrandById")
	public void deleteBrandById(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;
		HashMap<String, String> accountMap = null;
		try {

			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_type_id").equalsIgnoreCase(Utils.adminId.toString()))) 
			{
				
				String user_login_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				String user_type = accountMap.get("user_type");

				commonResponse = new CommonResponse();
				gson = new Gson();

				String brand_id = request.getParameter("brand_id");
				
				if(brand_id == null) {brand_id ="";}
	    		
				brand_id = brand_id.trim();
				
				Brand brand = null;
				
				Integer user_id = null;
				
				if(!brand_id.isEmpty()) {
					brand = adminDAO.getBrandById(Integer.parseInt(brand_id));
				}
				
				if(brand != null) {
					user_id = brand.getUser_id();
				}
	    		
				Boolean userResult = false;
	    		Boolean brandresult =  false;
	    		Boolean brandDirectorResult =  false;
	    		
	    		if(!brand_id.isEmpty()) {
	    			
	    			Log log = new Log();
			 		log.setUser_id(Integer.parseInt(user_login_id));
			 		log.setUser_name(user_name);
			 		log.setTitle("The Brand Deleted");
			 		log.setDescription(user_name+" has deleted the brand details ("+brand.getName()+")");
			 		log.setActivity_time(new Date());
			 		String ipAddr = Utils.getIpAddr(request);
					if(ipAddr == null){ipAddr="";}
			 		log.setIp_addr(ipAddr);
			 		logDAO.saveLog(log);
			 		
	    			userResult = adminDAO.deleteUserById(user_id);
	    			brandresult = adminDAO.deleteBrandById(Integer.parseInt(brand_id));
	    			brandDirectorResult = adminDAO.deleteBrandDirectorsByBrandId(Integer.parseInt(brand_id));
	    		}
	    		
	    		if(brandresult && brandDirectorResult && userResult) {
	    			
	    			commonResponse.setMsg("Brand Deleted successfully");
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
	
	@RequestMapping(value="/getBrandDirectorById")
	public void getBrandDirectorById(HttpServletRequest request, HttpServletResponse response) throws Exception 
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
	    		
	    		String brand_director_id = request.getParameter("brand_director_id");
	    		
	    		if(brand_director_id == null) {brand_director_id = "";}
	    		
	    		brand_director_id = brand_director_id.trim();
	    		
	    		BrandDirectors brandDirectors = null;
	    		
	    		if(!brand_director_id.isEmpty()) {
	    			brandDirectors = adminDAO.getBrandDirectorById(Integer.parseInt(brand_director_id));
	    		}
	    	    
	    		if(brandDirectors != null) {
	    			commonResponse.setStatus("SUCCESS");
	    			commonResponse.setStatus_code(200);
	    			writer.print(gson.toJson(brandDirectors));
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
	
	@RequestMapping(value="/addUpdateBrandDirectorByBrandId")
	public void addUpdateBrandDirectorByBrandId(HttpServletRequest request, HttpServletResponse response) throws Exception 
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
	    		
	    		String brand_id = request.getParameter("brand_id");
	    		String brand_director_id = request.getParameter("brand_director_id");
	    		String brand_director_name = request.getParameter("brand_director_name");
	    		String brand_director_designation = request.getParameter("brand_director_designation");
	    		String brand_director_mobile = request.getParameter("brand_director_mobile");
	    		String brand_director_email = request.getParameter("brand_director_email");
	    		String brand_director_notes = request.getParameter("brand_director_notes");
	    		
	    		if(brand_id == null) {brand_id = "";}
	    		if(brand_director_id == null) {brand_director_id = "";}
	    		if(brand_director_name == null) {brand_director_name = "";}
	    		if(brand_director_designation == null) {brand_director_designation = "";}
	    		if(brand_director_mobile == null) {brand_director_mobile = "";}
	    		if(brand_director_email == null) {brand_director_email = "";}
	    		if(brand_director_notes == null) {brand_director_notes = "";}
	    		
	    		brand_id = brand_id.trim();
	    		brand_director_id = brand_director_id.trim();
	    		brand_director_name = brand_director_name.trim();
	    		brand_director_designation = brand_director_designation.trim();
	    		brand_director_mobile = brand_director_mobile.trim();
	    		brand_director_email = brand_director_email.trim();
	    		brand_director_notes = brand_director_notes.trim();
	    		
	    		Brand brand = null;
	    		BrandDirectors brandDirectors = null;
	    		Boolean isFirstTimeDirector = false;
	    		
	    		if(!brand_id.isEmpty()) {
	    			brand = adminDAO.getBrandById(Integer.parseInt(brand_id));
	    		}
	    		
	    		if(!brand_director_id.isEmpty()) {
	    			brandDirectors = adminDAO.getBrandDirectorById(Integer.parseInt(brand_director_id));
	    		}
	    		
	    		if(brandDirectors == null) {
	    			brandDirectors = new BrandDirectors();
	    			isFirstTimeDirector = true;
	    		}
	    		
	    		brandDirectors.setBrand_id(brand.getId());
	    		brandDirectors.setBrand_name(brand.getName());
	    		brandDirectors.setName(brand_director_name);
	    		brandDirectors.setDesignation(brand_director_designation);
	    		brandDirectors.setMobile(brand_director_mobile);
	    		brandDirectors.setEmail(brand_director_email);
	    		brandDirectors.setNotes(brand_director_notes);
	    		brandDirectors.setCreated_date(new Date());
	    		brandDirectors.setActive(true);
	    		
	    		adminDAO.saveOrUpdateBrandDirector(brandDirectors);
	    		
	    		if(isFirstTimeDirector) {
	    			
	    			Log log = new Log();
			 		log.setUser_id(Integer.parseInt(user_login_id));
			 		log.setUser_name(user_name);
			 		log.setTitle("The Brand Deleted");
			 		log.setDescription(user_name+" has created the new brand director details ("+brand.getName()+")");
			 		log.setActivity_time(new Date());
			 		String ipAddr = Utils.getIpAddr(request);
					if(ipAddr == null){ipAddr="";}
			 		log.setIp_addr(ipAddr);
			 		logDAO.saveLog(log);
			 		
	    			commonResponse.setStatus("SUCCESS");
	    			commonResponse.setStatus_code(200);
	    			commonResponse.setMsg("Brand Director Added Successfully");
	    			writer.print(gson.toJson(commonResponse));
	    			writer.close();
	    			return;
	    		}else {
	    			
	    			Log log = new Log();
			 		log.setUser_id(Integer.parseInt(user_login_id));
			 		log.setUser_name(user_name);
			 		log.setTitle("The Brand Deleted");
			 		log.setDescription(user_name+" has updated the brand director details ("+brand.getName()+")");
			 		log.setActivity_time(new Date());
			 		String ipAddr = Utils.getIpAddr(request);
					if(ipAddr == null){ipAddr="";}
			 		log.setIp_addr(ipAddr);
			 		logDAO.saveLog(log);
			 		
	    			commonResponse.setStatus("SUCCESS");
	    			commonResponse.setStatus_code(200);
	    			commonResponse.setMsg("Brand Director Details Updated");
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
	
	@RequestMapping(value = "/deleteBrandDirectorById")
	public void deleteBrandDirectorById(HttpServletRequest request, HttpServletResponse response) throws Exception {
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
    		 		
    		 		brandDirectorResult = adminDAO.deleteBrandDirectorsById(Integer.parseInt(brand_director_id));
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
	@RequestMapping(value = "/activateDeactivateBrand")
	public void activateDeactivateBrand(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;

		HashMap<String, String> accountMap = null;
		try {
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_type_id").equalsIgnoreCase(Utils.adminId.toString()))) {
				
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
			 		System.out.println("brand id super admin"+cmsUser.getBrand_id());
			 		adminDAO.updateactiveStatusUserByBrandId(brand.getId(),0);

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
			 		
			 		adminDAO.updateactiveStatusUserByBrandId(brand.getId(),1);
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
	
	@RequestMapping(value = "/addNewBrandAdminUser")
	public void addNewBrandAdminUser(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;
		HashMap<String, String> accountMap = null;
		try {
			System.out.println("try");

			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_type_id").equalsIgnoreCase(Utils.adminId.toString()))) 
			{
				String user_login_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				String user_type = accountMap.get("user_type");
				System.out.println("user_login_id = "+user_login_id);
				commonResponse = new CommonResponse();
				gson = new Gson();
				
				String brand_id = request.getParameter("brand_id");
				System.out.println("brand_id = "+brand_id);
				String brand_user_id = request.getParameter("brand_user_id");
				System.out.println("brand_user_id = "+brand_user_id);
				String brand_user_name = request.getParameter("brand_user_name");
				System.out.println("brand_user_name = "+brand_user_name);
				String brand_user_mobile = request.getParameter("brand_user_mobile");
				System.out.println("brand_user_mobile = "+brand_user_mobile);
				String brand_user_email = request.getParameter("brand_user_email");
				System.out.println("brand_user_email = "+brand_user_email);
				
				
				if(brand_id == null) {brand_id ="";}
				if(brand_user_id == null) {brand_user_id ="";}
				if(brand_user_name == null) {brand_user_name ="";}
				if(brand_user_mobile == null) {brand_user_mobile ="";}
				if(brand_user_email == null) {brand_user_email ="";}
	
				
				brand_id = brand_id.trim();
				brand_user_id = brand_user_id.trim();
				brand_user_name = brand_user_name.trim();
				brand_user_mobile = brand_user_mobile.trim();
				brand_user_email = brand_user_email.trim();
			
				CmsUser cmsUser = null;
				Boolean isFirstTimeUser = false;
				Brand brand = null;
				
				String password = Utils.getAutoPassword();
				String enc_pass = Utils.EncodeString(password);
				
				if(!brand_user_id.isEmpty()) {
					cmsUser = candidateDAO.getUserById(Integer.parseInt(brand_user_id));
				}
				
				if(user_login_id != null || !user_login_id.isEmpty()) {
					brand = adminDAO.getBrandByUserId(Integer.parseInt(user_login_id));
				}
				
				if(cmsUser == null) {
					cmsUser = new CmsUser();
					isFirstTimeUser = true;
				}
				
				cmsUser.setBrand_id(Integer.parseInt(brand_id));
				cmsUser.setName(brand_user_name);
				cmsUser.setMobile(brand_user_mobile);
				cmsUser.setEmail(brand_user_email);
				cmsUser.setPassword_encrypted(enc_pass);
				cmsUser.setUser_type_id(6);
				cmsUser.setCreated_date(new Date());
				cmsUser.setLogin_date(new Date());
				cmsUser.setActive(true);
				
				candidateDAO.saveOrUpdateCmsUser(cmsUser);
								
				if(isFirstTimeUser) {
					sendEmailUtil.sendBrandAdminLoginDetails(cmsUser.getName(), cmsUser.getEmail(), password);
            	}
				
				if(isFirstTimeUser) {
					commonResponse.setStatus("SUCCESS");
	    			commonResponse.setStatus_code(200);
	    			commonResponse.setMsg("Brand Admin Added Successfully");
	    			writer.print(gson.toJson(commonResponse));
	    			writer.close();
	    			return;
	    		
	    		} else {
	    			commonResponse.setStatus("SUCCESS");
	    			commonResponse.setStatus_code(200);
	    			commonResponse.setMsg("Brand Admin Updated Successfully");
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
	
	@RequestMapping(value="/getUserById")
	public void getUserById(HttpServletRequest request, HttpServletResponse response) throws Exception 
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
	
	@RequestMapping(value="/activateDeactivateBrandAdmin")
	public void activateDeactivateBrandAdmin(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;	
		
		HashMap<String, String> accountMap = null;
		try 
   		{			
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_type_id").equalsIgnoreCase(Utils.adminId.toString()))) {
				
				String user_id = accountMap.get("user_id");
				String user_email = accountMap.get("user_email");
				String user_name = accountMap.get("user_name");
				String user_type_id = accountMap.get("user_type_id");
				String user_type = accountMap.get("user_type");
				
				commonResponse = new CommonResponse();
	    		gson = new Gson();	
	    		
	    		String id = request.getParameter("id");
	    		
	    		CmsUser cmsUser = null;
	    		Brand brand = null;
	    		
	    		if(!id.isEmpty()) 
	    		{
	    			cmsUser = candidateDAO.getUserById(Integer.parseInt(id));
	    		}
	    		
				if(cmsUser != null) {
					brand = adminDAO.getBrandById(cmsUser.getBrand_id());
				}
				
	    		Boolean active = cmsUser.getActive();
	    		
	    		if(active == true)
	    		{
	    			cmsUser.setActive(false);
	    		}else {
	    			cmsUser.setActive(true);
	    		}
   				
	    		candidateDAO.saveOrUpdateCmsUser(cmsUser);
	    		
	    		if(active == true) {
	    			
	    			Log log = new Log();
			 		log.setUser_id(Integer.parseInt(user_id));
			 		log.setUser_name(user_name);
			 		log.setTitle("Brand Admin Deactivated");
			 		log.setDescription(user_name+" has Deactivated the following Brand Admin - ("+brand.getName()+")");
			 		log.setActivity_time(new Date());
			 		String ipAddr = Utils.getIpAddr(request);
					if(ipAddr == null){ipAddr="";}
			 		log.setIp_addr(ipAddr);
			 		logDAO.saveLog(log);
			 		
			 		commonResponse.setStatus("SUCCESS");
	    			commonResponse.setStatus_code(200);
	    			commonResponse.setMsg("The Brand Admin deactivated Successfully");
	    			writer.print(gson.toJson(commonResponse));
	    			writer.close();
	    			return;
	    			
	    		} else {
	    			
	    			Log log = new Log();
			 		log.setUser_id(Integer.parseInt(user_id));
			 		log.setUser_name(user_name);
			 		log.setTitle("Brand Admin Activated");
			 		log.setDescription(user_name+" has activated the following Brand Admin - ("+brand.getName()+")");
			 		log.setActivity_time(new Date());
			 		String ipAddr = Utils.getIpAddr(request);
					if(ipAddr == null){ipAddr="";}
			 		log.setIp_addr(ipAddr);
			 		logDAO.saveLog(log);
			 		
	    			commonResponse.setStatus("SUCCESS");
	    			commonResponse.setStatus_code(200);
	    			commonResponse.setMsg("The Brand Admin Activated Successfully.");
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
