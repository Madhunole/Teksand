package com.teksands.bootcamp.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "cms_parameter")
public class CmsParameter {
	private Integer id;
	private Integer brand_id;
	private String para_type;
	private String para_title;
	private String para_description;
	
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
	public String getPara_type() {
		return para_type;
	}
	public void setPara_type(String para_type) {
		this.para_type = para_type;
	}
	public String getPara_title() {
		return para_title;
	}
	public void setPara_title(String para_title) {
		this.para_title = para_title;
	}
	public String getPara_description() {
		return para_description;
	}
	public void setPara_description(String para_description) {
		this.para_description = para_description;
	}
}
