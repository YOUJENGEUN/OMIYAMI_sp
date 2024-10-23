package com.omiyami.shop.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.omiyami.shop.order.OrderService;
import com.omiyami.shop.order.OrderVO;

@Controller
public class OrderController {
	
	@RequestMapping("/orderTest") // GET, POST 모두 허용
	public String orderTestPage() {
		return "mypage/ orderTest"; // orderTest.jsp를 찾음
	}
	 @RequestMapping("/order")
	    public String orderPage() {
	        return "mypage/ orderTest";  // orderTest.jsp를 찾음
	    }

	@Autowired
	private OrderService orderService;

	@RequestMapping(value = "/count", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Long>> getOrderCounts() {
	    Map<String, Long> response = new HashMap<>();
	    response.put("totalOrders", orderService.getTotalOrderCount());
	    response.put("cancelledOrders", orderService.getCancelledOrderCount());
	    return ResponseEntity.ok(response);
	}
	@GetMapping("/order/{orderId}")
    public ResponseEntity<OrderVO> getOrder(@PathVariable long orderId) {
        OrderVO order = orderService.getOrder(orderId);
        return ResponseEntity.ok(order);
    }

    @DeleteMapping("/order/{orderId}")
    public ResponseEntity<Void> deleteOrder(@PathVariable long orderId) {
        orderService.deleteOrder(orderId);
        return ResponseEntity.ok().build();
    }

}
