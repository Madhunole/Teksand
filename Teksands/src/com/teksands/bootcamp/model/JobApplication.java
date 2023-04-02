package com.teksands.bootcamp.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "cms_jobs_application")
public class JobApplication {

	private Integer id;
	private Integer candidate_id;
	private Integer job_id;
	private String candidate_name;
	private String candidate_email;
	private String candidate_mobile;
	private String job_title;
	private Date applied_date;
	private Boolean active;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id")
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getCandidate_id() {
		return candidate_id;
	}
	public void setCandidate_id(Integer candidate_id) {
		this.candidate_id = candidate_id;
	}
	public Integer getJob_id() {
		return job_id;
	}
	public void setJob_id(Integer job_id) {
		this.job_id = job_id;
	}
	public String getCandidate_name() {
		return candidate_name;
	}
	public void setCandidate_name(String candidate_name) {
		this.candidate_name = candidate_name;
	}
	public String getJob_title() {
		return job_title;
	}
	public void setJob_title(String job_title) {
		this.job_title = job_title;
	}
	public Date getApplied_date() {
		return applied_date;
	}
	public void setApplied_date(Date applied_date) {
		this.applied_date = applied_date;
	}
	public Boolean getActive() {
		return active;
	}
	public void setActive(Boolean active) {
		this.active = active;
	}
	public String getCandidate_email() {
		return candidate_email;
	}
	public void setCandidate_email(String candidate_email) {
		this.candidate_email = candidate_email;
	}
	public String getCandidate_mobile() {
		return candidate_mobile;
	}
	public void setCandidate_mobile(String candidate_mobile) {
		this.candidate_mobile = candidate_mobile;
	}
}
