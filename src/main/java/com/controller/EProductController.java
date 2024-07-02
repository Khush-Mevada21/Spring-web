package com.controller;

import java.io.File;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.bean.EProductBean;
import com.dao.EProductDao;
import com.service.FileUploadService;

@Controller
public class EProductController 
{
	@Autowired
	EProductDao productDao;
	
	@Autowired
	FileUploadService fileUploadService;
	
	@GetMapping("/newproduct")
	public String newProduct() 
	{
		return "NewProduct";
	}
	
	@PostMapping("/saveproduct")
	public String saveProduct(EProductBean productBean, @RequestParam("masterImage") MultipartFile masterImage) 
	{	
		
		fileUploadService.uploadProductImage(masterImage);
		
		productDao.addProduct(productBean);

		return "redirect:/products";
	}
	
	@GetMapping("/products")
	public String listProducts(Model model) 
	{
		List<EProductBean> products = productDao.getAllProducts();
		
		model.addAttribute("products",products);
		
		return "EcomListProduct";
	}
	
	@GetMapping("/deleteproduct")
	public String deleteProduct(@RequestParam("productId") Integer productId)
	{
		System.out.println("deleteProducts() => " + productId);
		
		productDao.deleteproductID(productId);
		
		return "redirect:/products";
	}
			
	@GetMapping("/deleteproductname")
	public String listProducts1(Model model) 
	{
		List<EProductBean> products = productDao.getAllProducts();
		
		model.addAttribute("products",products);
		
		return "DeleteProductName";
	}
	
	@GetMapping("/deleteproductbyname")
	public String deleteProduct(@RequestParam("productName") String productName)
	{
		System.out.println("deleteProducts() => " + productName);
		
		productDao.deleteproductName(productName);
		
		return "redirect:/products";
	}
	
	@GetMapping("viewproduct")
	public String viewProduct(@RequestParam("productId") Integer productId, Model model) {
		
		EProductBean productBean =  productDao.getProductById(productId);
		model.addAttribute("product",productBean);
		
		return "ViewProduct";
	}
	
}
