package com.omiyami.shop.controller;


import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.omiyami.shop.admin.AdminService;

import com.omiyami.shop.admin.vo.OrderSummaryVO;

@Controller
public class AdminController {

	@Autowired
    private AdminService adminService;
    
	
    // 주문 상태 업데이트
	@PostMapping("/admin/order/status")
    public String updateOrderStatus(@RequestParam("orderIds") List<Integer> orderIds,
                                  @RequestParam("statuses") List<String> statuses,
                                  RedirectAttributes rttr) {
        try {
            System.out.println("Received statuses: " + statuses);
            boolean updated = adminService.updateOrderStatuses(orderIds, statuses);
            
            if (updated) {
                // 업데이트된 주문 목록을 다시 조회
                List<OrderSummaryVO> updatedOrders = adminService.getAllOrders();
                rttr.addFlashAttribute("orders", updatedOrders);
                rttr.addFlashAttribute("message", "주문 상태가 성공적으로 변경되었습니다.");
                rttr.addFlashAttribute("messageType", "success");
            } else {
                rttr.addFlashAttribute("message", "주문 상태 변경에 실패했습니다.");
                rttr.addFlashAttribute("messageType", "error");
            }
        } catch (Exception e) {
            e.printStackTrace();
            rttr.addFlashAttribute("message", "처리 중 오류가 발생했습니다: " + e.getMessage());
            rttr.addFlashAttribute("messageType", "error");
        }
        return "redirect:/order-main";
    }
	@GetMapping("/order-main")
	public String getOrderMain(Model model) {
	    try {
	        List<OrderSummaryVO> orders = adminService.getAllOrders();
	        
	        // 디버깅 로그
	        if (orders == null) {
	            System.out.println("Orders is null");
	        } else {
	            System.out.println("Orders size: " + orders.size());
	            for (OrderSummaryVO order : orders) {
	                System.out.println("Order ID: " + order.getOrderId() 
	                    + ", Status: " + order.getStatus()
	                    + ", User: " + order.getUserName()
	                    + ", Total Amount: " + order.getTotalAmount());
	            }
	        }
	        
	        model.addAttribute("orders", orders);
	    } catch (Exception e) {
	        e.printStackTrace();
	        model.addAttribute("error", "주문 목록을 불러오는데 실패했습니다: " + e.getMessage());
	    }
	    return "admin/order-main";
	}
	
	
}