package com.teksands.bootcamp.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "cms_bootcamp")
public class Bootcamp {

	private Integer id;
	private Integer mentor_id;
	private String mentor_name;
	private String name;
	private String technologies;
	private String role;
	private String requirements_summary;
	private String program_manager;
	private String client_company;
	private String client_manager;
	private String exp_start_range;
	private String exp_end_range;
	private Date start_date;
	private Date end_date;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTechnologies() {
		return technologies;
	}
	public void setTechnologies(String technologies) {
		this.technologies = technologies;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getRequirements_summary() {
		return requirements_summary;
	}
	public void setRequirements_summary(String requirements_summary) {
		this.requirements_summary = requirements_summary;
	}
	public String getProgram_manager() {
		return program_manager;
	}
	public void setProgram_manager(String program_manager) {
		this.program_manager = program_manager;
	}
	public String getClient_company() {
		return client_company;
	}
	public void setClient_company(String client_company) {
		this.client_company = client_company;
	}
	public String getClient_manager() {
		return client_manager;
	}
	public void setClient_manager(String client_manager) {
		this.client_manager = client_manager;
	}
	public String getExp_start_range() {
		return exp_start_range;
	}
	public void setExp_start_range(String exp_start_range) {
		this.exp_start_range = exp_start_range;
	}
	public String getExp_end_range() {
		return exp_end_range;
	}
	public void setExp_end_range(String exp_end_range) {
		this.exp_end_range = exp_end_range;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	public Boolean getActive() {
		return active;
	}
	public void setActive(Boolean active) {
		this.active = active;
	}
	public Date getCreated_date() {
		return created_date;
	}
	public void setCreated_date(Date created_date) {
		this.created_date = created_date;
	}
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
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
}
