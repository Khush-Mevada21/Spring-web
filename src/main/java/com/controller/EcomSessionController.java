package com.controller;

import java.io.File;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.bean.EUserbean;
import com.dao.EUserDao;
import com.service.FileUploadService;

import jakarta.servlet.http.HttpSession;


@Controller
public class EcomSessionController {

	@Autowired
	EUserDao userDao;
	
	@Autowired
	FileUploadService fileUploadService;
	
	@GetMapping(value = {"/","elogin"})
	public String welcome()
	{
		return "EcomLogin";
	}
	
	@PostMapping("/elogin")
	public String eLogin(EUserbean userbean, Model model, HttpSession session )
	{
		EUserbean dbUser = userDao.authenticate(userbean.getEmail(), userbean.getPassword());
		if (dbUser == null) 
		{
			model.addAttribute("error","Invalid Credentials !");
			return "EcomLogin";
		}
		else 
		{
			session.setAttribute("user", dbUser);
			model.addAttribute("firstName",dbUser.getFirstName());
			model.addAttribute("profileImagePath",dbUser.getProfileImagePath());
			return "EcomHome";
		}
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
