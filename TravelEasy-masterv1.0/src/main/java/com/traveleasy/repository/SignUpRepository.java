package com.traveleasy.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.traveleasy.model.User;

@Repository
public interface SignUpRepository extends JpaRepository<User,Integer> {

	
	@Query("SELECT u FROM User u WHERE LOWER(u.username) = LOWER(:username)")
    public User findUser(@Param("username") String username);


}