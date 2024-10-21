package com.omiyami.shop.cart;

import java.util.List;

public interface CartService {
	
	void addToCart(int user_id, int product_id, int quantity);
    List<CartVO> getCartItemsByUserId(int user_id);
    void deleteCartItem(int user_id, List<Integer> productIds);
    void updateCartQuantity(int user_id, int product_id, int quantity);
}
