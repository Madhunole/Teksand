package com.teksands.user.controller;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dhatim.fastexcel.Workbook;
import org.dhatim.fastexcel.Worksheet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.teksands.admin.dao.AdminDAO;
import com.teksands.user.model.Career;
import com.teksands.user.model.Contactus;
import com.teksands.user.model.Contributor;
import com.teksands.user.model.CorporateEnquiry;
import com.teksands.user.model.EBPCandidate;
import com.teksands.user.model.EbooksDownload;
import com.teksands.user.model.EbpEmails;
import com.teksands.user.model.Internship;
import com.teksands.user.model.ItStaffing;
import com.teksands.user.model.JobsApplications;
import com.teksands.user.model.Leads;
import com.teksands.user.model.Mentors;
import com.teksands.user.model.Trainers;
import com.teksands.user.model.WebinarContacts;
import com.teksands.user.model.Webinars;

@Controller
public class XLDownloadController {
	
	@Autowired
	AdminDAO adminDAO;
	
	@RequestMapping(value="/leadsdownloadXL")
	public void leadsdownloadXL(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try 
		{
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			
			if(accountMap != null) {
				
			List<Leads> leadsList = adminDAO.getAllLeads();
			request.setAttribute("leads", leadsList);
	 		
	 		response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-Disposition", "attachment;filename=Teksands-Leads.xlsx");
			
			
			Workbook wb = new Workbook(response.getOutputStream(), "MyApplication", "1.0");
			Worksheet ws = wb.newWorksheet("Teksands Leads Report");
			
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
									
			ws.value(0, 0, "Teksands Leads");
			ws.range(0, 0, 0, 5).merge();
			ws.range(0, 0, 0, 5).style().horizontalAlignment("center").set();
			ws.style(0, 0).bold().fontSize(11).set(); 

			int i = 1;
			int j = 0;
			for(j = 0; j <= 5; j++) {
				ws.style(i, j).bold().fontSize(9).borderStyle("bold").borderColor("0f76bd").wrapText(true).set();	
			}
			
			ws.value(i, 0, "Id");
	        ws.value(i, 1, "Name");
		    ws.value(i, 2, "Email");
		    ws.value(i, 3, "Mobile");
		    ws.value(i, 4, "Date");
		    ws.value(i++, 5, "Course");

	 		for(Leads downloadLeadsList : adminDAO.getAllLeads())
	 		{
	 			ws.value(i, 0, downloadLeadsList.getId());
				ws.style(i, 0).fontSize(9).wrapText(true).set();
				
				ws.value(i, 1, downloadLeadsList.getName());
				ws.style(i, 1).fontSize(9).wrapText(true).set();
				
				ws.value(i, 2, downloadLeadsList.getEmail());
				ws.style(i, 2).fontSize(9).wrapText(true).set();
				
				ws.value(i, 3, downloadLeadsList.getMobile());
				ws.style(i, 3).fontSize(9).wrapText(true).set();
				
				ws.value(i, 4, sdf.format(downloadLeadsList.getDate()));
				ws.style(i, 4).fontSize(9).wrapText(true).set();
				
				ws.value(i, 5, downloadLeadsList.getCourse());
				ws.style(i++, 5).fontSize(9).wrapText(true).set();
				
	 		}
	 		wb.finish();
		} 
		else {
			
			response.sendRedirect("/home");
			}
		}
 		catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}
	
	@RequestMapping(value="/contactsdownloadXL")
	public void contactsdownloadXL(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try 
		{
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			
			if(accountMap != null) {
				
			List<Contactus> contactsList = adminDAO.getAllContacts();
			request.setAttribute("contacts", contactsList);
	 		
	 		response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-Disposition", "attachment;filename=Teksands-Contacts.xlsx");
			
			
			Workbook wb = new Workbook(response.getOutputStream(), "MyApplication", "1.0");
			Worksheet ws = wb.newWorksheet("Teksands Contacts Report");
			
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
									
			ws.value(0, 0, "Teksands Contacts");
			ws.range(0, 0, 0, 6).merge();
			ws.range(0, 0, 0, 6).style().horizontalAlignment("center").set();
			ws.style(0, 0).bold().fontSize(11).fontColor("0f76bd").set(); 

			int i = 1;
			int j = 0;
			for(j = 0; j <= 6; j++) {
				ws.style(i, j).bold().fontSize(9).borderStyle("bold").borderColor("0f76bd").wrapText(true).set();	
			}
			
			ws.width(5, 36);

			ws.value(i, 0, "Id");
	        ws.value(i, 1, "Name");
		    ws.value(i, 2, "Company");
		    ws.value(i, 3, "Email");
		    ws.value(i, 4, "Mobile");
		    ws.value(i, 5, "Requirement");
		    ws.value(i++, 6, "Date");

	 		for(Contactus downloadContactsList : adminDAO.getAllContacts())
	 		{
	 			ws.value(i, 0, downloadContactsList.getId());
				ws.style(i, 0).fontSize(9).wrapText(true).set();
				
				ws.value(i, 1, downloadContactsList.getName());
				ws.style(i, 1).fontSize(9).wrapText(true).set();
				
				ws.value(i, 2, downloadContactsList.getCompany());
				ws.style(i, 2).fontSize(9).wrapText(true).set();
				
				ws.value(i, 3, downloadContactsList.getEmail());
				ws.style(i, 3).fontSize(9).wrapText(true).set();
				
				ws.value(i, 4, downloadContactsList.getMobile());
				ws.style(i, 4).fontSize(9).wrapText(true).set();
				
				ws.value(i, 5, downloadContactsList.getRequirements());
				ws.style(i, 5).fontSize(9).wrapText(true).set();
				
				ws.value(i, 6, sdf.format(downloadContactsList.getDate()));
				ws.style(i++, 6).fontSize(9).wrapText(true).set();
				
	 		}
	 		wb.finish();
		} 
		else {
			
			response.sendRedirect("/home");
			}
		}
 		catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}
	
	@RequestMapping(value="/contributorsdownloadXL")
	public void contributorsdownloadXL(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try 
		{
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			
			if(accountMap != null) {
				
			List<Contributor> contributorList = adminDAO.getAllContributor();
			request.setAttribute("contributor", contributorList);
	 		
	 		response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-Disposition", "attachment;filename=Teksands-Contributors.xlsx");
			
			
			Workbook wb = new Workbook(response.getOutputStream(), "MyApplication", "1.0");
			Worksheet ws = wb.newWorksheet("Teksands Contributors Report");
			
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
									
			ws.value(0, 0, "Teksands Contributors");
			ws.range(0, 0, 0, 13).merge();
			ws.range(0, 0, 0, 13).style().horizontalAlignment("center").set();
			ws.style(0, 0).bold().fontSize(11).fontColor("0f76bd").set(); 

			int i = 1;
			int j = 0;
			for(j = 0; j <= 13; j++) {
				ws.style(i, j).bold().fontSize(9).borderStyle("bold").borderColor("0f76bd").wrapText(true).set();	
			}
			
			ws.value(i, 0, "Id");
	        ws.value(i, 1, "Name");
		    ws.value(i, 2, "Mobile");
		    ws.value(i, 3, "Email");
		    ws.value(i, 4, "Genger");
		    ws.value(i, 5, "Address 1");
		    ws.value(i, 6, "Address 2");
		    ws.value(i, 7, "City");
		    ws.value(i, 8, "State");
		    ws.value(i, 9, "Country");
		    ws.value(i, 10, "Pincode");
		    ws.value(i, 11, "Date");
		    ws.value(i, 12, "Core Skills");
		    ws.value(i++, 13, "Experience");
		    
	 		for(Contributor downloadContributorList : adminDAO.getAllContributor())
	 		{
	 			ws.value(i, 0, downloadContributorList.getId());
				ws.style(i, 0).fontSize(9).wrapText(true).set();
				
				ws.value(i, 1, downloadContributorList.getName());
				ws.style(i, 1).fontSize(9).wrapText(true).set();
				
				ws.value(i, 2, downloadContributorList.getMobile());
				ws.style(i, 2).fontSize(9).wrapText(true).set();
				
				ws.value(i, 3, downloadContributorList.getEmail());
				ws.style(i, 3).fontSize(9).wrapText(true).set();
				
				ws.value(i, 4, downloadContributorList.getGender());
				ws.style(i, 4).fontSize(9).wrapText(true).set();
				
				ws.value(i, 5, downloadContributorList.getAddress1());
				ws.style(i, 5).fontSize(9).wrapText(true).set();
				
				ws.value(i, 6, downloadContributorList.getAddress2());
				ws.style(i, 6).fontSize(9).wrapText(true).set();
				
				ws.value(i, 7, downloadContributorList.getCity());
				ws.style(i, 7).fontSize(9).wrapText(true).set();
				
				ws.value(i, 8, downloadContributorList.getState());
				ws.style(i, 8).fontSize(9).wrapText(true).set();
				
				ws.value(i, 9, downloadContributorList.getCountry());
				ws.style(i, 9).fontSize(9).wrapText(true).set();
				
				ws.value(i, 10, downloadContributorList.getPincode());
				ws.style(i, 10).fontSize(9).wrapText(true).set();
				
				ws.value(i, 11, sdf.format(downloadContributorList.getDate()));
				ws.style(i, 11).fontSize(9).wrapText(true).set();
				
				ws.value(i, 12, downloadContributorList.getCore_skills());
				ws.style(i, 12).fontSize(9).wrapText(true).set();
				
				ws.value(i, 13, downloadContributorList.getExperience());
				ws.style(i++, 13).fontSize(9).wrapText(true).set();
				
	 		}
	 		wb.finish();
		} 
		else {
			
			response.sendRedirect("/home");
			}
		}
 		catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}
	
	@RequestMapping(value="/trainersdownloadXL")
	public void trainersdownloadXL(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try 
		{
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			
			if(accountMap != null) {
				
			List<Trainers> trainersList = adminDAO.getAllTrainers();
			request.setAttribute("trainers", trainersList);
	 		
	 		response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-Disposition", "attachment;filename=Teksands-Trainers.xlsx");
			
			
			Workbook wb = new Workbook(response.getOutputStream(), "MyApplication", "1.0");
			Worksheet ws = wb.newWorksheet("Teksands Trainers Report");
			
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
									
			ws.value(0, 0, "Teksands Trainers");
			ws.range(0, 0, 0, 14).merge();
			ws.range(0, 0, 0, 14).style().horizontalAlignment("center").set();
			ws.style(0, 0).bold().fontSize(11).fontColor("0f76bd").set(); 

			int i = 1;
			int j = 0;
			for(j = 0; j <= 14; j++) {
				ws.style(i, j).bold().fontSize(9).borderStyle("bold").borderColor("0f76bd").wrapText(true).set();	
			}
			
			ws.width(10, 36);
			ws.width(12, 36);
			ws.width(13, 36);
			
			ws.value(i, 0, "Id");
	        ws.value(i, 1, "Name");
		    ws.value(i, 2, "Mobile");
		    ws.value(i, 3, "Email");
		    ws.value(i, 4, "Genger");
		    ws.value(i, 5, "Address 1");
		    ws.value(i, 6, "Address 2");
		    ws.value(i, 7, "City");
		    ws.value(i, 8, "State");
		    ws.value(i, 9, "Country");
		    ws.value(i, 10, "Technologies");
		    ws.value(i, 11, "Contribute");
		    ws.value(i, 12, "Contribute Description");
		    ws.value(i, 13, "Tech Description");
		    ws.value(i++, 14, "Date");

		    
	 		for(Trainers downloadTrainersList : adminDAO.getAllTrainers())
	 		{
	 			ws.value(i, 0, downloadTrainersList.getId());
				ws.style(i, 0).fontSize(9).wrapText(true).set();
				
				ws.value(i, 1, downloadTrainersList.getName());
				ws.style(i, 1).fontSize(9).wrapText(true).set();
				
				ws.value(i, 2, downloadTrainersList.getMobile());
				ws.style(i, 2).fontSize(9).wrapText(true).set();
				
				ws.value(i, 3, downloadTrainersList.getEmail());
				ws.style(i, 3).fontSize(9).wrapText(true).set();
				
				ws.value(i, 4, downloadTrainersList.getGender());
				ws.style(i, 4).fontSize(9).wrapText(true).set();
				
				ws.value(i, 5, downloadTrainersList.getAddress1());
				ws.style(i, 5).fontSize(9).wrapText(true).set();
				
				ws.value(i, 6, downloadTrainersList.getAddress2());
				ws.style(i, 6).fontSize(9).wrapText(true).set();
				
				ws.value(i, 7, downloadTrainersList.getCity());
				ws.style(i, 7).fontSize(9).wrapText(true).set();
				
				ws.value(i, 8, downloadTrainersList.getState());
				ws.style(i, 8).fontSize(9).wrapText(true).set();
				
				ws.value(i, 9, downloadTrainersList.getCountry());
				ws.style(i, 9).fontSize(9).wrapText(true).set();
				
				ws.value(i, 10, downloadTrainersList.getTechnologies());
				ws.style(i, 10).fontSize(9).wrapText(true).set();
				
				ws.value(i, 11, downloadTrainersList.getContribute());
				ws.style(i, 11).fontSize(9).wrapText(true).set();
				
				ws.value(i, 12, downloadTrainersList.getTech_description());
				ws.style(i, 12).fontSize(9).wrapText(true).set();
				
				ws.value(i, 13, downloadTrainersList.getCon_description());
				ws.style(i, 13).fontSize(9).wrapText(true).set();
				
				ws.value(i, 14, sdf.format(downloadTrainersList.getDate()));
				ws.style(i++, 14).fontSize(9).wrapText(true).set();
				
	 		}
	 		wb.finish();
		} 
		else {
			
			response.sendRedirect("/home");
			}
		}
 		catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}
	
	@RequestMapping(value="/careerdownloadXL")
	public void careerdownloadXL(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try 
		{
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			
			if(accountMap != null) {
				
			List<Career> careerList = adminDAO.getAllCareer();
			request.setAttribute("careers", careerList);
	 		
	 		response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-Disposition", "attachment;filename=Teksands-Careers.xlsx");
			
			
			Workbook wb = new Workbook(response.getOutputStream(), "MyApplication", "1.0");
			Worksheet ws = wb.newWorksheet("Teksands Careers Report");
			
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
									
			ws.value(0, 0, "Teksands Career");
			ws.range(0, 0, 0, 14).merge();
			ws.range(0, 0, 0, 14).style().horizontalAlignment("center").set();
			ws.style(0, 0).bold().fontSize(11).fontColor("0f76bd").set(); 

			int i = 1;
			int j = 0;
			for(j = 0; j <= 14; j++) {
				ws.style(i, j).bold().fontSize(9).borderStyle("bold").borderColor("0f76bd").wrapText(true).set();	
			}
			
			ws.value(i, 0, "Id");
	        ws.value(i, 1, "Name");
		    ws.value(i, 2, "Mobile");
		    ws.value(i, 3, "Email");
		    ws.value(i, 4, "Genger");
		    ws.value(i, 5, "Address 1");
		    ws.value(i, 6, "Address 2");
		    ws.value(i, 7, "City");
		    ws.value(i, 8, "State");
		    ws.value(i, 9, "Country");
		    ws.value(i, 10, "Pincode");
		    ws.value(i, 11, "Core Skills");
		    ws.value(i, 12, "Experience");
		    ws.value(i, 13, "Role");
		    ws.value(i++, 14, "Date");

		    
	 		for(Career downloadCareerList : adminDAO.getAllCareer())
	 		{
	 			ws.value(i, 0, downloadCareerList.getId());
				ws.style(i, 0).fontSize(9).wrapText(true).set();
				
				ws.value(i, 1, downloadCareerList.getName());
				ws.style(i, 1).fontSize(9).wrapText(true).set();
				
				ws.value(i, 2, downloadCareerList.getMobile());
				ws.style(i, 2).fontSize(9).wrapText(true).set();
				
				ws.value(i, 3, downloadCareerList.getEmail());
				ws.style(i, 3).fontSize(9).wrapText(true).set();
				
				ws.value(i, 4, downloadCareerList.getGender());
				ws.style(i, 4).fontSize(9).wrapText(true).set();
				
				ws.value(i, 5, downloadCareerList.getAddress1());
				ws.style(i, 5).fontSize(9).wrapText(true).set();
				
				ws.value(i, 6, downloadCareerList.getAddress2());
				ws.style(i, 6).fontSize(9).wrapText(true).set();
				
				ws.value(i, 7, downloadCareerList.getCity());
				ws.style(i, 7).fontSize(9).wrapText(true).set();
				
				ws.value(i, 8, downloadCareerList.getState());
				ws.style(i, 8).fontSize(9).wrapText(true).set();
				
				ws.value(i, 9, downloadCareerList.getCountry());
				ws.style(i, 9).fontSize(9).wrapText(true).set();
				
				ws.value(i, 10, downloadCareerList.getPincode());
				ws.style(i, 10).fontSize(9).wrapText(true).set();
				
				ws.value(i, 11, downloadCareerList.getCore_skills());
				ws.style(i, 11).fontSize(9).wrapText(true).set();
				
				ws.value(i, 12, downloadCareerList.getExperience());
				ws.style(i, 12).fontSize(9).wrapText(true).set();
				
				ws.value(i, 13, downloadCareerList.getRole());
				ws.style(i, 13).fontSize(9).wrapText(true).set();
				
				ws.value(i, 14, sdf.format(downloadCareerList.getDate()));
				ws.style(i++, 14).fontSize(9).wrapText(true).set();
				
	 		}
	 		wb.finish();
		} 
		else {
			
			response.sendRedirect("/home");
			}
		}
 		catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}
	
	@RequestMapping(value="/internshipdownloadXL")
	public void internshipdownloadXL(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try 
		{
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			
			if(accountMap != null) {
				
			List<Internship> internshipList = adminDAO.getAllInternship();
			request.setAttribute("internship", internshipList);
	 		
	 		response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-Disposition", "attachment;filename=Teksands-Internship.xlsx");
			
			
			Workbook wb = new Workbook(response.getOutputStream(), "MyApplication", "1.0");
			Worksheet ws = wb.newWorksheet("Teksands Internship Report");
			
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
									
			ws.value(0, 0, "Teksands Internship");
			ws.range(0, 0, 0, 7).merge();
			ws.range(0, 0, 0, 7).style().horizontalAlignment("center").set();
			ws.style(0, 0).bold().fontSize(11).fontColor("0f76bd").set(); 

			int i = 1;
			int j = 0;
			for(j = 0; j <= 7; j++) {
				ws.style(i, j).bold().fontSize(9).borderStyle("bold").borderColor("0f76bd").wrapText(true).set();	
			}
			
			ws.width(5, 36);
			ws.width(6, 36);
			
			ws.value(i, 0, "Id");
	        ws.value(i, 1, "First Name");
		    ws.value(i, 2, "Last Name");
		    ws.value(i, 3, "Email");
		    ws.value(i, 4, "Mobile");
		    ws.value(i, 5, "Skills");
		    ws.value(i, 6, "Descriptions");
		    ws.value(i++, 7, "Date");

		    
	 		for(Internship downloadInternshipList : adminDAO.getAllInternship())
	 		{
	 			ws.value(i, 0, downloadInternshipList.getId());
				ws.style(i, 0).fontSize(9).wrapText(true).set();
				
				ws.value(i, 1, downloadInternshipList.getFirst_name());
				ws.style(i, 1).fontSize(9).wrapText(true).set();
				
				ws.value(i, 2, downloadInternshipList.getLast_name());
				ws.style(i, 2).fontSize(9).wrapText(true).set();
				
				ws.value(i, 3, downloadInternshipList.getEmail());
				ws.style(i, 3).fontSize(9).wrapText(true).set();
				
				ws.value(i, 4, downloadInternshipList.getMobile());
				ws.style(i, 4).fontSize(9).wrapText(true).set();
				
				ws.value(i, 5, downloadInternshipList.getSkills());
				ws.style(i, 5).fontSize(9).wrapText(true).set();
				
				ws.value(i, 6, downloadInternshipList.getDescription());
				ws.style(i, 6).fontSize(9).wrapText(true).set();
				
				ws.value(i, 7, sdf.format(downloadInternshipList.getDate()));
				ws.style(i++, 7).fontSize(9).wrapText(true).set();
				
	 		}
	 		wb.finish();
		} 
		else {
			
			response.sendRedirect("/home");
			}
		}
 		catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}
	
	@RequestMapping(value="/ebooksdownloadXL")
	public void ebooksdownloadXL(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try 
		{
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			
			if(accountMap != null) {
				
			List<EbooksDownload> ebooksDownloadList = adminDAO.getAllEbooksDownload();
			request.setAttribute("ebooks", ebooksDownloadList);
	 		
	 		response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-Disposition", "attachment;filename=Teksands-Ebooks.xlsx");
			
			
			Workbook wb = new Workbook(response.getOutputStream(), "MyApplication", "1.0");
			Worksheet ws = wb.newWorksheet("Teksands Ebooks Report");
			
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
									
			ws.value(0, 0, "Teksands Ebooks");
			ws.range(0, 0, 0, 5).merge();
			ws.range(0, 0, 0, 5).style().horizontalAlignment("center").set();
			ws.style(0, 0).bold().fontSize(11).fontColor("0f76bd").set(); 

			int i = 1;
			int j = 0;
			for(j = 0; j <= 5; j++) {
				ws.style(i, j).bold().fontSize(9).borderStyle("bold").borderColor("0f76bd").wrapText(true).set();	
			}
			
			ws.value(i, 0, "Id");
	        ws.value(i, 1, "Name");
		    ws.value(i, 2, "Mobile");
		    ws.value(i, 3, "Email");
		    ws.value(i, 4, "Download File");
		    ws.value(i++, 5, "Date");
		    		    
	 		for(EbooksDownload downloadEbooksList : adminDAO.getAllEbooksDownload())
	 		{
	 			ws.value(i, 0, downloadEbooksList.getId());
				ws.style(i, 0).fontSize(9).wrapText(true).set();
				
				ws.value(i, 1, downloadEbooksList.getName());
				ws.style(i, 1).fontSize(9).wrapText(true).set();
				
				ws.value(i, 2, downloadEbooksList.getMobile());
				ws.style(i, 2).fontSize(9).wrapText(true).set();
				
				ws.value(i, 3, downloadEbooksList.getEmail());
				ws.style(i, 3).fontSize(9).wrapText(true).set();
				
				ws.value(i, 4, downloadEbooksList.getDownload_file());
				ws.style(i, 4).fontSize(9).wrapText(true).set();
				
				ws.value(i, 5, sdf.format(downloadEbooksList.getDate()));
				ws.style(i++, 5).fontSize(9).wrapText(true).set();
				
	 		}
	 		wb.finish();
		} 
		else {
			
			response.sendRedirect("/home");
			}
		}
 		catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}
	
	@RequestMapping(value="/webinarsdownloadXL")
	public void webinarsdownloadXL(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try 
		{
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			
			if(accountMap != null) {
				
			List<WebinarContacts> webinarContactList = adminDAO.getWebinarContacts();
			request.setAttribute("webinars", webinarContactList);
	 		
	 		response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-Disposition", "attachment;filename=Teksands-Webinars-Contacts.xlsx");
			
			
			Workbook wb = new Workbook(response.getOutputStream(), "MyApplication", "1.0");
			Worksheet ws = wb.newWorksheet("Teksands Webinars Contacts Report");
			
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
									
			ws.value(0, 0, "Teksands Webinars Contacts");
			ws.range(0, 0, 0, 5).merge();
			ws.range(0, 0, 0, 5).style().horizontalAlignment("center").set();
			ws.style(0, 0).bold().fontSize(11).fontColor("0f76bd").set(); 

			int i = 1;
			int j = 0;
			for(j = 0; j <= 5; j++) {
				ws.style(i, j).bold().fontSize(9).borderStyle("bold").borderColor("0f76bd").wrapText(true).set();	
			}
			
			ws.value(i, 0, "Id");
	        ws.value(i, 1, "Name");
		    ws.value(i, 2, "Mobile");
		    ws.value(i, 3, "Email");
		    ws.value(i, 4, "Webinar Name");
		    ws.value(i++, 5, "Date");
		    		    
	 		for(WebinarContacts downloadWebinarsContactList : adminDAO.getWebinarContacts())
	 		{
	 			ws.value(i, 0, downloadWebinarsContactList.getId());
				ws.style(i, 0).fontSize(9).wrapText(true).set();
				
				ws.value(i, 1, downloadWebinarsContactList.getName());
				ws.style(i, 1).fontSize(9).wrapText(true).set();
				
				ws.value(i, 2, downloadWebinarsContactList.getMobile());
				ws.style(i, 2).fontSize(9).wrapText(true).set();
				
				ws.value(i, 3, downloadWebinarsContactList.getEmail());
				ws.style(i, 3).fontSize(9).wrapText(true).set();
				
				ws.value(i, 4, downloadWebinarsContactList.getWebinar_name());
				ws.style(i, 4).fontSize(9).wrapText(true).set();
				
				ws.value(i, 5, sdf.format(downloadWebinarsContactList.getDate()));
				ws.style(i++, 5).fontSize(9).wrapText(true).set();
				
	 		}
	 		wb.finish();
		} 
		else {
			
			response.sendRedirect("/home");
			}
		}
 		catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}
	
	@RequestMapping(value="/jobsContactsdownloadXL")
	public void jobsContactsdownloadXL(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try 
		{
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			
			if(accountMap != null) {
				
			List<JobsApplications> jobsApplications = adminDAO.getAllJobsApplication();
			request.setAttribute("jobsApplications", jobsApplications);
	 		
	 		response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-Disposition", "attachment;filename=Teksands-Jobs-Contacts.xlsx");
			
			
			Workbook wb = new Workbook(response.getOutputStream(), "MyApplication", "1.0");
			Worksheet ws = wb.newWorksheet("Teksands Jobs Contacts Report");
			
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
									
			ws.value(0, 0, "Teksands Jobs Contacts");
			ws.range(0, 0, 0, 9).merge();
			ws.range(0, 0, 0, 9).style().horizontalAlignment("center").set();
			ws.style(0, 0).bold().fontSize(11).fontColor("0f76bd").set(); 

			int i = 1;
			int j = 0;
			for(j = 0; j <= 9; j++) {
				ws.style(i, j).bold().fontSize(9).borderStyle("bold").borderColor("0f76bd").wrapText(true).set();	
			}
			
			ws.width(2, 30);
			ws.width(6, 20);
			ws.width(7, 20);
			ws.width(8, 20);
			
			ws.value(i, 0, "Id");
	        ws.value(i, 1, "Jobs id");
		    ws.value(i, 2, "Name");
		    ws.value(i, 3, "Mobile");
		    ws.value(i, 4, "Email");
		    ws.value(i, 5, "Date");
		    ws.value(i, 6, "Summary");
		    ws.value(i, 7, "Jobs Name");
		    ws.value(i, 8, "Technical Skills");
		    ws.value(i++, 9, "Year of Passing");
		    		    
	 		for(JobsApplications downloadJobsContactList : adminDAO.getAllJobsApplication())
	 		{
	 			ws.value(i, 0, downloadJobsContactList.getId());
				ws.style(i, 0).fontSize(9).wrapText(true).set();
				
				ws.value(i, 1, downloadJobsContactList.getJobs_id());
				ws.style(i, 1).fontSize(9).wrapText(true).set();
				
				ws.value(i, 2, downloadJobsContactList.getName());
				ws.style(i, 2).fontSize(9).wrapText(true).set();
				
				ws.value(i, 3, downloadJobsContactList.getMobile());
				ws.style(i, 3).fontSize(9).wrapText(true).set();
				
				ws.value(i, 4, downloadJobsContactList.getEmail());
				ws.style(i, 4).fontSize(9).wrapText(true).set();
				
				ws.value(i, 5, sdf.format(downloadJobsContactList.getDate()));
				ws.style(i, 5).fontSize(9).wrapText(true).set();
				
				ws.value(i, 6, downloadJobsContactList.getSummary());
				ws.style(i, 6).fontSize(9).wrapText(true).set();
				
				ws.value(i, 7, downloadJobsContactList.getJobs_name());
				ws.style(i, 7).fontSize(9).wrapText(true).set();
				
				ws.value(i, 8, downloadJobsContactList.getTechnical_skills());
				ws.style(i, 8).fontSize(9).wrapText(true).set();
				
				ws.value(i, 9, downloadJobsContactList.getYear_passing());
				ws.style(i++, 9).fontSize(9).wrapText(true).set();
				
	 		}
	 		wb.finish();
		} 
		else {
			
			response.sendRedirect("/home");
			}
		}
 		catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}
	
	@RequestMapping(value="/ebpCondidatesdownloadXL")
	public void ebpCondidatesdownloadXL(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try 
		{
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			
			if(accountMap != null) {
				
			List<EBPCandidate> ebpCandidateList = adminDAO.getAllEBPCandidate();
			request.setAttribute("ebpCandidateList", ebpCandidateList);
	 		
	 		response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-Disposition", "attachment;filename=Teksands-EBPCandidate.xlsx");
			
			
			Workbook wb = new Workbook(response.getOutputStream(), "MyApplication", "1.0");
			Worksheet ws = wb.newWorksheet("Teksands EBPCandidate Report");
			
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
									
			ws.value(0, 0, "Teksands EBPCandidates");
			ws.range(0, 0, 0, 5).merge();
			ws.range(0, 0, 0, 5).style().horizontalAlignment("center").set();
			ws.style(0, 0).bold().fontSize(11).fontColor("0f76bd").set(); 

			int i = 1;
			int j = 0;
			for(j = 0; j <= 19; j++) {
				ws.style(i, j).bold().fontSize(9).borderStyle("bold").borderColor("0f76bd").wrapText(true).set();	
			}
			
			ws.width(1, 30);
			ws.width(3, 25);
			ws.width(3, 25);
			ws.width(6, 30);
			ws.width(7, 30);
			ws.width(8, 30);
			ws.width(12, 30);
			ws.width(15, 30);
			ws.width(16, 30);
			ws.width(18, 40);
			ws.width(19, 30);
			
			ws.value(i, 0, "Id");
			ws.value(i, 1, "Name");
			ws.value(i, 2, "Mobile");
			ws.value(i, 3, "Email");
			ws.value(i, 4, "Date");
			ws.value(i, 5, "Gender");
			ws.value(i, 6, "Address 1");
			ws.value(i, 7, "Address 2");
			ws.value(i, 8, "City");
			ws.value(i, 9, "State");
			ws.value(i, 10, "Country");
			ws.value(i, 11, "Pincode");
			ws.value(i, 12, "College");
			ws.value(i, 13, "Year of Passing");
			ws.value(i, 14, "Qualification");
			ws.value(i, 15, "Position");
			ws.value(i, 16, "Core Skills");
			ws.value(i, 17, "Experience");
			ws.value(i, 18, "Description");
			ws.value(i++, 19, "LinkedIn URL");
		    		    
	 		for(EBPCandidate downloadEBPCandidateList : adminDAO.getAllEBPCandidate())
	 		{
	 			ws.value(i, 0, downloadEBPCandidateList.getId());
				ws.style(i, 0).fontSize(9).wrapText(true).set();

				ws.value(i, 1, downloadEBPCandidateList.getName());
				ws.style(i, 1).fontSize(9).wrapText(true).set();
				
				ws.value(i, 2, downloadEBPCandidateList.getMobile());
				ws.style(i, 2).fontSize(9).wrapText(true).set();
				
				ws.value(i, 3, downloadEBPCandidateList.getEmail());
				ws.style(i, 3).fontSize(9).wrapText(true).set();
				
				ws.value(i, 4, sdf.format(downloadEBPCandidateList.getDate()));
				ws.style(i, 4).fontSize(9).wrapText(true).set();
				
				ws.value(i, 5, downloadEBPCandidateList.getGender());
				ws.style(i, 5).fontSize(9).wrapText(true).set();
				
				ws.value(i, 6, downloadEBPCandidateList.getAddress1());
				ws.style(i, 6).fontSize(9).wrapText(true).set();
				
				ws.value(i, 7, downloadEBPCandidateList.getAddress2());
				ws.style(i, 7).fontSize(9).wrapText(true).set();
				
				ws.value(i, 8, downloadEBPCandidateList.getCity());
				ws.style(i, 8).fontSize(9).wrapText(true).set();
				
				ws.value(i, 9, downloadEBPCandidateList.getState());
				ws.style(i, 9).fontSize(9).wrapText(true).set();
				
				ws.value(i, 10, downloadEBPCandidateList.getCountry());
				ws.style(i, 10).fontSize(9).wrapText(true).set();
				
				ws.value(i, 11, downloadEBPCandidateList.getPincode());
				ws.style(i, 11).fontSize(9).wrapText(true).set();
				
				ws.value(i, 12, downloadEBPCandidateList.getCollege());
				ws.style(i, 12).fontSize(9).wrapText(true).set();
				
				ws.value(i, 13, downloadEBPCandidateList.getYear_passing());
				ws.style(i, 13).fontSize(9).wrapText(true).set();
				
				ws.value(i, 14, downloadEBPCandidateList.getQualification());
				ws.style(i, 14).fontSize(9).wrapText(true).set();
				
				ws.value(i, 15, downloadEBPCandidateList.getPosition());
				ws.style(i, 15).fontSize(9).wrapText(true).set();
				
				ws.value(i, 16, downloadEBPCandidateList.getCore_skills());
				ws.style(i, 16).fontSize(9).wrapText(true).set();
				
				ws.value(i, 17, downloadEBPCandidateList.getExperience());
				ws.style(i, 17).fontSize(9).wrapText(true).set();
				
				ws.value(i, 18, downloadEBPCandidateList.getDescription());
				ws.style(i, 18).fontSize(9).wrapText(true).set();
				
				ws.value(i, 19, downloadEBPCandidateList.getLinkedin_url());
				ws.style(i++, 19).fontSize(9).wrapText(true).set();
				
	 		}
	 		wb.finish();
		} 
		else {
			
			response.sendRedirect("/home");
			}
		}
 		catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}
	
	@RequestMapping(value="/ebpMentorsdownloadXL")
	public void ebpMentorsdownloadXL(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try 
		{
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			
			if(accountMap != null) {
				
			List<Mentors> mentorsList = adminDAO.getAllMentors();
			request.setAttribute("mentorsList", mentorsList);
	 		
	 		response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-Disposition", "attachment;filename=Teksands-EBP-Mentors.xlsx");
			
			
			Workbook wb = new Workbook(response.getOutputStream(), "MyApplication", "1.0");
			Worksheet ws = wb.newWorksheet("Teksands EBP Mentors Report");
			
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
									
			ws.value(0, 0, "Teksands EBP Mentors");
			ws.range(0, 0, 0, 5).merge();
			ws.range(0, 0, 0, 5).style().horizontalAlignment("center").set();
			ws.style(0, 0).bold().fontSize(11).fontColor("0f76bd").set(); 

			int i = 1;
			int j = 0;
			for(j = 0; j <= 15; j++) {
				ws.style(i, j).bold().fontSize(9).borderStyle("bold").borderColor("0f76bd").wrapText(true).set();	
			}
			
			ws.width(5, 30);
			ws.width(6, 30);
			ws.width(10, 50);
			ws.width(12, 50);
			ws.width(13, 50);
			ws.width(14, 30);
			
			ws.value(i, 0, "Id");
			ws.value(i, 1, "Name");
			ws.value(i, 2, "Mobile");
			ws.value(i, 3, "Email");
			ws.value(i, 4, "Gender");
			ws.value(i, 5, "Address 1");
			ws.value(i, 6, "Address 2");
			ws.value(i, 7, "City");
			ws.value(i, 8, "State");
			ws.value(i, 9, "Country");
			ws.value(i, 10, "Technologies");
			ws.value(i, 11, "Contribute");
			ws.value(i, 12, "Conntribute Description");
			ws.value(i, 13, "Tech Description");
			ws.value(i, 14, "LinkedIn URL");
			ws.value(i++, 15, "Date");
			
		    		    
	 		for(Mentors downloadEBPMentorsList : adminDAO.getAllMentors())
	 		{
	 			ws.value(i, 0, downloadEBPMentorsList.getId());
				ws.style(i, 0).fontSize(9).wrapText(true).set();

				ws.value(i, 1, downloadEBPMentorsList.getName());
				ws.style(i, 1).fontSize(9).wrapText(true).set();
				
				ws.value(i, 2, downloadEBPMentorsList.getMobile());
				ws.style(i, 2).fontSize(9).wrapText(true).set();
				
				ws.value(i, 3, downloadEBPMentorsList.getEmail());
				ws.style(i, 3).fontSize(9).wrapText(true).set();
				
				ws.value(i, 4, downloadEBPMentorsList.getGender());
				ws.style(i, 4).fontSize(9).wrapText(true).set();
				
				ws.value(i, 5, downloadEBPMentorsList.getAddress1());
				ws.style(i, 5).fontSize(9).wrapText(true).set();
				
				ws.value(i, 6, downloadEBPMentorsList.getAddress2());
				ws.style(i, 6).fontSize(9).wrapText(true).set();
				
				ws.value(i, 7, downloadEBPMentorsList.getCity());
				ws.style(i, 7).fontSize(9).wrapText(true).set();
				
				ws.value(i, 8, downloadEBPMentorsList.getState());
				ws.style(i, 8).fontSize(9).wrapText(true).set();
				
				ws.value(i, 9, downloadEBPMentorsList.getCountry());
				ws.style(i, 9).fontSize(9).wrapText(true).set();
				
				ws.value(i, 10, downloadEBPMentorsList.getTechnologies());
				ws.style(i, 10).fontSize(9).wrapText(true).set();
				
				ws.value(i, 11, downloadEBPMentorsList.getContribute());
				ws.style(i, 11).fontSize(9).wrapText(true).set();
				
				ws.value(i, 12, downloadEBPMentorsList.getCon_description());
				ws.style(i, 12).fontSize(9).wrapText(true).set();
				
				ws.value(i, 13, downloadEBPMentorsList.getTech_description());
				ws.style(i, 13).fontSize(9).wrapText(true).set();
				
				ws.value(i, 14, downloadEBPMentorsList.getLinkedin_url());
				ws.style(i, 14).fontSize(9).wrapText(true).set();
				
				ws.value(i, 15, sdf.format(downloadEBPMentorsList.getDate()));
				ws.style(i++, 15).fontSize(9).wrapText(true).set();
				
	 		}
	 		wb.finish();
		} 
		else {
			
			response.sendRedirect("/home");
			}
		}
 		catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}
	
	@RequestMapping(value="/ebpCorporatedownloadXL")
	public void ebpCorporatedownloadXL(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try 
		{
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			
			if(accountMap != null) {
				
			List<CorporateEnquiry> corporateEnquiryList = adminDAO.getAllCorporateEnquiry();
			request.setAttribute("corporateEnquiryList", corporateEnquiryList);
	 		
	 		response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-Disposition", "attachment;filename=Teksands-EBP-Corporate-Enquiry.xlsx");
			
			
			Workbook wb = new Workbook(response.getOutputStream(), "MyApplication", "1.0");
			Worksheet ws = wb.newWorksheet("Teksands EBP Corporate Enquiry");
			
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
									
			ws.value(0, 0, "Teksands EBP Corporate Enquiry");
			ws.range(0, 0, 0, 5).merge();
			ws.range(0, 0, 0, 5).style().horizontalAlignment("center").set();
			ws.style(0, 0).bold().fontSize(11).fontColor("0f76bd").set(); 

			int i = 1;
			int j = 0;
			for(j = 0; j <= 15; j++) {
				ws.style(i, j).bold().fontSize(9).borderStyle("bold").borderColor("0f76bd").wrapText(true).set();	
			}
			
			ws.value(i, 0, "Id");
			ws.value(i, 1, "Name");
			ws.value(i, 2, "Company");
			ws.value(i, 3, "Email");
			ws.value(i, 4, "Mobile");
			ws.value(i, 5, "Requirements");
			ws.value(i, 6, "Date");
					    
	 		for(CorporateEnquiry downloadcorporateEnquiryList : adminDAO.getAllCorporateEnquiry())
	 		{
	 			ws.value(i, 0, downloadcorporateEnquiryList.getId());
				ws.style(i, 0).fontSize(9).wrapText(true).set();

				ws.value(i, 1, downloadcorporateEnquiryList.getName());
				ws.style(i, 1).fontSize(9).wrapText(true).set();
				
				ws.value(i, 2, downloadcorporateEnquiryList.getCompany());
				ws.style(i, 2).fontSize(9).wrapText(true).set();
				
				ws.value(i, 3, downloadcorporateEnquiryList.getMobile());
				ws.style(i, 3).fontSize(9).wrapText(true).set();
				
				ws.value(i, 4, downloadcorporateEnquiryList.getEmail());
				ws.style(i, 4).fontSize(9).wrapText(true).set();
				
				ws.value(i, 5, downloadcorporateEnquiryList.getRequirements());
				ws.style(i, 5).fontSize(9).wrapText(true).set();
				
				ws.value(i, 6, sdf.format(downloadcorporateEnquiryList.getDate()));
				ws.style(i++, 6).fontSize(9).wrapText(true).set();
				
	 		}
	 		wb.finish();
		} 
		else {
			
			response.sendRedirect("/home");
			}
		}
 		catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}
	
	@RequestMapping(value="/itStaffingDownloadXL")
	public void itStaffingDownloadXL(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try 
		{
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			
			if(accountMap != null) {
				
			List<ItStaffing> itStaffingList = adminDAO.getAllITStaffing();
			request.setAttribute("itStaffingList", itStaffingList);
	 		
	 		response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-Disposition", "attachment;filename=Teksands-IT-Staffing.xlsx");
			
			
			Workbook wb = new Workbook(response.getOutputStream(), "MyApplication", "1.0");
			Worksheet ws = wb.newWorksheet("Teksands IT Staffing");
			
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
									
			ws.value(0, 0, "Teksands IT Staffing");
			ws.range(0, 0, 0, 6).merge();
			ws.range(0, 0, 0, 6).style().horizontalAlignment("center").set();
			ws.style(0, 0).bold().fontSize(11).set(); 

			int i = 1;
			int j = 0;
			for(j = 0; j <= 6; j++) {
				ws.style(i, j).bold().fontSize(9).borderStyle("bold").borderColor("0f76bd").wrapText(true).set();	
			}
			
			ws.value(i, 0, "Id");
	        ws.value(i, 1, "Name");
		    ws.value(i, 2, "Email");
		    ws.value(i, 3, "Mobile");
		    ws.value(i, 4, "Company Name");
		    ws.value(i, 5, "Requirement");
		    ws.value(i++, 6, "Submitted Date");

	 		for(ItStaffing itStaffing : itStaffingList)
	 		{
	 			ws.value(i, 0, itStaffing.getId());
				ws.style(i, 0).fontSize(9).wrapText(true).set();
				
				ws.value(i, 1, itStaffing.getName());
				ws.style(i, 1).fontSize(9).wrapText(true).set();
				
				ws.value(i, 2, itStaffing.getEmail());
				ws.style(i, 2).fontSize(9).wrapText(true).set();
				
				ws.value(i, 3, itStaffing.getMobile());
				ws.style(i, 3).fontSize(9).wrapText(true).set();
				
				ws.value(i, 4, itStaffing.getCompany_name());
				ws.style(i, 4).fontSize(9).wrapText(true).set();
				
				ws.value(i, 5, itStaffing.getRequirement());
				ws.style(i, 5).fontSize(9).wrapText(true).set();
				
				ws.value(i, 6, sdf.format(itStaffing.getCreated_date()));
				ws.style(i++, 6).fontSize(9).wrapText(true).set();
				
	 		}
	 		wb.finish();
		} 
		else {
			
			response.sendRedirect("/home");
			}
		}
 		catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}
	
	@RequestMapping(value="/ebpLeadsDownloadXL")
	public void ebpLeadsDownloadXL(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try 
		{
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			
			if(accountMap != null) 
			{
				
				List<EbpEmails> ebpEmailsList = adminDAO.getAllEbpEmails();
				request.setAttribute("ebpEmailsList", ebpEmailsList);
		 		
		 		response.setContentType("application/vnd.ms-excel");
				response.setHeader("Content-Disposition", "attachment;filename=Teksands-EBP-Leads.xlsx");
				
				
				Workbook wb = new Workbook(response.getOutputStream(), "MyApplication", "1.0");
				Worksheet ws = wb.newWorksheet("Teksands EBP Leads");
				
				SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
										
				ws.value(0, 0, "Teksands EBP Leads");
				ws.range(0, 0, 0, 6).merge();
				ws.range(0, 0, 0, 6).style().horizontalAlignment("center").set();
				ws.style(0, 0).bold().fontSize(11).set(); 
	
				int i = 1;
				int j = 0;
				for(j = 0; j <= 6; j++) 
				{
					ws.style(i, j).bold().fontSize(9).borderStyle("bold").borderColor("0f76bd").wrapText(true).set();	
				}
				
				ws.value(i, 0, "Id");
		        ws.value(i, 1, "Name");
			    ws.value(i, 2, "Email");
			    ws.value(i, 3, "Mobile");
			    ws.value(i, 4, "Company Name");
			    ws.value(i++, 5, "Submitted Date");
	
		 		for(EbpEmails ebpEmails : ebpEmailsList)
		 		{
		 			ws.value(i, 0, ebpEmails.getId());
					ws.style(i, 0).fontSize(9).wrapText(true).set();
					
					ws.value(i, 1, ebpEmails.getName());
					ws.style(i, 1).fontSize(9).wrapText(true).set();
					
					ws.value(i, 2, ebpEmails.getEmail());
					ws.style(i, 2).fontSize(9).wrapText(true).set();
					
					ws.value(i, 3, ebpEmails.getMobile());
					ws.style(i, 3).fontSize(9).wrapText(true).set();
					
					ws.value(i, 4, ebpEmails.getCompany());
					ws.style(i, 4).fontSize(9).wrapText(true).set();
						
					if(ebpEmails.getDate() != null)
					{
						ws.value(i, 5, sdf.format(ebpEmails.getDate()));
						ws.style(i++, 5).fontSize(9).wrapText(true).set();
					}else {
						ws.value(i, 5, sdf.format("-"));
						ws.style(i++, 5).fontSize(9).wrapText(true).set();
					}
		 		}
		 		wb.finish();
		} 
		else {
			
			response.sendRedirect("/home");
			}
		}
 		catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}
}
