package com.omiyami.shop.admin.vo;

import java.util.List;

import com.omiyami.shop.product.ProductVO;

public class DashboardSummaryVO {
	private int totalSales;
	private int newOrderCount;
	private int customerCount;
	private List<ProductVO> topProducts;

	public DashboardSummaryVO() {
	}

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

	public int getCustomerCount() {
		return customerCount;
	}

	public void setCustomerCount(int customerCount) {
		this.customerCount = customerCount;
	}

	public List<ProductVO> getTopProducts() {
		return topProducts;
	}

	public void setTopProducts(List<ProductVO> topProducts) {
		this.topProducts = topProducts;
	}
}
