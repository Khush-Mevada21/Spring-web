package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpSession;

@Controller
public class PaymentController 
{ 
	
	@GetMapping("/checkout")
	public String checkout(HttpSession session,Model model)
	{
		Float totalPrice = (Float) session.getAttribute("totalPrice");
        model.addAttribute("totalPrice", totalPrice);
		return "Checkout";
	}
	
}
