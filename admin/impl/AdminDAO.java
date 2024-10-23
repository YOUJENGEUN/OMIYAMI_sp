package com.omiyami.shop.admin.impl;

import java.util.List;

import com.omiyami.shop.admin.vo.DashboardSummaryVO;
import com.omiyami.shop.admin.vo.OrderSummaryVO;
import com.omiyami.shop.product.ProductVO;

public interface AdminDAO {
	DashboardSummaryVO getDashboardSummary();

	List<OrderSummaryVO> getRecentOrders();

	List<ProductVO> getTopProducts();

	int getTotalSales();

	int getNewOrderCount();

	int getCustomerCount();
	
	 
	// 주문 조회 관련
  
    List<OrderSummaryVO> getAllOrders();
    OrderSummaryVO getOrderById(int orderId);
    
    // 주문 상태 관리
    int updateOrderStatus(int orderId, String status);
    
   
}
