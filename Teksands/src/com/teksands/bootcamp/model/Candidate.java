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
@Table(name = "cms_candidate")
public class Candidate {
	
	private Integer id;
	private String bootcamp_ids;
	private String bootcamp_name;
	private Integer job_id;
	private String job_title;
	private String name;
	private String email;
	private String mobile;
	private String gender;
	private String marital_status;
	private String home_town;
	private Date date_of_birth;
	private String current_location;
	private String preferred_location;
	private String permanent_address;
	private String permanent_city;
	private String permanent_state;
	private String permanent_country;
	private String permanent_pincode;
	
	private String resume;
	private String resume_file_name;
	private String total_experience;
	private String curr_company_name;
	private String curr_company_desigination;
	private String functional_area;
	private String role;
	private String industry;
	private String key_skills;
	private String annual_salary;
	private String notice_period;
	private Date last_working_day;
	private String resume_headling;
	private String summary;
	
	private String ug_degree;
	private String ug_specialization;
	private String ug_college_name;
	private String ug_graduation_year;
	
	private String pg_degree;
	private String pg_specialization;
	private String pg_college_name;
	private String pg_graduation_year;
	
	private String doctorate_degree;
	private String doctorate_specialization;
	private String doctorate_university;
	private String doctorate_graduation_year;
	
	private String certifications;
	private String program_language;
	private String ug_degree_stream;
	private String ug_degree_cgpa;
	private String how_find_me;
	
	private String work_permit_status;
	private String ts_screening_comment_1;
	private String ts_screening_comment_2;
	private String ts_screening_comment_3;
	private String ts_screening_grade;
	private Boolean placed;
	private String placed_company;
	private Date placed_date;
	private Date created_date;
	private String inactive_reason;
	private Integer call_schedule_id;
	private Boolean call_schedule_status;
	private Boolean active;
	
	private Integer brand_id;
	private Integer user_id;
	
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
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getMarital_status() {
		return marital_status;
	}
	public void setMarital_status(String marital_status) {
		this.marital_status = marital_status;
	}
	public String getHome_town() {
		return home_town;
	}
	public void setHome_town(String home_town) {
		this.home_town = home_town;
	}
	public Date getDate_of_birth() {
		return date_of_birth;
	}
	public void setDate_of_birth(Date date_of_birth) {
		this.date_of_birth = date_of_birth;
	}
	public String getCurrent_location() {
		return current_location;
	}
	public void setCurrent_location(String current_location) {
		this.current_location = current_location;
	}
	public String getPreferred_location() {
		return preferred_location;
	}
	public void setPreferred_location(String preferred_location) {
		this.preferred_location = preferred_location;
	}
	public String getPermanent_address() {
		return permanent_address;
	}
	public void setPermanent_address(String permanent_address) {
		this.permanent_address = permanent_address;
	}
	public String getPermanent_city() {
		return permanent_city;
	}
	public void setPermanent_city(String permanent_city) {
		this.permanent_city = permanent_city;
	}
	public String getPermanent_state() {
		return permanent_state;
	}
	public void setPermanent_state(String permanent_state) {
		this.permanent_state = permanent_state;
	}
	public String getPermanent_country() {
		return permanent_country;
	}
	public void setPermanent_country(String permanent_country) {
		this.permanent_country = permanent_country;
	}
	public String getPermanent_pincode() {
		return permanent_pincode;
	}
	public void setPermanent_pincode(String permanent_pincode) {
		this.permanent_pincode = permanent_pincode;
	}
	public String getTotal_experience() {
		return total_experience;
	}
	public void setTotal_experience(String total_experience) {
		this.total_experience = total_experience;
	}
	public String getCurr_company_name() {
		return curr_company_name;
	}
	public void setCurr_company_name(String curr_company_name) {
		this.curr_company_name = curr_company_name;
	}
	public String getCurr_company_desigination() {
		return curr_company_desigination;
	}
	public void setCurr_company_desigination(String curr_company_desigination) {
		this.curr_company_desigination = curr_company_desigination;
	}
	public String getFunctional_area() {
		return functional_area;
	}
	public void setFunctional_area(String functional_area) {
		this.functional_area = functional_area;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getIndustry() {
		return industry;
	}
	public void setIndustry(String industry) {
		this.industry = industry;
	}
	public String getKey_skills() {
		return key_skills;
	}
	public void setKey_skills(String key_skills) {
		this.key_skills = key_skills;
	}
	public String getAnnual_salary() {
		return annual_salary;
	}
	public void setAnnual_salary(String annual_salary) {
		this.annual_salary = annual_salary;
	}
	public String getNotice_period() {
		return notice_period;
	}
	public void setNotice_period(String notice_period) {
		this.notice_period = notice_period;
	}
	public String getResume_headling() {
		return resume_headling;
	}
	public void setResume_headling(String resume_headling) {
		this.resume_headling = resume_headling;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getUg_degree() {
		return ug_degree;
	}
	public void setUg_degree(String ug_degree) {
		this.ug_degree = ug_degree;
	}
	public String getUg_specialization() {
		return ug_specialization;
	}
	public void setUg_specialization(String ug_specialization) {
		this.ug_specialization = ug_specialization;
	}
	public String getUg_college_name() {
		return ug_college_name;
	}
	public void setUg_college_name(String ug_college_name) {
		this.ug_college_name = ug_college_name;
	}
	public String getUg_graduation_year() {
		return ug_graduation_year;
	}
	public void setUg_graduation_year(String ug_graduation_year) {
		this.ug_graduation_year = ug_graduation_year;
	}
	public String getPg_degree() {
		return pg_degree;
	}
	public void setPg_degree(String pg_degree) {
		this.pg_degree = pg_degree;
	}
	public String getPg_specialization() {
		return pg_specialization;
	}
	public void setPg_specialization(String pg_specialization) {
		this.pg_specialization = pg_specialization;
	}
	public String getPg_college_name() {
		return pg_college_name;
	}
	public void setPg_college_name(String pg_college_name) {
		this.pg_college_name = pg_college_name;
	}
	public String getPg_graduation_year() {
		return pg_graduation_year;
	}
	public void setPg_graduation_year(String pg_graduation_year) {
		this.pg_graduation_year = pg_graduation_year;
	}
	public String getDoctorate_degree() {
		return doctorate_degree;
	}
	public void setDoctorate_degree(String doctorate_degree) {
		this.doctorate_degree = doctorate_degree;
	}
	public String getDoctorate_specialization() {
		return doctorate_specialization;
	}
	public void setDoctorate_specialization(String doctorate_specialization) {
		this.doctorate_specialization = doctorate_specialization;
	}
	public String getDoctorate_university() {
		return doctorate_university;
	}
	public void setDoctorate_university(String doctorate_university) {
		this.doctorate_university = doctorate_university;
	}
	public String getDoctorate_graduation_year() {
		return doctorate_graduation_year;
	}
	public void setDoctorate_graduation_year(String doctorate_graduation_year) {
		this.doctorate_graduation_year = doctorate_graduation_year;
	}
	public String getWork_permit_status() {
		return work_permit_status;
	}
	public void setWork_permit_status(String work_permit_status) {
		this.work_permit_status = work_permit_status;
	}
	public String getTs_screening_comment_1() {
		return ts_screening_comment_1;
	}
	public void setTs_screening_comment_1(String ts_screening_comment_1) {
		this.ts_screening_comment_1 = ts_screening_comment_1;
	}
	public String getTs_screening_comment_2() {
		return ts_screening_comment_2;
	}
	public void setTs_screening_comment_2(String ts_screening_comment_2) {
		this.ts_screening_comment_2 = ts_screening_comment_2;
	}
	public String getTs_screening_comment_3() {
		return ts_screening_comment_3;
	}
	public void setTs_screening_comment_3(String ts_screening_comment_3) {
		this.ts_screening_comment_3 = ts_screening_comment_3;
	}
	public String getTs_screening_grade() {
		return ts_screening_grade;
	}
	public void setTs_screening_grade(String ts_screening_grade) {
		this.ts_screening_grade = ts_screening_grade;
	}
	public Boolean getPlaced() {
		return placed;
	}
	public void setPlaced(Boolean placed) {
		this.placed = placed;
	}
	public String getPlaced_company() {
		return placed_company;
	}
	public void setPlaced_company(String placed_company) {
		this.placed_company = placed_company;
	}
	public Date getPlaced_date() {
		return placed_date;
	}
	public void setPlaced_date(Date placed_date) {
		this.placed_date = placed_date;
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
	public String getBootcamp_ids() {
		return bootcamp_ids;
	}
	public void setBootcamp_ids(String bootcamp_ids) {
		this.bootcamp_ids = bootcamp_ids;
	}
	public String getBootcamp_name() {
		return bootcamp_name;
	}
	public void setBootcamp_name(String bootcamp_name) {
		this.bootcamp_name = bootcamp_name;
	}
	public String getInactive_reason() {
		return inactive_reason;
	}
	public void setInactive_reason(String inactive_reason) {
		this.inactive_reason = inactive_reason;
	}
	public String getResume() {
		return resume;
	}
	public void setResume(String resume) {
		this.resume = resume;
	}
	public Integer getCall_schedule_id() {
		return call_schedule_id;
	}
	public void setCall_schedule_id(Integer call_schedule_id) {
		this.call_schedule_id = call_schedule_id;
	}
	public Boolean getCall_schedule_status() {
		return call_schedule_status;
	}
	public void setCall_schedule_status(Boolean call_schedule_status) {
		this.call_schedule_status = call_schedule_status;
	}
	
	@Transient
	private Boolean isJobAssigned;
	
	@Transient
	public Boolean getIsJobAssigned() {
		return isJobAssigned;
	}
	
	@Transient
	public void setIsJobAssigned(Boolean isJobAssigned) {
		this.isJobAssigned = isJobAssigned;
	}
	public String getCertifications() {
		return certifications;
	}
	public void setCertifications(String certifications) {
		this.certifications = certifications;
	}
	public String getProgram_language() {
		return program_language;
	}
	public void setProgram_language(String program_language) {
		this.program_language = program_language;
	}
	public String getUg_degree_stream() {
		return ug_degree_stream;
	}
	public void setUg_degree_stream(String ug_degree_stream) {
		this.ug_degree_stream = ug_degree_stream;
	}
	public String getUg_degree_cgpa() {
		return ug_degree_cgpa;
	}
	public void setUg_degree_cgpa(String ug_degree_cgpa) {
		this.ug_degree_cgpa = ug_degree_cgpa;
	}
	public String getHow_find_me() {
		return how_find_me;
	}
	public void setHow_find_me(String how_find_me) {
		this.how_find_me = how_find_me;
	}
	public String getJob_title() {
		return job_title;
	}
	public void setJob_title(String job_title) {
		this.job_title = job_title;
	}
	public Date getLast_working_day() {
		return last_working_day;
	}
	public void setLast_working_day(Date last_working_day) {
		this.last_working_day = last_working_day;
	}
	public Integer getJob_id() {
		return job_id;
	}
	public void setJob_id(Integer job_id) {
		this.job_id = job_id;
	}
	public String getResume_file_name() {
		return resume_file_name;
	}
	public void setResume_file_name(String resume_file_name) {
		this.resume_file_name = resume_file_name;
	}
	public Integer getBrand_id() {
		return brand_id;
	}
	public void setBrand_id(Integer brand_id) {
		this.brand_id = brand_id;
	}
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
}
