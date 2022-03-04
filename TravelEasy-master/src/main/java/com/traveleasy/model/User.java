package com.traveleasy.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@Table(uniqueConstraints={@UniqueConstraint(columnNames={"username"})})
public class User {
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}



	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int userId;
	private String userfirstname;
	private String username;
	private String useremailid;
	private String userpassword;
	
	public User()
	{
		
	}
	
	public User(int userId, String userfirstname, String username, String useremailid, String userpassword ) {
		super();
		this.userId = userId;
		this.userfirstname = userfirstname;
		this.username = username;
		this.useremailid = useremailid;
		this.userpassword = userpassword;
	}

	
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserfirstname() {
		return userfirstname;
	}

	public void setUserfirstname(String userfirstname) {
		this.userfirstname = userfirstname;
	}


	
	public String getUseremailid() {
		return useremailid;
	}

	public void setUseremailid(String useremailid) {
		this.useremailid = useremailid;
	}

	public String getUserpassword() {
		return userpassword;
	}

	public void setUserpassword(String userpassword) {
		this.userpassword = userpassword;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", userfirstname=" + userfirstname + ", username=" + username
				+ ", useremailid=" + useremailid + ", userpassword=" + userpassword + "]";
	}

	
	
	
}