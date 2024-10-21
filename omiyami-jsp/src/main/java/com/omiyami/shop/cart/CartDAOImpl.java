package com.omiyami.shop.cart;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CartDAOImpl implements CartDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
    public CartVO findCartItemById(int user_id, int product_id) {
        Map<String, Object> params = new HashMap<>();
        params.put("user_id", user_id);
        params.put("product_id", product_id);
        return sqlSession.selectOne("CartMapper.findCartItemById", params);
    }

    @Override
    public void insertCartItem(CartVO cartVO) {
        sqlSession.insert("CartMapper.insertCartItem", cartVO);
    }

    @Override
    public void updateCartQuantity(int user_id, int product_id, int quantity) {
        Map<String, Object> params = new HashMap<>();
        params.put("user_id", user_id);
        params.put("product_id", product_id);
        params.put("quantity", quantity);
        sqlSession.update("CartMapper.updateCartQuantity", params);
    }

    @Override
    public List<CartVO> getCartItemsByUserId(int user_id) {
        return sqlSession.selectList("CartMapper.getCartItemsByUserId", user_id);
    }

    @Override
    public void deleteCartItem(int user_id, List<Integer> productIds) {
        Map<String, Object> params = new HashMap<>();
        params.put("user_id", user_id);
        params.put("product_ids", productIds);
        sqlSession.delete("CartMapper.deleteCartItem", params);
    }
}