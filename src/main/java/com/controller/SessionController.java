package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.bean.Userbean;

@Controller
public class SessionController 
{

	@GetMapping("/login")
	public String login()
	{
		return "Login";
	}
	
	@GetMapping("/signup")
	public String signup()
	{
		return "Signup";
	}
	
	@GetMapping("/fp")
	public String forgetPassword()
	{
		return "ForgetPassword";
	}
	
	
	@PostMapping("/saveUser")
	public String saveUser(Userbean userbean,Model model)
	{
		System.out.println("firstName : "+userbean.getFirstName());
		System.out.println("Email : "+userbean.getEmail());
		System.out.println("Password : "+userbean.getPassword());
		
		model.addAttribute("user",userbean);
		
		return "Home";
	}
	
	@GetMapping("/calc")
	public String calculateNum()
	{
		return "calculate";
	}
	
	@PostMapping("/sum")
	public String sum(Userbean userbean, Model model)
	{
		System.out.println("no 1 :"+userbean.getNo1());
		System.out.println("no 2 :"+userbean.getNo2());
		
		model.addAttribute("user",userbean);
		return "Add";
	}
}
