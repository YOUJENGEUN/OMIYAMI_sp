package com.omiyami.shop.admin;

import java.util.List;

import com.omiyami.shop.admin.vo.DashboardSummaryVO;
import com.omiyami.shop.admin.vo.OrderSummaryVO;
import com.omiyami.shop.order.OrderVO;
import com.omiyami.shop.product.ProductVO;

public interface AdminService {
	 // 대시보드 관련
    DashboardSummaryVO getDashboardSummary();
    
    // 주문 관련
    List<OrderSummaryVO> getRecentOrders();
    List<OrderSummaryVO> getAllOrders();
    OrderSummaryVO getOrderById(int orderId);  // Long을 int로 변경
    
    // 주문 상태 업데이트 관련
    boolean updateOrderStatus(int orderId, String status);  // Long을 int로 변경
    boolean updateOrderStatuses(List<Integer> orderIds, List<String> statuses);  // 일괄 업데이트 메서드 수정
    
    // 상품 관련
    List<ProductVO> getTopProducts();
	
	
}
