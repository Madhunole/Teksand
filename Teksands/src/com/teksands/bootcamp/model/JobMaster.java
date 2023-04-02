package com.teksands.bootcamp.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "cms_jobs_master")
public class JobMaster {
	
	private Integer id;
	private Integer brand_id;
	private String client_id;
	private Date date;	
	private String role_name;
	private String jobs_url;
	private String total_vacancy;
	private String position;
	private String experience;
	private String min_exp;
	private String max_exp;
	private String min_salary_range;
	private String max_salary_range;
	private String skills_required;
	private String location;
	private String qualification;
	private String short_description;
	private String image;
	private String skills_competencies;
	private String job_responsibilities;
	private String industry;
	private String category;
	private String tags;
	private String company_name;
	private String company_logo;
	private String company_about;
	private String company_website;
	private String company_address;
	private String contact_person;
	private String contact_email;
	private String contact_mobile;
	private String emp_type;
	private String domain;
	private String job_mode;
	private String meta_title;
	private String meta_desc;
	private String meta_keywords;
	private Boolean active;
	private Date inactive_date;
	private Date date_of_posted;
	private String auth_code;
	
	@Transient
	private Integer applicationCount;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id")
	
	public Integer getId() {
		return id;
	}
	public Integer getBrand_id() {
		return brand_id;
	}
	public void setBrand_id(Integer brand_id) {
		this.brand_id = brand_id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getRole_name() {
		return role_name;
	}
	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}
	public String getJobs_url() {
		return jobs_url;
	}
	public void setJobs_url(String jobs_url) {
		this.jobs_url = jobs_url;
	}
	public String getTotal_vacancy() {
		return total_vacancy;
	}
	public void setTotal_vacancy(String total_vacancy) {
		this.total_vacancy = total_vacancy;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getExperience() {
		return experience;
	}
	public void setExperience(String experience) {
		this.experience = experience;
	}
	public String getMin_salary_range() {
		return min_salary_range;
	}
	public void setMin_salary_range(String min_salary_range) {
		this.min_salary_range = min_salary_range;
	}
	public String getMax_salary_range() {
		return max_salary_range;
	}
	public void setMax_salary_range(String max_salary_range) {
		this.max_salary_range = max_salary_range;
	}
	public String getSkills_required() {
		return skills_required;
	}
	public void setSkills_required(String skills_required) {
		this.skills_required = skills_required;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getQualification() {
		return qualification;
	}
	public void setQualification(String qualification) {
		this.qualification = qualification;
	}
	public String getShort_description() {
		return short_description;
	}
	public void setShort_description(String short_description) {
		this.short_description = short_description;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getSkills_competencies() {
		return skills_competencies;
	}
	public void setSkills_competencies(String skills_competencies) {
		this.skills_competencies = skills_competencies;
	}
	public String getJob_responsibilities() {
		return job_responsibilities;
	}
	public void setJob_responsibilities(String job_responsibilities) {
		this.job_responsibilities = job_responsibilities;
	}
	public String getIndustry() {
		return industry;
	}
	public void setIndustry(String industry) {
		this.industry = industry;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getTags() {
		return tags;
	}
	public void setTags(String tags) {
		this.tags = tags;
	}
	public String getCompany_name() {
		return company_name;
	}
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}
	public String getCompany_logo() {
		return company_logo;
	}
	public void setCompany_logo(String company_logo) {
		this.company_logo = company_logo;
	}
	public String getCompany_about() {
		return company_about;
	}
	public void setCompany_about(String company_about) {
		this.company_about = company_about;
	}
	public String getCompany_website() {
		return company_website;
	}
	public void setCompany_website(String company_website) {
		this.company_website = company_website;
	}
	public String getCompany_address() {
		return company_address;
	}
	public void setCompany_address(String company_address) {
		this.company_address = company_address;
	}
	public String getContact_person() {
		return contact_person;
	}
	public void setContact_person(String contact_person) {
		this.contact_person = contact_person;
	}
	public String getContact_email() {
		return contact_email;
	}
	public void setContact_email(String contact_email) {
		this.contact_email = contact_email;
	}
	public String getContact_mobile() {
		return contact_mobile;
	}
	public void setContact_mobile(String contact_mobile) {
		this.contact_mobile = contact_mobile;
	}
	public String getEmp_type() {
		return emp_type;
	}
	public void setEmp_type(String emp_type) {
		this.emp_type = emp_type;
	}
	public String getDomain() {
		return domain;
	}
	public void setDomain(String domain) {
		this.domain = domain;
	}
	public String getJob_mode() {
		return job_mode;
	}
	public void setJob_mode(String job_mode) {
		this.job_mode = job_mode;
	}
	public String getMeta_title() {
		return meta_title;
	}
	public void setMeta_title(String meta_title) {
		this.meta_title = meta_title;
	}
	public String getMeta_desc() {
		return meta_desc;
	}
	public void setMeta_desc(String meta_desc) {
		this.meta_desc = meta_desc;
	}
	public String getMeta_keywords() {
		return meta_keywords;
	}
	public void setMeta_keywords(String meta_keywords) {
		this.meta_keywords = meta_keywords;
	}
	public Date getInactive_date() {
		return inactive_date;
	}
	public void setInactive_date(Date inactive_date) {
		this.inactive_date = inactive_date;
	}
	public Date getDate_of_posted() {
		return date_of_posted;
	}
	public void setDate_of_posted(Date date_of_posted) {
		this.date_of_posted = date_of_posted;
	}
	public String getAuth_code() {
		return auth_code;
	}
	public void setAuth_code(String auth_code) {
		this.auth_code = auth_code;
	}
	public Boolean getActive() {
		return active;
	}
	public void setActive(Boolean active) {
		this.active = active;
	}		
	public String getClient_id() {
		return client_id;
	}
	public void setClient_id(String client_id) {
		this.client_id = client_id;
	}
	@Transient
	public Integer getApplicationCount() {
		return applicationCount;
	}
	
	@Transient
	public void setApplicationCount(Integer applicationCount) {
		this.applicationCount = applicationCount;
	}
	public String getMin_exp() {
		return min_exp;
	}
	public void setMin_exp(String min_exp) {
		this.min_exp = min_exp;
	}
	public String getMax_exp() {
		return max_exp;
	}
	public void setMax_exp(String max_exp) {
		this.max_exp = max_exp;
	}
}
