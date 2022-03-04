package com.traveleasy.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Usertravelplan {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int usertravelPlanId;
	private String username;
	private String country;
	private String month;
	private String plan;
	private int budget;
	
	public Usertravelplan()
	{
		
	}
	
	
	public Usertravelplan(int usertravelPlanId, String username, String country, String month, String plan, int budget) {
		super();
		this.usertravelPlanId = usertravelPlanId;
		this.username = username;
		this.country = country;
		this.month = month;
		this.plan = plan;
		this.budget = budget;
	}



	public int getusertravelPlanId() {
		return usertravelPlanId;
	}



	public void setusertravelPlanId(int usertravelPlanId) {
		this.usertravelPlanId = usertravelPlanId;
	}



	public String getuserName() {
		return username;
	}



	public void setuserName(String username) {
		this.username = username;
	}



	public String getCountry() {
		return country;
	}



	public void setCountry(String country) {
		this.country = country;
	}



	public String getMonth() {
		return month;
	}



	public void setMonth(String month) {
		this.month = month;
	}



	public String getPlan() {
		return plan;
	}



	public void setPlan(String plan) {
		this.plan = plan;
	}



	public int getBudget() {
		return budget;
	}



	public void setBudget(int budget) {
		this.budget = budget;
	}




	@Override
	public String toString() {
		return "Usertravelplan [usertravelPlanId=\" + usertravelPlanId + \", username=" + username + ", country="
				+ country + ", month=" + month + ", plan=" + plan + ", budget=" + budget + "]";
	}



}
