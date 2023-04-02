package com.teksands.user.response;

import java.util.Date;

public class CandidateandJobResponse {

	private Integer id;
	private Integer job_id;
	private String name;
	private String email;
	private String mobile;
	private String total_experience;
	private String key_skills;
	private String resume;
	private Date created_date;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getJob_id() {
		return job_id;
	}
	public void setJob_id(Integer job_id) {
		this.job_id = job_id;
	}	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getTotal_experience() {
		return total_experience;
	}
	public void setTotal_experience(String total_experience) {
		this.total_experience = total_experience;
	}
	public String getKey_skills() {
		return key_skills;
	}
	public void setKey_skills(String key_skills) {
		this.key_skills = key_skills;
	}
	public String getResume() {
		return resume;
	}
	public void setResume(String resume) {
		this.resume = resume;
	}
	public Date getCreated_date() {
		return created_date;
	}
	public void setCreated_date(Date created_date) {
		this.created_date = created_date;
	}
}
