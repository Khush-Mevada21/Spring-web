package com.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bean.EUserbean;

@Repository
public class EUserDao 
{
	@Autowired
	JdbcTemplate stmt;
	
	public void insertUser(EUserbean userbean)
	{
		stmt.update("insert into users(firstName,email,password,profileImage) values(?,?,?,?)", 
				userbean.getFirstName(), userbean.getEmail(), userbean.getPassword(), userbean.getProfileImagePath());
	}
	
}
