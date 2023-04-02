package com.teksands.bootcamp.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "tk_test")
public class Test {
	private Integer test_id;
	private String test_name;
	private String test_description;
	private String test_topic_1;
	private String test_topic_2;
	private String test_topic_3;
	private String auth_code;
	private String test_link;
	private Date created_date;
	private String test_time;
	private Boolean active;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "test_id")
	public Integer getTest_id() {
		return test_id;
	}
	public void setTest_id(Integer test_id) {
		this.test_id = test_id;
	}
	public String getTest_name() {
		return test_name;
	}
	public void setTest_name(String test_name) {
		this.test_name = test_name;
	}
	public String getTest_description() {
		return test_description;
	}
	public void setTest_description(String test_description) {
		this.test_description = test_description;
	}	
	public String getTest_topic_1() {
		return test_topic_1;
	}
	public void setTest_topic_1(String test_topic_1) {
		this.test_topic_1 = test_topic_1;
	}
	public String getTest_topic_2() {
		return test_topic_2;
	}
	public void setTest_topic_2(String test_topic_2) {
		this.test_topic_2 = test_topic_2;
	}
	public String getTest_topic_3() {
		return test_topic_3;
	}
	public void setTest_topic_3(String test_topic_3) {
		this.test_topic_3 = test_topic_3;
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
	public String getAuth_code() {
		return auth_code;
	}
	public void setAuth_code(String auth_code) {
		this.auth_code = auth_code;
	}
	public String getTest_link() {
		return test_link;
	}
	public void setTest_link(String test_link) {
		this.test_link = test_link;
	}
	public String getTest_time() {
		return test_time;
	}
	public void setTest_time(String test_time) {
		this.test_time = test_time;
	}		
}
