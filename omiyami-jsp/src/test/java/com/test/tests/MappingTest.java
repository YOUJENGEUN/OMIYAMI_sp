package com.test.tests;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.omiyami.shop.product.ProductVO;
import com.omiyami.shop.product.impl.ProductDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MappingTest {

	@Autowired
	private ProductDAO dao;
//	
//	@Before //@Test 전에 실행
//	public void testInsertMember() throws Exception{
//		ProductVO vo = new ProductVO();
//		vo.setBrand_name("브랜드명");
//		vo.setProduct_name("상품명");
//		vo.setPrice(15000);
//		dao.insertProduct(vo);
//	}
	
//	@Test
//	public void testGetProduct() throws Exception{
//	       // 테스트할 product_id 설정
//        int productId = 1;
//
//        // Mapper 호출 및 결과 확인
//        ProductVO product = dao.getProductDetail(productId);
//        assertNotNull(product); // 반환된 결과가 null이 아닌지 확인
//
//        // 예상 값과 실제 결과 비교
//        assertEquals(productId, product.getProduct_id()); // product_id 비교
//        System.out.println("Product Name: " + product.getProduct_name());
//        System.out.println("Product Price: " + product.getPrice());
//    }
	
	@Test
	public void testLatestProducts() throws Exception{
        // 상품 목록을 불러옴
        List<ProductVO> products = dao.getMainBestProducts();
        //assertNotNull(products); // 결과가 null이 아닌지 확인

        // 각 상품의 정보를 출력
        for (ProductVO product : products) {
            System.out.println("Product Name: " + product.getProduct_name());
            System.out.println("Brand Name: " + product.getBrand_name());
            System.out.println("Price: " + product.getPrice());
        }
	}
}