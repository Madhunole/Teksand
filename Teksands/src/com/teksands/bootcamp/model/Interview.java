package com.teksands.bootcamp.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "cms_interview")
public class Interview {
	private Integer id;
	private Integer bootcamp_id;
	private String bootcamp_name;
	private Integer candidate_id;
	private String candidate_name;
	private Integer company_id;
	private String company_name;
	private String interviewer_name;
	private String interview_feedback;
	private String interview_type;
	private Date interview_date;
	private Date created_date;
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
	public Integer getBootcamp_id() {
		return bootcamp_id;
	}
	public void setBootcamp_id(Integer bootcamp_id) {
		this.bootcamp_id = bootcamp_id;
	}
	public String getBootcamp_name() {
		return bootcamp_name;
	}
	public void setBootcamp_name(String bootcamp_name) {
		this.bootcamp_name = bootcamp_name;
	}
	public Integer getCandidate_id() {
		return candidate_id;
	}
	public void setCandidate_id(Integer candidate_id) {
		this.candidate_id = candidate_id;
	}
	public String getCandidate_name() {
		return candidate_name;
	}
	public void setCandidate_name(String candidate_name) {
		this.candidate_name = candidate_name;
	}
	public String getInterview_feedback() {
		return interview_feedback;
	}
	public void setInterview_feedback(String interview_feedback) {
		this.interview_feedback = interview_feedback;
	}
	public Date getInterview_date() {
		return interview_date;
	}
	public void setInterview_date(Date interview_date) {
		this.interview_date = interview_date;
	}
	public Date getCreated_date() {
		return created_date;
	}
	public void setCreated_date(Date created_date) {
		this.created_date = created_date;
	}
	public Boolean getActive() {
		return active;
	}
	public void setActive(Boolean active) {
		this.active = active;
	}
	public String getInterviewer_name() {
		return interviewer_name;
	}
	public void setInterviewer_name(String interviewer_name) {
		this.interviewer_name = interviewer_name;
	}
	public Integer getCompany_id() {
		return company_id;
	}
	public void setCompany_id(Integer company_id) {
		this.company_id = company_id;
	}
	public String getCompany_name() {
		return company_name;
	}
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}
	public String getInterview_type() {
		return interview_type;
	}
	public void setInterview_type(String interview_type) {
		this.interview_type = interview_type;
	}
}
