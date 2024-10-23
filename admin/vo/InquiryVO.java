package com.omiyami.shop.admin.vo;

public class InquiryVO {
	private String userName; // 사용자 이름
	private String content; // 문의 내용
	private String date; // 문의 날짜

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
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
