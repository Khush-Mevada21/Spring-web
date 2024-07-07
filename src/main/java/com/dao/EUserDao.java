package com.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
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
		stmt.update("insert into users(firstName,email,password,profileImagePath) values(?,?,?,?)", 
				userbean.getFirstName(), userbean.getEmail(), userbean.getPassword(), userbean.getProfileImagePath());
	}
	
	public EUserbean authenticate(String email, String password) 
	{
		try {
			EUserbean userBean = stmt.queryForObject("select * from users where email = ? and password = ?",
					new BeanPropertyRowMapper<>(EUserbean.class), new Object[] { email, password });

			return userBean;
			
		} 
		catch (Exception e)
		{
			System.out.println(e.getMessage());
		}

		return null;
	}
	
}
