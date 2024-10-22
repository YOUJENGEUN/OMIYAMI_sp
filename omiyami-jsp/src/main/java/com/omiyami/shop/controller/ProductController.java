package com.omiyami.shop.controller;

import java.util.ArrayList;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.omiyami.shop.product.ProductService;
import com.omiyami.shop.product.ProductVO;
import com.omiyami.shop.product.review.ReviewVO;

@Controller
public class ProductController {

	@Autowired
	private ProductService productService;

	@GetMapping("/main")
	public String showMain(Model model) {
		// 신상품 목록 가져오기
		List<ProductVO> newProducts = productService.getMainNewProducts();
		model.addAttribute("newProducts", newProducts); // 모델에 최신 제품 목록 추가

		// 베스트 제품 목록 가져오기
		List<ProductVO> bestProducts = productService.getMainBestProducts();
		model.addAttribute("bestProducts", bestProducts); // 모델에 베스트 제품 목록 추가

		return "main";
	}
    
	// 검색 기능 구현
    @GetMapping("/search")
    public String searchProducts(@RequestParam("searchKeyword") String searchKeyword,
						         @RequestParam(defaultValue = "1") int page, // 기본 페이지는 1
						         Model model) {        
    	
    	int limit = 9;  // 한 페이지에 9개씩
        int offset = (page - 1) * limit;  // 시작 위치 계산
    	
    	List<ProductVO> products = productService.getSearchResult(searchKeyword, limit, offset);
        
    	int totalProducts = productService.getSearchResultCount(searchKeyword);
        int totalPages = (int) Math.ceil((double) totalProducts / limit);  // 전체 페이지 수 계산

        model.addAttribute("products", products);
        model.addAttribute("searchKeyword", searchKeyword);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("totalProducts", totalProducts);

        return "product/productSearch";
        
    }
	
	
	
	// 지역별 상품목록 // <a href="${pageContext.request.contextPath}/productList/1"
	@GetMapping("/productList/{area}")
    public String showProductsByArea(@PathVariable("area") int area, 
							    		@RequestParam(required = false, defaultValue = "전체") String category,
							            @RequestParam(required = false, defaultValue = "인기상품순") String sortOption,
							            @RequestParam(defaultValue = "1") int page,
							            Model model) {
        
		int limit = 9;  // 한 페이지에 9개씩
        int offset = (page - 1) * limit;  // 시작 위치 계산
        
        // '전체'일 경우 모든 카테고리를 포함
        List<String> categories = new ArrayList<>();
        if (category.equals("전체")) {
            categories.add("화과자");
            categories.add("양과자");
        } else {
            categories.add(category);  // 특정 카테고리일 경우 해당 카테고리만 추가
        }

        List<ProductVO> products = productService.getProductsByArea(area, categories, sortOption, limit, offset);
        
        // 전체 상품 수 계산
        int totalProducts = productService.getProductsCount(area, categories);  // 전체 상품 수 가져오는 메서드
        int totalPages = (int) Math.ceil((double) totalProducts / limit);
        
        model.addAttribute("products", products);  // 상품 목록을 모델에 추가
        model.addAttribute("currentCategory", category != null ? category : "전체");  // 현재 선택된 카테고리 추가
        model.addAttribute("currentSortOption", sortOption);  // 현재 선택된 정렬 옵션 추가
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        switch (area) {
            case 1:
                return "product/productList_1";  // productList_1.jsp로 이동
            case 2:
                return "product/productList_2";  // productList_2.jsp로 이동
            case 3:
                return "product/productList_3";  // productList_3.jsp로 이동
            case 4:
                return "product/productList_4";  // productList_4.jsp로 이동
            case 5:
                return "product/productList_5";  // productList_5.jsp로 이동
            default:
                return "error/404";  // 잘못된 요청 시 404 페이지로 이동
        }
    }
	
	@GetMapping("/product/{product_id}")
	public String showProductDetailById(@PathVariable("product_id") int product_id, Model model) {
		//클릭수증가
		productService.insertProductClickLog(product_id);
		
		//상품정보가져옴
        ProductVO product = productService.getProductDetailById(product_id);
        //줄바꿈태그변환
        if(product.getContent() != null) {
        	product.setContent(product.getContent().replace("\n", "<br>"));
        }
        model.addAttribute("product", product);

        //상품 이미지 목록 가져오기
        List<ProductVO> productImages = productService.getProductImagesById(product_id);
        model.addAttribute("productImages", productImages);

        //리뷰 가져옴
        List<ReviewVO> reviews = productService.getReviewsByProductId(product_id);
        model.addAttribute("reviews", reviews);
        
        //추천상품가져옴
        List<ProductVO> recommendeds = productService.getRecommendsByCategory(product_id);
        model.addAttribute("recommendeds", recommendeds);
        
		return "product/product";
	}
}