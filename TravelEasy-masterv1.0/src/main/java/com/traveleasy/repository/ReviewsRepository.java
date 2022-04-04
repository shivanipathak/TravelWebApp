package com.traveleasy.repository;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.traveleasy.model.Reviews;


@Repository
public interface ReviewsRepository extends JpaRepository<Reviews,Integer>{

	@Query("SELECT r FROM Reviews r WHERE LOWER(r.username) = LOWER(:username)")
    public ArrayList<Reviews> retrieveReviews(@Param("username") String username);
	
	@Query("SELECT r FROM Reviews r WHERE LOWER(r.plan) = LOWER(:plan)")
    public ArrayList<Reviews> getReviews(@Param("plan") String plan);
}

