package com.traveleasy.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.traveleasy.model.Reviews;
import com.traveleasy.model.Usertravelplan;
import com.traveleasy.repository.ReviewsRepository;
import com.traveleasy.repository.UsertravelplanRepository;

@Service
public class UserService {
	@Autowired
	private ReviewsRepository postreviewsRepository;
	
	@Autowired
	private UsertravelplanRepository usertravelplanRepository;
	
	@Autowired
	private ReviewsRepository retrievereviewsRepository;
	
	
	public ArrayList<Reviews> retrieveReviews(String username) {

		try {
			ArrayList<Reviews> rev = retrievereviewsRepository.retrieveReviews(username);
			return rev;
		} catch (Exception e) {
			System.out.println("retrieve exception");
		}
		return null;
	}

	public boolean postReview(Reviews review) {

		try {
			postreviewsRepository.save(review);
			return true;
		} catch (Exception e) {
			System.out.println("save exception");
		}
		return false;
	}
	
	public ArrayList<Usertravelplan> retrieveUsertravelplans(String username) {

		try {
			ArrayList<Usertravelplan> u = usertravelplanRepository.retrieveUsertravelplans(username);
			System.out.println(u);
			return u;
			
		} catch (Exception e) {
			System.out.println("retrieve exception");
		}
		return null;
	}
	
	
	public boolean adduserTravelPlan(Usertravelplan up) {
		try {
			usertravelplanRepository.save(up);
			return true;
		} catch (Exception e) {

		}
		return false;
	}
	
	
	
}
