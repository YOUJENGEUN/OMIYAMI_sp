package com.omiyami.shop.product;

import java.util.List;

public interface ProductService {

	//header 검색
	List<ProductVO> getSearchResult(String searchKeyword, int limit, int offset);
	int getSearchResultCount(String searchKeyword);
	
	//메인
	List<ProductVO> getMainNewProducts();
	List<ProductVO> getMainBestProducts();
	
	//지역별리스트&페이징
	int getProductsCount(int area, List<String> categories);
	List<ProductVO> getProductsByArea(int area, List<String> categories, String sortOption, int limit, int offset);
	
	//상세페이지&해당카테고리내추천
	void insertProductClickLog(int productId);
	ProductVO getProductDetailById(int product_id);
	List<ProductVO> getProductImagesById(int product_id);
	List<ProductVO> getRecommendsByCategory(int product_id);
	
	//장바구니추천
	List<ProductVO> getRecommendsForCart();
	
	
//	void insertProduct(ProductVO product);
//	void updateProduct(ProductVO product);
//	void deleteProduct(int productId);
//	
}