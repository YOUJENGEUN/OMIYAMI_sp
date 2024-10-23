package com.omiyami.shop.admin.vo;

import java.util.List;

public class AdminDashboardVO {
	private int totalSales; // 판매 현황
	private int newOrderCount; // 신규 주문 수
	private int inquiryCount; // 고객 문의 수
	private List<InquiryVO> recentInquiries; // 최근 문의 목록
	private List<ReviewVO> recentReviews; // 최근 리뷰 목록
	private List<AdminOrderVO> recentOrders; // 최근 주문 목록

	// 기본 생성자
	public AdminDashboardVO() {
	}

	// Getters and Setters
	public int getTotalSales() {
		return totalSales;
	}

	public void setTotalSales(int totalSales) {
		this.totalSales = totalSales;
	}

	public int getNewOrderCount() {
		return newOrderCount;
	}

	public void setNewOrderCount(int newOrderCount) {
		this.newOrderCount = newOrderCount;
	}

	public int getInquiryCount() {
		return inquiryCount;
	}

	public void setInquiryCount(int inquiryCount) {
		this.inquiryCount = inquiryCount;
	}

	public List<InquiryVO> getRecentInquiries() {
		return recentInquiries;
	}

	public void setRecentInquiries(List<InquiryVO> recentInquiries) {
		this.recentInquiries = recentInquiries;
	}

	public List<ReviewVO> getRecentReviews() {
		return recentReviews;
	}

	public void setRecentReviews(List<ReviewVO> recentReviews) {
		this.recentReviews = recentReviews;
	}

	public List<AdminOrderVO> getRecentOrders() {
		return recentOrders;
	}

	public void setRecentOrders(List<AdminOrderVO> recentOrders) {
		this.recentOrders = recentOrders;
	}

}