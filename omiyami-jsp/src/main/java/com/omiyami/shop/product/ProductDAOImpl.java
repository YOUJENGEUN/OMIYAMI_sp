package com.omiyami.shop.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.omiyami.shop.product.review.ReviewVO;

@Repository
public class ProductDAOImpl implements ProductDAO {

	@Autowired
	private SqlSession sqlSession;

	// header
	@Override
	public List<ProductVO> getSearchResult(String searchKeyword, int limit, int offset) {
		Map<String, Object> params = new HashMap<>();
        params.put("searchKeyword", searchKeyword);
        params.put("limit", limit);
        params.put("offset", offset);
        return sqlSession.selectList("ProductMapper.getSearchResult", params);
	}

	@Override
	public int getSearchResultCount(String searchKeyword) {
		return sqlSession.selectOne("ProductMapper.getSearchResultCount", searchKeyword);
	}
	
	
	// main
	@Override
	public List<ProductVO> getMainNewProducts() {
		List<ProductVO> products = sqlSession.selectList("ProductMapper.getMainNewProducts");
		return products;
	}

	// main
	@Override
	public List<ProductVO> getMainBestProducts() {
		List<ProductVO> products = sqlSession.selectList("ProductMapper.getMainBestProducts");
		return products;
	}

	// productList
	@Override
	public int getProductsCount(int area, List<String> categories) {
		Map<String, Object> params = new HashMap<>();
        params.put("area", area);
        params.put("categories", categories);
        return sqlSession.selectOne("ProductMapper.getProductsCount", params);
	}
	
	// productList
	@Override
	public List<ProductVO> getProductsByArea(int area, List<String> categories, String sortOption, int limit, int offset) {
		Map<String, Object> params = new HashMap<>();
		params.put("area", area);
		params.put("categories", categories);
		params.put("sortOption", sortOption);
		params.put("limit", limit);
        params.put("offset", offset);
		return sqlSession.selectList("ProductMapper.getProductsByArea", params);
	}
	
	//product
	@Override
	public void insertProductClickLog(int product_id) {
		sqlSession.insert("ProductMapper.insertProductClickLog", product_id);
	}
	
	@Override
	public ProductVO getProductDetailById(int product_id) {
		return sqlSession.selectOne("ProductMapper.getProductDetailById", product_id);
	}

	@Override
	public List<ProductVO> getProductImagesById(int product_id) {
		return sqlSession.selectList("ProductMapper.getProductImagesById", product_id);
	}

	@Override
	public List<ReviewVO> getReviewsByProductId(int product_id) {
		return sqlSession.selectList("ProductMapper.getReviewsByProductId", product_id);
	}
	
	@Override
	public List<ProductVO> getRecommendsByCategory(int product_id) {
		return sqlSession.selectList("ProductMapper.getRecommendsByCategory", product_id);
	}

	@Override
	public List<ProductVO> getRecommendsForCart() {
		return sqlSession.selectList("ProductMapper.getRecommendsForCart");
	}






}
