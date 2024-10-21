package com.omiyami.shop.cart;

import java.util.List;


public interface CartDAO {
	
    CartVO findCartItemById(int user_id, int product_id);
    void insertCartItem(CartVO cartVO);
    void updateCartQuantity(int user_id, int product_id, int quantity);
    List<CartVO> getCartItemsByUserId(int user_id);
    void deleteCartItem(int user_id, List<Integer> productIds);
	
}
