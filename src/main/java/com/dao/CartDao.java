package com.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bean.ECartBean;
import com.bean.EProductBean;

@Repository
public class CartDao {

	@Autowired
	JdbcTemplate stmt;

	public void addToCart(ECartBean cartBean) 
	{
		ECartBean cart = null;
		
		try {
			cart = stmt.queryForObject("select * from cart where productId = ? and userId = ?", 
					new BeanPropertyRowMapper<>(ECartBean.class),
					new Object[] {cartBean.getProductId(), cartBean.getUserId() });
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		if(cart == null)
		{
			stmt.update("insert into cart (productId,userId,qty) values (?,?,?)", cartBean.getProductId(), cartBean.getUserId(), 1);
		}
		else
		{
			stmt.update("update cart set qty = ? where productId = ? and userId = ?",cart.getQty()+1, cart.getProductId(), cart.getUserId());
		}
		
	}

	public List<EProductBean> myCart(Integer userId){
		
		List<EProductBean> products = stmt.query("select * from product join cart using (productId) where userId = ?", new BeanPropertyRowMapper<>(EProductBean.class), new Object[] {userId});
		
		return products;
	}
	
	public void removecartitembyId(Integer productId)
	{
		stmt.update("delete from cart where productId = ?",productId);
		
	}
}
