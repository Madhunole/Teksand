package com.teksands.bootcamp.controller;

import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.teksands.bootcamp.dao.LogDAO;
import com.teksands.bootcamp.model.Bootcamp;
import com.teksands.bootcamp.model.Log;
import com.teksands.utils.Utils;

@Controller
@RequestMapping("/bootcamp")
public class LogController {
	
	@Autowired
	LogDAO logDAO;
	
	@RequestMapping({"/log" })
	public String bootcamp_list(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HashMap<String, String> accountMap = null;
		try
		{	
			accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
			if(accountMap != null && (accountMap.get("user_id").equalsIgnoreCase(Utils.adminId.toString()))) {
				
				List<Log> logList = logDAO.getAllLog();
				request.setAttribute("logList", logList);
				
				request.setAttribute("page", "log");
				
			}
			else {
				response.sendRedirect("/bootcamp");
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "bootcamp.list.log";
	}

}
