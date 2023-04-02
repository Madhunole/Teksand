package com.teksands.user.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.teksands.user.dao.CommonDAO;
import com.teksands.user.dao.EbooksDAO;
import com.teksands.user.model.Contactus;
import com.teksands.user.model.Ebooks;
import com.teksands.user.model.EbooksDownload;
import com.teksands.user.model.Internship;
import com.teksands.user.model.Leads;
import com.teksands.user.response.CommonResponse;
import com.teksands.utils.Properties;
import com.teksands.utils.SendEmailUtil;

@Controller
public class EbooksController {
	
	@Autowired
	EbooksDAO ebooksDAO;
	
	@Autowired
	CommonDAO commonDAO;
	
	@Autowired
	SendEmailUtil sendEmailUtil;
	
	@Autowired
	Properties properties;
	
	@RequestMapping(value="/e-books")
	public String ebooks(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		try
		{			
			String pageid = request.getParameter("pageid");
			if(pageid == null){pageid = "1";}
			request.setAttribute("pageid", pageid);
            int page_id = Integer.parseInt(pageid);
			
			List<Ebooks> ebookList = ebooksDAO.getAllEbooksByPageId(page_id - 1);
			request.setAttribute("ebookList", ebookList);
			
			request.setAttribute("page", "ebooks");
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "user.ebooks";
	}
	@RequestMapping(value="/saveEbooks")
	public void saveEbooks(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		CommonResponse commonResponse = null;
		Gson gson = null;	
		try 
   		{
			commonResponse = new CommonResponse();
    		gson = new Gson();	
    		
    		String ebookId = request.getParameter("ebookId");
    		String name = request.getParameter("name");
    		String mobile = request.getParameter("mobile");
    		String email = request.getParameter("email");
    		
    		if(ebookId == null) {ebookId = "";}
    		
    		Ebooks ebooks = null;
    		
    		if(!ebookId.isEmpty()) {
    			ebooks = ebooksDAO.getEbooksbyId(Integer.parseInt(ebookId));
    		}
    		
    		//String pathName = request.getServletContext().getRealPath("") + "resources" + File.separator + "ebooks-pdf" + File.separator + ebooks.getFile_name();
    		
    		String domain = properties.getHostDomainUrl();
    		String path = "resources/ebooks-pdf/";
    		String pdfPath = domain+path+ebooks.getFile_name();
    		
    		sendEmailUtil.sendEbooks(name, email , "Please find attached the eBook you have requested. Teksands is glad to be of assistance.", "Teksands - Ebooks", pdfPath);
    		
    		EbooksDownload ebooksDownload = new EbooksDownload();
    		ebooksDownload.setName(name);
    		ebooksDownload.setMobile(mobile);
    		ebooksDownload.setEmail(email);
    		ebooksDownload.setDate(new Date());
    		ebooksDownload.setDownload_file(ebooks.getFile_name());
    		
    		boolean result = ebooksDAO.saveEbooksContacts(ebooksDownload);
    		
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
}
