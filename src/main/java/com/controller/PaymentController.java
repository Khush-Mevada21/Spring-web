package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.service.EmailService;

import jakarta.servlet.http.HttpSession;

@Controller
public class PaymentController 
{ 
	@Autowired
	EmailService emailService;
	
	@GetMapping("/checkout")
	public String checkout(HttpSession session,Model model)
	{
		Float totalPrice = (Float) session.getAttribute("totalPrice");
        model.addAttribute("totalPrice", totalPrice);
		return "Checkout";
	}
	
	@GetMapping("/inputemail")
	public String inputEmail()
	{
		return "InputEmail";
	}
	
	@PostMapping("/sendmail")
	public String sendEmail(@RequestParam("email") String email)
	{
		System.out.println(email);
		emailService.sendDemoMail(email, "Hi There ! Welcome to Ecommerce services.");
		return "Success";
	}
	
}
