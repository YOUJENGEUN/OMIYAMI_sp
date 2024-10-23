package com.omiyami.shop.admin.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.omiyami.shop.admin.vo.DashboardSummaryVO;
import com.omiyami.shop.admin.vo.OrderSummaryVO;
import com.omiyami.shop.product.ProductVO;

@Repository
public class AdminDAOImpl implements AdminDAO {

	 @Autowired
	    private SqlSessionTemplate sqlSession;
	    
	    @Override
	    public DashboardSummaryVO getDashboardSummary() {
	        DashboardSummaryVO summary = new DashboardSummaryVO();
	        summary.setTotalSales(sqlSession.selectOne("AdminDAO.getTotalSales"));
	        summary.setNewOrderCount(sqlSession.selectOne("AdminDAO.getNewOrderCount"));
	        summary.setCustomerCount(sqlSession.selectOne("AdminDAO.getCustomerCount"));
	        summary.setTopProducts(sqlSession.selectList("AdminDAO.getTopProducts"));
	        return summary;
	    }
	    
	    @Override
	    public List<OrderSummaryVO> getRecentOrders() {
	        return sqlSession.selectList("AdminDAO.getRecentOrders");
	    }
	 // 상품 관련
	    @Override
	    public List<ProductVO> getTopProducts() {
	        return sqlSession.selectList("AdminDAO.getTopProducts");
	    }
	    
	    @Override
	    public int getTotalSales() {
	        return sqlSession.selectOne("AdminDAO.getTotalSales");
	    }
	    
	    @Override
	    public int getNewOrderCount() {
	        return sqlSession.selectOne("AdminDAO.getNewOrderCount");
	    }
	    
	    @Override
	    public int getCustomerCount() {
	        return sqlSession.selectOne("AdminDAO.getCustomerCount");
	    }

	    @Override
	    public List<OrderSummaryVO> getAllOrders() {
	        return sqlSession.selectList("admin.getAllOrders");
	    }
	    

		 // 주문 상태 관리
	    @Override
	    public int updateOrderStatus(int orderId, String status) {
	        Map<String, Object> params = new HashMap<>();
	        params.put("orderId", orderId);
	        params.put("status", status);
	        return sqlSession.update("admin.updateOrderStatus", params);
	    }

	    @Override
	    public OrderSummaryVO getOrderById(int orderId) {
	        return sqlSession.selectOne("admin.getOrderById", orderId);
	    }
	    
	    
	}