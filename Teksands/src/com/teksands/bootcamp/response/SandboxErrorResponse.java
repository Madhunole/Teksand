package com.teksands.bootcamp.response;

import javax.annotation.Generated;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

@Generated("jsonschema2pojo")
public class SandboxErrorResponse {
	@SerializedName("transaction_id")
	@Expose
	private String transactionId;
	@SerializedName("code")
	@Expose
	private Integer code;
	@SerializedName("message")
	@Expose
	private String message;
	@SerializedName("timestamp")
	@Expose
	private Long timestamp;
	
	public String getTransactionId() {
	return transactionId;
	}
	
	public void setTransactionId(String transactionId) {
	this.transactionId = transactionId;
	}
	
	public Integer getCode() {
	return code;
	}
	
	public void setCode(Integer code) {
	this.code = code;
	}
	
	public String getMessage() {
	return message;
	}
	
	public void setMessage(String message) {
	this.message = message;
	}
	
	public Long getTimestamp() {
	return timestamp;
	}
	
	public void setTimestamp(Long timestamp) {
	this.timestamp = timestamp;
	}
}
