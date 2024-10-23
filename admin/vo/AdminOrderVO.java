package com.omiyami.shop.admin.vo;

public class AdminOrderVO {
	 private String productImage;    // 상품 이미지
	    private String productName;     // 상품명
	    private String brandName;       // 브랜드명
	    private int quantity;           // 수량
	    private int price;             // 금액
	    private String status;         // 배송현황
	    
	    // 기본 생성자
	    public AdminOrderVO() {}
	    
	    // Getters and Setters
	    public String getProductImage() { return productImage; }
	    public void setProductImage(String productImage) { this.productImage = productImage; }
	    
	    public String getProductName() { return productName; }
	    public void setProductName(String productName) { this.productName = productName; }
	    
	    public String getBrandName() { return brandName; }
	    public void setBrandName(String brandName) { this.brandName = brandName; }
	    
	    public int getQuantity() { return quantity; }
	    public void setQuantity(int quantity) { this.quantity = quantity; }
	    
	    public int getPrice() { return price; }
	    public void setPrice(int price) { this.price = price; }
	    
	    public String getStatus() { return status; }
	    public void setStatus(String status) { this.status = status; }
	}