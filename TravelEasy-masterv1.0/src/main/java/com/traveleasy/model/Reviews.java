package com.traveleasy.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Reviews {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int reviewsId;
	private String username;
	private String plan;
	private String comment;
	private String imageurl;
	
	public Reviews()
	{
		
	}
	
	public Reviews(int reviewsId, String username, String plan, String comment, String imageurl) {
		super();
		this.reviewsId = reviewsId;
		this.username = username;
		this.plan = plan;
		this.comment = comment;
		this.imageurl = imageurl;
	}

	
	public int getReviewsId() {
		return reviewsId;
	}

	public void setReviewsId(int reviewsId) {
		this.reviewsId = reviewsId;
	}

	public String getuserName() {
		return username;
	}

	public void setuserName(String username) {
		this.username = username;
	}

	public String getPlan() {
		return plan;
	}

	public void setPlan(String plan) {
		this.plan = plan;
	}
	
	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getImageUrl() {
		return imageurl;
	}
	

	public void setImageUrl(String imageurl) {
		this.imageurl = imageurl;
	}

	@Override
	public String toString() {
		return "Reviews [reviewsId=\" + reviewsId + \", username=" + username + ", plan=" + plan + ", comment=" + comment
				+ ", imageurl=" + imageurl + " ]";
	}

}
