package com.omiyami.shop.product;

import java.util.List;

public interface ProductDAO {

	//header 검색
	List<ProductVO> getSearchResult(String searchKeyword, int limit, int offset);
	int getSearchResultCount(String searchKeyword);
	
	//main
	public List<ProductVO> getMainNewProducts();
	public List<ProductVO> getMainBestProducts();
	
	//productList
	public int getProductsCount(int area, List<String> categories);
	public List<ProductVO> getProductsByArea(int area, List<String> categories, String sortOption, int limit, int offset);
	
	//product
	void insertProductClickLog(int product_id);
	public ProductVO getProductDetailById(int product_id);
	public List<ProductVO> getProductImagesById(int product_id);
	public List<ProductVO> getRecommendsByCategory(int product_id);
	
	//cart
	public List<ProductVO> getRecommendsForCart();
	
//	
//	public void insertProduct(ProductVO vo);
//	public void updateProduct(ProductVO vo);
//	public void deleteProduct(int product_Id);
}
