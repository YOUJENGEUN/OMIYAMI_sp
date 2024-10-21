package com.omiyami.shop.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omiyami.shop.product.ProductDAO;
import com.omiyami.shop.product.ProductVO;
import com.omiyami.shop.user.UserVO;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	private CartDAO cartDAO;
	
	@Override
    public void addToCart(int user_id, int product_id, int quantity) {
        CartVO existingItem = cartDAO.findCartItemById(user_id, product_id);

        if (existingItem != null) {
            // 장바구니에 이미 있는 경우 수량 업데이트
            cartDAO.updateCartQuantity(user_id, product_id, existingItem.getQuantity() + quantity);
        } else {
            // 장바구니에 없으면 새로 추가
            CartVO newItem = new CartVO(user_id, product_id, quantity);
            cartDAO.insertCartItem(newItem);
        }
    }

    @Override
    public List<CartVO> getCartItemsByUserId(int user_id) {
        return cartDAO.getCartItemsByUserId(user_id);
    }

    @Override
    public void deleteCartItem(int user_id, List<Integer> productIds) {
        // 복수 선택항목 삭제
    	cartDAO.deleteCartItem(user_id, productIds);
    }

    @Override
    public void updateCartQuantity(int user_id, int product_id, int quantity) {
        // 장바구니 수량 변경
    	cartDAO.updateCartQuantity(user_id, product_id, quantity);
    }
}