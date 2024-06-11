package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.bean.StudentBean;

@Controller
public class StudentController {
	
	@GetMapping("/boxcricketregistration")
	public String boxRegistration()
	{
		return "BoxCricketReg";
	}
	
	@PostMapping("/savereg")
	public String saveRegistration(StudentBean studentbox, Model model)
	{
		System.out.println("Name :"+studentbox.getStudentName());
		System.out.println("Playing Type :"+studentbox.getPlayingType());
		System.out.println("Food Preference :"+studentbox.getFoodPreference());
		System.out.println("Drinks :"+studentbox.getDrink());
		
		boolean isError = false;
		String alphaRegEx = "[a-zA-Z]+";
		
		if (studentbox.getStudentName() == null || studentbox.getStudentName().trim().length() == 0)
		{
			isError = true;
			model.addAttribute("studentNameError", "Please Enter Name");
		}
		else if(studentbox.getStudentName().matches(alphaRegEx) == false)
		{
			isError = true;
			model.addAttribute("studentNameError","Please Enter Valid Name");
		}
		else
		{
			model.addAttribute("studentNameValue",studentbox.getStudentName());
		}
		
		
		if (studentbox.getPlayingType() == null)
		{
			isError = true;
			model.addAttribute("playingTypeError", "Please Select PlayingType");
		}
		else
		{
			model.addAttribute("playingTypeValue",studentbox.getPlayingType());	
		}
		
		
		if (studentbox.getFoodPreference().equals("-1") == true)
		{
			isError = true;
			model.addAttribute("foodPreferenceError", "Please Select Food Preference");
		}
		else
		{
			model.addAttribute("foodPreferenceValue",studentbox.getFoodPreference());
		}
		
		
		if (studentbox.getDrink() == null)
		{
			isError = true;
			model.addAttribute("drinkError","Please Select Atleast 1 Drinks");
		}
		else
		{
			model.addAttribute("drinkValue",studentbox.getDrink());
		}
		
		if (isError == true)
		{
			return "BoxCricketReg";
		}
		else 
		{
			model.addAttribute("reg",studentbox);
			return "RegDetail";
			
		}

	}
}
