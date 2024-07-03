package com.controller;

import java.io.File;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.bean.EUserbean;
import com.dao.EUserDao;
import com.service.FileUploadService;

@Controller
public class EcomSessionController {

	@Autowired
	EUserDao userDao;
	
	@Autowired
	FileUploadService fileUploadService;
	
	@GetMapping("/")
	public String welcome()
	{
		return "Welcome";
	}
	
	@GetMapping("/esignup")
	public String signup() {
		return "EcomSignup";
	}
	
	@PostMapping("/esignup")
	public String signupPost(EUserbean userbean) 
	{
		//System.out.println(userbean.getProfileImage().getOriginalFilename());
		
		userbean.setProfileImagePath("images//Profile Image//" + userbean.getEmail() + "//" + userbean.getProfileImage().getOriginalFilename());

		userDao.insertUser(userbean); 
			
		fileUploadService.uploadUserImage(userbean.getProfileImage(), userbean.getEmail());
		
		return "EcomLogin";
	}
}
