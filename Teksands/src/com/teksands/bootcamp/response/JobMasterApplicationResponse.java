package com.teksands.bootcamp.response;

import java.util.Date;

public class JobMasterApplicationResponse {
	private Integer id;	
	private String position;
	private String company_name;
	private Date date_of_posted;
	private String min_salary_range;
	private String max_salary_range;
	private String experience;	
	private String skills_required;	
	private String location;
	private String total_vacancy;
	private String no_of_applied;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public Date getDate_of_posted() {
		return date_of_posted;
	}
	public void setDate_of_posted(Date date_of_posted) {
		this.date_of_posted = date_of_posted;
	}
	public String getMin_salary_range() {
		return min_salary_range;
	}
	public void setMin_salary_range(String min_salary_range) {
		this.min_salary_range = min_salary_range;
	}
	public String getMax_salary_range() {
		return max_salary_range;
	}
	public void setMax_salary_range(String max_salary_range) {
		this.max_salary_range = max_salary_range;
	}
	public String getExperience() {
		return experience;
	}
	public void setExperience(String experience) {
		this.experience = experience;
	}
	public String getSkills_required() {
		return skills_required;
	}
	public void setSkills_required(String skills_required) {
		this.skills_required = skills_required;
	}
	public String getTotal_vacancy() {
		return total_vacancy;
	}
	public void setTotal_vacancy(String total_vacancy) {
		this.total_vacancy = total_vacancy;
	}
	public String getNo_of_applied() {
		return no_of_applied;
	}
	public void setNo_of_applied(String no_of_applied) {
		this.no_of_applied = no_of_applied;
	}
	public String getCompany_name() {
		return company_name;
	}
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}			
}
