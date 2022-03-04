package com.traveleasy.repository;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.traveleasy.model.Usertravelplan;

@Repository
public interface UsertravelplanRepository extends JpaRepository<Usertravelplan,Integer> {

	@Query("SELECT u FROM Usertravelplan u WHERE LOWER(u.username) = LOWER(:username)")
    public ArrayList<Usertravelplan> retrieveUsertravelplans(@Param("username") String username);
}
