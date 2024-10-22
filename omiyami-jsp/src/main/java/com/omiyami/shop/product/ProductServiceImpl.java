package com.omiyami.shop.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omiyami.shop.product.review.ReviewVO;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDAO productDAO;
	
	@Override
	public List<ProductVO> getSearchResult(String searchKeyword,int limit, int offset) {
		return productDAO.getSearchResult(searchKeyword, limit, offset);
	}
	
	@Override
	public int getSearchResultCount(String searchKeyword) {
		return productDAO.getSearchResultCount(searchKeyword);
	}
	
	@Override
	public List<ProductVO> getMainNewProducts() {
		List<ProductVO> products = productDAO.getMainNewProducts();
        return products;
	}

	@Override
	public List<ProductVO> getMainBestProducts() {
		List<ProductVO> products = productDAO.getMainBestProducts();
        return products;
	}

	@Override
	public int getProductsCount(int area, List<String> categories) {
		return productDAO.getProductsCount(area, categories);
	}

	
	@Override
	public List<ProductVO> getProductsByArea(int area, List<String> categories, String sortOption, int limit, int offset) {
		List<ProductVO> products = productDAO.getProductsByArea(area, categories, sortOption, limit, offset);
		return products;
	}
	
	@Override
	public void insertProductClickLog(int product_id) {
		productDAO.insertProductClickLog(product_id);
		
	}
	
	@Override
	public ProductVO getProductDetailById(int product_id) {
		return productDAO.getProductDetailById(product_id);
	}

	@Override
	public List<ProductVO> getProductImagesById(int product_id) {
		List<ProductVO> productImg = productDAO.getProductImagesById(product_id);
        return productImg;
	}

	@Override
	public List<ReviewVO> getReviewsByProductId(int product_id) {
		return productDAO.getReviewsByProductId(product_id);
	}
	
	@Override
	public List<ProductVO> getRecommendsByCategory(int product_id) {
		List<ProductVO> recommends = productDAO.getRecommendsByCategory(product_id);
		return recommends;
	}

	@Override
	public List<ProductVO> getRecommendsForCart() {
		List<ProductVO> recommends = productDAO.getRecommendsForCart();
		return recommends;
	}












}
