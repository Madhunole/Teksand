package com.teksands.bootcamp.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "cms_client_master")
public class ClientMaster {
	
	private Integer id;
	private Integer brand_id;
	private String user_id;
	private String name;
	private String description;
	private String cin;
	private String gst;
	private String pan;
	private String address;
	private String city;
	private String state;
	private String country;
	private String pinocde;
	private String nature_of_business;
	private String product_and_service;
	private String total_no_employee;
	private String annual_revenue;
	private String website;
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
	public Integer getBrand_id() {
		return brand_id;
	}
	public void setBrand_id(Integer brand_id) {
		this.brand_id = brand_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getCin() {
		return cin;
	}
	public void setCin(String cin) {
		this.cin = cin;
	}
	public String getGst() {
		return gst;
	}
	public void setGst(String gst) {
		this.gst = gst;
	}
	public String getPan() {
		return pan;
	}
	public void setPan(String pan) {
		this.pan = pan;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getPinocde() {
		return pinocde;
	}
	public void setPinocde(String pinocde) {
		this.pinocde = pinocde;
	}
	public String getNature_of_business() {
		return nature_of_business;
	}
	public void setNature_of_business(String nature_of_business) {
		this.nature_of_business = nature_of_business;
	}
	public String getProduct_and_service() {
		return product_and_service;
	}
	public void setProduct_and_service(String product_and_service) {
		this.product_and_service = product_and_service;
	}
	public String getTotal_no_employee() {
		return total_no_employee;
	}
	public void setTotal_no_employee(String total_no_employee) {
		this.total_no_employee = total_no_employee;
	}
	public String getAnnual_revenue() {
		return annual_revenue;
	}
	public void setAnnual_revenue(String annual_revenue) {
		this.annual_revenue = annual_revenue;
	}
	public String getWebsite() {
		return website;
	}
	public void setWebsite(String website) {
		this.website = website;
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
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}	
}
