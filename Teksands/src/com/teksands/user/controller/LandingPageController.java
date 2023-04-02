package com.teksands.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller

@RequestMapping("/courses")

public class LandingPageController
{		
	@RequestMapping("/data-structure-predictive-analysis")
	public String data_structure(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		try
		{	
			
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "landing.data.structure";
	}
	@RequestMapping("/machine-learning-mastery")
	public String machine_learning(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		try
		{	
			
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "landing.machine.learning";
	}
	@RequestMapping("/dev-ops")
	public String dev_ops(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		try
		{	
			
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "landing.devops";
	}
	@RequestMapping("/pgp-data-science")
	public String Deep_Learning(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		try
		{	
			
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "landing.Deep.Learning";
	}
	@RequestMapping("/deep-learning-and-cnn-for-image-processing")
	public String cnn_image_processing(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		try
		{	
			
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "landing.CNN.Processing";
	}
	
	@RequestMapping("/recorder")
	public String recorder(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		try
		{	
			
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "land.recorder";
	}
}
