package com.teksands.bootcamp.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "tk_test_result")
public class TkTestResults {
	
	private Integer id;
	private Integer test_id;
	private Integer user_id;
	private String user_name;
	private String user_email;
	private String user_mobile;
	private Integer total_marks;
	private Integer marks_scored;
	private String percentage;	
	private Integer total_no_mcq_questions;
	private Integer no_of_mcq_qus_attempt;
	private Integer no_of_mcq_answer_correct;
	private Integer no_of_mcq_answer_incorrect;
	private String test_start_time;
	private String test_end_time;
	private String feedback;	
	private Date submitted_date;
	private String result;
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
	public Integer getTest_id() {
		return test_id;
	}
	public void setTest_id(Integer test_id) {
		this.test_id = test_id;
	}
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_mobile() {
		return user_mobile;
	}
	public void setUser_mobile(String user_mobile) {
		this.user_mobile = user_mobile;
	}
	public Integer getTotal_marks() {
		return total_marks;
	}
	public void setTotal_marks(Integer total_marks) {
		this.total_marks = total_marks;
	}
	public Integer getMarks_scored() {
		return marks_scored;
	}
	public void setMarks_scored(Integer marks_scored) {
		this.marks_scored = marks_scored;
	}
	
	public String getPercentage() {
		return percentage;
	}
	public void setPercentage(String percentage) {
		this.percentage = percentage;
	}
	public Integer getTotal_no_mcq_questions() {
		return total_no_mcq_questions;
	}
	public void setTotal_no_mcq_questions(Integer total_no_mcq_questions) {
		this.total_no_mcq_questions = total_no_mcq_questions;
	}
	public Integer getNo_of_mcq_qus_attempt() {
		return no_of_mcq_qus_attempt;
	}
	public void setNo_of_mcq_qus_attempt(Integer no_of_mcq_qus_attempt) {
		this.no_of_mcq_qus_attempt = no_of_mcq_qus_attempt;
	}
	public Integer getNo_of_mcq_answer_correct() {
		return no_of_mcq_answer_correct;
	}
	public void setNo_of_mcq_answer_correct(Integer no_of_mcq_answer_correct) {
		this.no_of_mcq_answer_correct = no_of_mcq_answer_correct;
	}
	public Integer getNo_of_mcq_answer_incorrect() {
		return no_of_mcq_answer_incorrect;
	}
	public void setNo_of_mcq_answer_incorrect(Integer no_of_mcq_answer_incorrect) {
		this.no_of_mcq_answer_incorrect = no_of_mcq_answer_incorrect;
	}
	public String getTest_start_time() {
		return test_start_time;
	}
	public void setTest_start_time(String test_start_time) {
		this.test_start_time = test_start_time;
	}
	public String getTest_end_time() {
		return test_end_time;
	}
	public void setTest_end_time(String test_end_time) {
		this.test_end_time = test_end_time;
	}
	public String getFeedback() {
		return feedback;
	}
	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}
	public Date getSubmitted_date() {
		return submitted_date;
	}
	public void setSubmitted_date(Date submitted_date) {
		this.submitted_date = submitted_date;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public Boolean getActive() {
		return active;
	}
	public void setActive(Boolean active) {
		this.active = active;
	}	
}
