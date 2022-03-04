package com.traveleasy.model;

public class LexUser {

	
	private String country;
	private String userId;
	private String month;
	
	
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}

	
	@Override
	public String toString() {
		return "LexUser [country=" + country + ", userId=" + userId + ", month=" + month + "]";
	}
	
	
	

}
