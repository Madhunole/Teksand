package com.teksands.bootcamp.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "cms_call_schedule")
public class CallSchedule {
	private Integer id;
	private Integer candidate_id;
	private String candidate_name;
	private String call_time;
	private Date call_date;
	private String call_reason;
	private Boolean mail_status;
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
	public String getCall_time() {
		return call_time;
	}
	public void setCall_time(String call_time) {
		this.call_time = call_time;
	}
	public Date getCall_date() {
		return call_date;
	}
	public void setCall_date(Date call_date) {
		this.call_date = call_date;
	}
	public String getCall_reason() {
		return call_reason;
	}
	public void setCall_reason(String call_reason) {
		this.call_reason = call_reason;
	}
	public Boolean getMail_status() {
		return mail_status;
	}
	public void setMail_status(Boolean mail_status) {
		this.mail_status = mail_status;
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
