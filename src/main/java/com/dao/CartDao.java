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

	public void addToCart(ECartBean cartBean) {
		stmt.update("insert into cart (productId,userId) values (?,?)", cartBean.getProductId(), cartBean.getUserId());
	}

	public List<EProductBean> myCart(Integer userId){
		
		List<EProductBean> products = stmt.query("select * from product join cart using (productId) where userId = ?", new BeanPropertyRowMapper<>(EProductBean.class), new Object[] {userId});
		
		return products;
	}
}
