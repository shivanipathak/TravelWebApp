package com.traveleasy.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Company {
	
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int companyId;
	
	private String compUsername;
	private String compPassword;
	private String compName;
	
	public Company()
	{
		
	}
	
	public Company(int companyId, String compUsername, String compPassword, String compName) {
		super();
		this.companyId = companyId;
		this.compUsername = compUsername;
		this.compPassword = compPassword;
		this.compName = compName;
	}

	


	public int getCompanyId() {
		return companyId;
	}

	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}

	public String getCompUsername() {
		return compUsername;
	}

	public void setCompUsername(String compUsername) {
		this.compUsername = compUsername;
	}

	public String getCompPassword() {
		return compPassword;
	}

	public void setCompPassword(String compPassword) {
		this.compPassword = compPassword;
	}

	public String getCompName() {
		return compName;
	}

	public void setCompName(String compName) {
		this.compName = compName;
	}

	@Override
	public String toString() {
		return "Company [companyId=" + companyId + ", compUsername=" + compUsername + ", compPassword=" + compPassword
				+ ", compName=" + compName + "]";
	}
	
	

}

