package com.omiyami.shop.product;

import java.util.List;

public class ProductVO {

	private int product_id;
	private String product_name;
	private String brand_name;
	private String content;
	private int price;
	private int stock;
	private String status;
	private String option;
	private int area;
	private String category;
	
	private int product_click;
	private String img_url;
	private List<String> images;//상세페이지용
	
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getBrand_name() {
		return brand_name;
	}
	public void setBrand_name(String brand_name) {
		this.brand_name = brand_name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	
	public int getArea() {
		return area;
	}
	public void setArea(int area) {
		this.area = area;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	public String getOption() {
		return option;
	}
	public void setOption(String option) {
		this.option = option;
	}
	public String getImg_url() {
		return img_url;
	}
	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}
	
	
	public int getProduct_click() {
		return product_click;
	}
	public void setProduct_click(int product_click) {
		this.product_click = product_click;
	}
	public void setImages(List<String> images) {
		this.images = images;
	}
	
	public List<String> getImages() {
		return images;
	}
	
	


	
}
