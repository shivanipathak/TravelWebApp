package com.traveleasy.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.traveleasy.model.Company;
import com.traveleasy.model.Reviews;
import com.traveleasy.model.Travelplan;
import com.traveleasy.repository.CompanyRepository;
import com.traveleasy.repository.ReviewsRepository;
import com.traveleasy.repository.TravelplanRepository;

@Service
public class CompanyService {

	@Autowired
	private CompanyRepository companyRepository;

	@Autowired
	private TravelplanRepository travelplanRepository;
	
	@Autowired
	private ReviewsRepository reviewsRepository;

	public boolean addCompany(Company comp) {
		try {
			companyRepository.save(comp);
			return true;
		} catch (Exception e) {

		}
		return false;
	}

	public boolean addTravelplan(Travelplan tp) {

		try {
			System.out.println(tp);
			travelplanRepository.save(tp);
			return true;
		} catch (Exception e) {
			System.out.println("save exception");
		}
		return false;
	}

	public Company getCompanyinfo(String email, String pwd) {

		Company company = companyRepository.findCompany(email);

		if (company != null && company.getCompPassword().equals(pwd)) {

			return company;
		}
		return null;
	}

	public ArrayList<Travelplan> retrieveCompanyTravelplans(String companyusername) {

		try {
			ArrayList<Travelplan> t = travelplanRepository.retrieveCompanyTravelplans(companyusername);
			return t;
		} catch (Exception e) {
			System.out.println("retrieve exception");
		}
		return null;
	}

	public ArrayList<Reviews> getReviews(String plan) {
		try {
			ArrayList<Reviews> t = reviewsRepository.getReviews(plan);
			System.out.println("Hey just got these reviews for you: "+t);
			return t;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/* Edited by Prathyusha on 5th */
	public boolean deleteTravelplan(Integer travelplanid) {

		try {

			travelplanRepository.deleteById(travelplanid);
			//commented due to compliation issue and added the above line for compensation!
			//travelplanRepository.delete(travelplanid);
			return true;
		} catch (Exception e) {
			System.out.println("delete exception");
		}
		return false;
	}

	/* Edited by chaitrali */
	public List<Travelplan> findTravelPlans(String lexCountry, String lexMonth) {

		return travelplanRepository.findTravelPlans(lexCountry, lexMonth);

	}

	/* Edited by Chaitrali */
	public Travelplan findTravelPlanByName(String planName) {

		return travelplanRepository.findTravelPlanByPlanName(planName);

	}

}
