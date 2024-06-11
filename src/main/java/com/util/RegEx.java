package com.util;

public class RegEx {
	
	public static void main(String[] args)
	{
		String alphaRegEx = "[A-Za-z]+";
		
		String name = "ram";
		
		System.out.println(name.matches(alphaRegEx));
	}

}
