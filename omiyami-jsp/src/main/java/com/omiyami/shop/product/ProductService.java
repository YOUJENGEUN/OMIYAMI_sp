package com.omiyami.shop.product;

import java.util.List;

public interface ProductService {

	List<ProductVO> getSearchResult(String searchKeyword, int limit, int offset);
	int getSearchResultCount(String searchKeyword);
	
	List<ProductVO> getMainNewProducts();
	List<ProductVO> getMainBestProducts();
	
	int getProductsCount(int area, List<String> categories);
	List<ProductVO> getProductsByArea(int area, List<String> categories, String sortOption, int limit, int offset);
	
	void insertProductClickLog(int productId);
	ProductVO getProductDetailById(int product_id);
	List<ProductVO> getProductImagesById(int product_id);
	List<ProductVO> getRecommendeds(int product_id);
	
	
	
//	void insertProduct(ProductVO product);
//	void updateProduct(ProductVO product);
//	void deleteProduct(int productId);
//	
}