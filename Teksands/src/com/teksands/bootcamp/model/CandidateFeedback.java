package com.teksands.bootcamp.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "cms_candidate_feedback")
public class CandidateFeedback {
	
	private Integer id;
	private Integer candidate_id;
	private String candidate_name;
	private Integer mentor_id;
	private String mentor_name;
	private String interview_type;
	private Integer ts_grade;
	private String feedback;
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
	public Integer getMentor_id() {
		return mentor_id;
	}
	public void setMentor_id(Integer mentor_id) {
		this.mentor_id = mentor_id;
	}
	public String getMentor_name() {
		return mentor_name;
	}
	public void setMentor_name(String mentor_name) {
		this.mentor_name = mentor_name;
	}
	public String getInterview_type() {
		return interview_type;
	}
	public void setInterview_type(String interview_type) {
		this.interview_type = interview_type;
	}
	public Integer getTs_grade() {
		return ts_grade;
	}
	public void setTs_grade(Integer ts_grade) {
		this.ts_grade = ts_grade;
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
	public String getFeedback() {
		return feedback;
	}
	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}
}
