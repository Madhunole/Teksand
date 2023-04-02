package com.teksands.bootcamp.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "cms_test_results")
public class TestResults {
	
	private Integer id;
	private Integer candidate_id;
	private String candidate_name;
	private String test_name;
	private String test_topic;
	private Integer total_marks;
	private Integer marks_scores;
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
	public String getTest_name() {
		return test_name;
	}
	public void setTest_name(String test_name) {
		this.test_name = test_name;
	}
	public String getTest_topic() {
		return test_topic;
	}
	public void setTest_topic(String test_topic) {
		this.test_topic = test_topic;
	}
	public Integer getTotal_marks() {
		return total_marks;
	}
	public void setTotal_marks(Integer total_marks) {
		this.total_marks = total_marks;
	}
	public Integer getMarks_scores() {
		return marks_scores;
	}
	public void setMarks_scores(Integer marks_scores) {
		this.marks_scores = marks_scores;
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
}
