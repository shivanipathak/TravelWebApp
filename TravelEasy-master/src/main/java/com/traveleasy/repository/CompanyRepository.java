package com.traveleasy.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.traveleasy.model.Company;

@Repository
public interface CompanyRepository extends JpaRepository<Company,Integer> {
	
	
	@Query("SELECT c FROM Company c WHERE LOWER(c.compUsername) = LOWER(:compUsername)")
    Company findCompany(@Param("compUsername")String email);

}