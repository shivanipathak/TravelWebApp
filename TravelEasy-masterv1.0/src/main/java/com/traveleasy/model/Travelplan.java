package com.traveleasy.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;


@Entity
@Table(uniqueConstraints={@UniqueConstraint(columnNames={"plan"})})
public class Travelplan {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int travelPlanId;
	private String companyusername;
	private String country;
	private String month;
	private String plan;
	private int budget;
	private String itineraryimageurl;
	private String planimageurl;
	
	public Travelplan()
	{
		
	}
	
	
	public Travelplan(int travelPlanId, String companyusername, String country, String month, String plan, int budget,
			String itineraryimageurl, String planimageurl) {
		super();
		this.travelPlanId = travelPlanId;
		this.companyusername = companyusername;
		this.country = country;
		this.month = month;
		this.plan = plan;
		this.budget = budget;
		this.itineraryimageurl = itineraryimageurl;
		this.planimageurl = planimageurl;
	}



	public int getTravelPlanId() {
		return travelPlanId;
	}



	public void setTravelPlanId(int travelPlanId) {
		this.travelPlanId = travelPlanId;
	}



	public String getCompanyusername() {
		return companyusername;
	}



	public void setCompanyusername(String companyusername) {
		this.companyusername = companyusername;
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



	public String getItineraryimageurl() {
		return itineraryimageurl;
	}



	public void setItineraryimageurl(String itineraryimageurl) {
		this.itineraryimageurl = itineraryimageurl;
	}



	public String getPlanimageurl() {
		return planimageurl;
	}



	public void setPlanimageurl(String planimageurl) {
		this.planimageurl = planimageurl;
	}



	@Override
	public String toString() {
		return "Travelplan [travelPlanId=" + travelPlanId + ", companyusername=" + companyusername + ", country="
				+ country + ", month=" + month + ", plan=" + plan + ", budget=" + budget + ", itineraryimageurl="
				+ itineraryimageurl + ", planimageurl=" + planimageurl + "]";
	}



	

	

}
