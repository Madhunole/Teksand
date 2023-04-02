package com.teksands.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RedirectController {
	
	
	@RequestMapping("/article/sample-article-test")
	public void redirect_sample_article_test(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		response.setHeader("Location", "/error");
		response.setStatus(302);
	}
	
	@RequestMapping("/careers")
	public void redirect_career(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		response.setHeader("Location", "/error");
		response.setStatus(302);
	}
	
	@RequestMapping("/category/uncategorized")
	public void redirect_uncategorized(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		response.setHeader("Location", "/error");
		response.setStatus(302);
	}
	
	@RequestMapping("/courses/random-forest-3")
	public void redirect_random_forest_3(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		response.setHeader("Location", "/error");
		response.setStatus(302);
	}
	
	@RequestMapping("/error-metrics")
	public void redirect_error_metrics(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		response.setHeader("Location", "/error");
		response.setStatus(302);
	}
	
	@RequestMapping("/evolution-of-design-of-artificial-neuron")
	public void redirect_evolution_design(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		response.setHeader("Location", "/error");
		response.setStatus(302);
	}
	
	@RequestMapping("/eye-for-blind")
	public void redirect_eye_blind(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		response.setHeader("Location", "/error");
		response.setStatus(302);
	}
	
	@RequestMapping("/introduction-to-capsule-networks")
	public void redirect_capsule_networks(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		response.setHeader("Location", "/error");
		response.setStatus(302);
	}
	
	@RequestMapping("/introduction-to-quantum-computing-for-ml")
	public void redirect_quantum_computing(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		response.setHeader("Location", "/error");
		response.setStatus(302);
	}
	
	@RequestMapping("/journey-through-libraries-of-python")
	public void redirect_libraries_python(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		response.setHeader("Location", "/error");
		response.setStatus(302);
	}
	
	@RequestMapping("/my-account/lost-password")
	public void lost_password(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		response.setHeader("Location", "/error");
		response.setStatus(302);
	}
	
	@RequestMapping("/optimizers-in-deep-learning")
	public void redirect_deep_learning(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		response.setHeader("Location", "/error");
		response.setStatus(302);
	}
	
	@RequestMapping("/recurrent-neural-networks")
	public void redirect_neural_networks(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		response.setHeader("Location", "/error");
		response.setStatus(302);
	}
	
	@RequestMapping("/regularization-tec")
	public void redirect_regularization(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		response.setHeader("Location", "/error");
		response.setStatus(302);
	}
	
	@RequestMapping("/robots.txt")
	public void redirect_robots_txt(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		response.setHeader("Location", "/error");
		response.setStatus(302);
	}
	
	@RequestMapping("/semi-supervised-learning")
	public void redirect_supervised_learning(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		response.setHeader("Location", "/error");
		response.setStatus(302);
	}
	
	@RequestMapping("/sitemap.xml")
	public void redirect_sitemap_xml(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		response.setHeader("Location", "/error");
		response.setStatus(302);
	}
	
	@RequestMapping("/technology/artificial-intelligence")
	public void redirect_artificial_intelligence(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		response.setHeader("Location", "/error");
		response.setStatus(302);
	}
	
	@RequestMapping("/technology/data-science")
	public void redirect_data_science(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		response.setHeader("Location", "/error");
		response.setStatus(302);
	}
	
	@RequestMapping("/technology/python")
	public void redirect_python(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		response.setHeader("Location", "/error");
		response.setStatus(302);
	}
}
