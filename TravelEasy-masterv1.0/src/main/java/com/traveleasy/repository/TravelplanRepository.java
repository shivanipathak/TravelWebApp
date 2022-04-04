package com.traveleasy.repository;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.traveleasy.model.Travelplan;

@Repository
public interface TravelplanRepository extends JpaRepository<Travelplan,Integer>{
	
	
	/*Edited by Chaitrali*/
	@Query("Select t FROM Travelplan t WHERE LOWER(t.country) = LOWER(:lexCountry) AND LOWER(t.month) = LOWER(:lexMonth)")
	public List<Travelplan> findTravelPlans(@Param("lexCountry") String lexCountry, @Param("lexMonth") String lexMonth);
	
	/*Edited by Chaitrali*/
	@Query("Select t FROM Travelplan t WHERE LOWER(t.plan) = LOWER(:planName)")
	public Travelplan findTravelPlanByPlanName(@Param("planName") String planName);
	
	@Query("SELECT t FROM Travelplan t WHERE LOWER(t.companyusername) = LOWER(:companyusername)")
    public ArrayList<Travelplan> retrieveCompanyTravelplans(@Param("companyusername") String companyusername);

	
}
