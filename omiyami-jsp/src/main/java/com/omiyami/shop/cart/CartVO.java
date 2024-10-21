package com.omiyami.shop.cart;

import com.omiyami.shop.product.ProductVO;
import com.omiyami.shop.user.UserVO;

public class CartVO {

	private UserVO userVO;         // 장바구니를 소유한 사용자 정보
    private ProductVO productVO;   // 장바구니에 담긴 상품 정보
    private int quantity;
    
    
    public CartVO() {
	}
	public CartVO(int user_id, int product_id) {
		this.userVO = new UserVO();
		this.userVO.setUser_id(user_id);
		
		this.productVO = new ProductVO();
		this.productVO.setProduct_id(product_id);
	}
	
	public CartVO(int user_id, int product_id, int quantity) {
		this.userVO = new UserVO();
		this.userVO.setUser_id(user_id);
		
		this.productVO = new ProductVO();
		this.productVO.setProduct_id(product_id);
		
		this.quantity = quantity;
	}
	
	
	 public UserVO getUserVO() {
		return userVO;
	}
	public void setUserVO(UserVO userVO) {
		this.userVO = userVO;
	}
	public ProductVO getProductVO() {
		return productVO;
	}
	public void setProductVO(ProductVO productVO) {
		this.productVO = productVO;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	// 장바구니 상품의 총 가격을 계산하는 메서드
    public int getTotalPrice() {
        return productVO.getPrice() * quantity;
    }
}
