package com.omiyami.shop.admin.vo;

public class ReviewVO {
	private String productImage; // 상품 이미지
	private String productName; // 상품명
	private String content; // 리뷰 내용
	private String date; // 리뷰 날짜

	public String getProductImage() {
		return productImage;
	}

	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
}
