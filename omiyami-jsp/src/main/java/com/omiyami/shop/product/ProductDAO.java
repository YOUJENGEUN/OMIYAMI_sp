package com.omiyami.shop.product;

import java.util.List;

import com.omiyami.shop.product.review.ReviewVO;

public interface ProductDAO {

	//header 검색
	List<ProductVO> getSearchResult(String searchKeyword, int limit, int offset);
	int getSearchResultCount(String searchKeyword);
	
	//main
	List<ProductVO> getMainNewProducts();
	List<ProductVO> getMainBestProducts();
	
	//productList
	int getProductsCount(int area, List<String> categories);
	List<ProductVO> getProductsByArea(int area, List<String> categories, String sortOption, int limit, int offset);
	
	//product
	void insertProductClickLog(int product_id);
	ProductVO getProductDetailById(int product_id);
	List<ProductVO> getProductImagesById(int product_id);
	List<ProductVO> getRecommendsByCategory(int product_id);
	List<ReviewVO> getReviewsByProductId(int product_id);
	
	//cart
	public List<ProductVO> getRecommendsForCart();
	
	
//	
//	public void insertProduct(ProductVO vo);
//	public void updateProduct(ProductVO vo);
//	public void deleteProduct(int product_Id);
}
