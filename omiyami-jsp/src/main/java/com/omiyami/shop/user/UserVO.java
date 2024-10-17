package com.omiyami.shop.user;

import java.sql.Timestamp;

public class UserVO {

	private int user_id;
	private String username;
	private String password;
	private String name;
	private String email;
	private String phone;
	private String post_num;
	private String address;
	private Timestamp register_date;
	private String status;
	private Timestamp withdraw_date;
	
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPost_num() {
		return post_num;
	}
	public void setPost_num(String post_num) {
		this.post_num = post_num;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Timestamp getRegister_date() {
		return register_date;
	}
	public void setRegister_date(Timestamp register_date) {
		this.register_date = register_date;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Timestamp getWithdraw_date() {
		return withdraw_date;
	}
	public void setWithdraw_date(Timestamp withdraw_date) {
		this.withdraw_date = withdraw_date;
	}
	
	
	
}
