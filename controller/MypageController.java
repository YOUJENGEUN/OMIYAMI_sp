package com.omiyami.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;

import com.omiyami.shop.order.OrderService;
import com.omiyami.shop.product.ProductService;
import com.omiyami.shop.user.UserService;

public class MypageController {
	@Autowired
	private OrderService orderService;
	@Autowired
	private UserService userService;
	@Autowired
	private ProductService productService;
}
