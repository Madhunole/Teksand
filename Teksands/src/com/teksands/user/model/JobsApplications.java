package com.teksands.user.model;

import java.time.Year;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "jobs_applications")
public class JobsApplications {
	
	private Integer id;
	private Integer jobs_id;
	private String name;
	private String mobile;
	private String email;
	private Date date;
	private String summary;
	private String resume;
	private String jobs_name;
	private String technical_skills;
	private String year_passing;
	
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id")
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getJobs_id() {
		return jobs_id;
	}
	public void setJobs_id(Integer jobs_id) {
		this.jobs_id = jobs_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getResume() {
		return resume;
	}
	public void setResume(String resume) {
		this.resume = resume;
	}
	public String getJobs_name() {
		return jobs_name;
	}
	public void setJobs_name(String jobs_name) {
		this.jobs_name = jobs_name;
	}
	public String getTechnical_skills() {
		return technical_skills;
	}
	public void setTechnical_skills(String technical_skills) {
		this.technical_skills = technical_skills;
	}
	public String getYear_passing() {
		return year_passing;
	}
	public void setYear_passing(String year_passing) {
		this.year_passing = year_passing;
	}
}
