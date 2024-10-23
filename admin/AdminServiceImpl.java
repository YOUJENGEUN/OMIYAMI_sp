package com.omiyami.shop.admin;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.omiyami.shop.admin.impl.AdminDAO;
import com.omiyami.shop.admin.vo.DashboardSummaryVO;
import com.omiyami.shop.admin.vo.OrderSummaryVO;
import com.omiyami.shop.product.ProductVO;

@Service
public class AdminServiceImpl implements AdminService {
   
   @Autowired
   private AdminDAO adminDAO;
   
   // 대시보드 관련
   @Override
   @Transactional(readOnly = true)
   public DashboardSummaryVO getDashboardSummary() {
       return adminDAO.getDashboardSummary();
   }
   
   // 주문 관련
   @Override
   @Transactional(readOnly = true)
   public List<OrderSummaryVO> getRecentOrders() {
       return adminDAO.getRecentOrders();
   }
   
   @Override
   @Transactional(readOnly = true)
   public List<OrderSummaryVO> getAllOrders() {
	   List<OrderSummaryVO> orders = adminDAO.getAllOrders();
	    System.out.println("Orders size: " + (orders != null ? orders.size() : 0));
	    // 디버깅용 로그
	    if (orders != null) {
	        for (OrderSummaryVO order : orders) {
	            System.out.println("Order ID: " + order.getOrderId() 
	                + ", Status: " + order.getStatus()
	                + ", User: " + order.getUserName()
	                + ", Total Amount: " + order.getTotalAmount());
	        }
	    }
	    return orders;
   }
   
   @Override
   @Transactional(readOnly = true)
   public OrderSummaryVO getOrderById(int orderId) {
       try {
           return adminDAO.getOrderById(orderId);
       } catch (Exception e) {
           e.printStackTrace();
           return null;
       }
   }
   
   @Override
   @Transactional
   public boolean updateOrderStatus(int orderId, String status) {
	   try {
	        System.out.println("Updating single order - orderId: " + orderId + " to status: " + status);
	        int result = adminDAO.updateOrderStatus(orderId, status);
	        return result > 0;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
   }
   
   @Override
   @Transactional
   public boolean updateOrderStatuses(List<Integer> orderIds, List<String> statuses) {
       try {
           for (int i = 0; i < orderIds.size(); i++) {
               // 디버깅을 위한 로그
               System.out.println("Updating batch order - orderId: " + orderIds.get(i) + " to status: " + statuses.get(i));
               
               // 상태가 변경된 경우에만 업데이트
               if (statuses.get(i) != null && !statuses.get(i).isEmpty()) {
                   boolean updated = updateOrderStatus(orderIds.get(i), statuses.get(i));
                   if (!updated) {
                       return false;  // 하나라도 실패하면 false 반환
                   }
               }
           }
           return true;
       } catch (Exception e) {
           e.printStackTrace();
           return false;
       }
   }
   
   // 상품 관련
   @Override
   @Transactional(readOnly = true)
   public List<ProductVO> getTopProducts() {
       return adminDAO.getTopProducts();
   }
}