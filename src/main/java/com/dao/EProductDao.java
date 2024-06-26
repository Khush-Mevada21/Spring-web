package com.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bean.EProductBean;

@Repository
public class EProductDao {

	@Autowired	
	JdbcTemplate stmt;
		
	public void addProduct(EProductBean productBean)
	{
		stmt.update("insert into product (productName,category,price,qty) values (?,?,?,?)", 
				productBean.getProductName(), productBean.getCategory(), productBean.getPrice(), productBean.getQty());
	}
		
	public List<EProductBean> getAllProducts()
	{
		List<EProductBean> list = stmt.query("select * from product", 
				new BeanPropertyRowMapper<EProductBean>(EProductBean.class));
		return list;
	}
	
	
	public void deleteproductID(Integer productId)
	{
		stmt.update("delete from product where productId = ?",productId);
	}
	
	public void deleteproductName(String productName)
	{
		stmt.update("delete from product where productName = ?",productName);
	}
	
	public EProductBean getProductById(Integer productId) 
	{
		EProductBean bean = stmt.queryForObject("select * from product where productId = ? ", new BeanPropertyRowMapper<>(EProductBean.class), new Object[] {productId});
		
		return bean;
	}
	
}
