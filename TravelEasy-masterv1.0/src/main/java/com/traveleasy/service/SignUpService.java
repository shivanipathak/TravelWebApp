package com.traveleasy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.traveleasy.client.ClientUtils;
import com.traveleasy.model.User;
import com.traveleasy.repository.SignUpRepository;

@Service
public class SignUpService {

	@Autowired
	private SignUpRepository signUpRepository;

	/*
	 * public void adduser(User user) { // System.out.print(user);
	 * signUpRepository.save(user); }
	 */

	public boolean adduser(User user) {
		try {
			signUpRepository.save(user);
			return true;
		} catch (Exception e) {

		}
		return false;
	}

	public User getuserinfo(String username, String pwd) {

		User user = signUpRepository.findUser(username);
		System.out.println("Signup"+user);
        ClientUtils.userName=user.getUsername();
		if (user != null && user.getUserpassword().equals(pwd)) {
			return user;
		}
		return null;
	}

}
