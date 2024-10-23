package com.omiyami.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;

import com.omiyami.shop.product.ProductService;
import com.omiyami.shop.user.UserService;

public class MainController {

	@Autowired
	UserService userService;
	
	@Autowired
	ProductService productService;
	
	
	
}
