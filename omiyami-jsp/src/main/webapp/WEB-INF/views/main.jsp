<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />

  <meta property="og:type" content="website" />
  <meta property="og:url" content="" />
  <meta property="og:site_name" content="OMIYAMI" />
  <meta property="og:title" content="OMIYAMI" />
  <meta property="og:image" content="img/logo/logo1.png" />
  <meta property="og:image:width" content="1200" />
  <meta property="og:image:height" content="630" />

  <link href="resources/img/logo/logo1.png" rel="icon" />
  <link href="resources/css/style/main.css" rel="stylesheet" />
  <link href="resources/css/bootstrap/css/bootstrap.css" rel="stylesheet" />
  <link href="resources/css/fonts/fonts.css" rel="stylesheet" />
  <link href="resources/css/variables/colors.css" rel="stylesheet" />
  <link href="resources/css/variables/round.css" rel="stylesheet" />
  <link href="resources/css/style/btn.css" rel="stylesheet" />
  <link href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" rel="stylesheet" />
  <script src="resources/css/bootstrap/js/main.js"></script>
  <script src="https://kit.fontawesome.com/efcc08af8c.js" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
  <script src="dist/js/swiper.js"></script>

  <title>OMIYAMI</title>
</head>

<body style="background-color: var(--trueGray50)">
  <!-- loading start -->
  <div id="loader-wrapper">
    <div id="loader">
      <img class="loader-logo" src="resources/img/logo/logo.png" alt="loader-log" />
    </div>
  </div>
  <!-- loading end  -->

  <!-- scroll up  -->
  <div class="scroll-top" id="scrollUp">
    <i class="fa-solid fa-cloud kr-700" style="font-size: var(--size900); color: var(--indigo100)"></i>
    <i class="fa-solid fa-plane-up kr-700" style="font-size: var(--size900); color: var(--rose300)"></i>
  </div>

  <!-- main start  -->
  <div class="main-page">
  
  	<!-- header include -->
    <%@ include file="/WEB-INF/views/common/header.jsp" %>

    <!-- banner start -->
    <div class="swiper-container">
      <div class="swiper-wrapper">
        <div class="swiper-slide">
          <img src="resources/img/main/1.png" alt="Swiper01" />
        </div>
        <div class="swiper-slide">
          <img src="resources/img/main/2.png" alt="Swiper02" />
        </div>
        <div class="swiper-slide">
          <img src="resources/img/main/3.png" alt="Swiper03" />
        </div>
      </div>
      <div class="swiper-button-prev"></div>
      <div class="swiper-button-next"></div>
    </div>

    <!-- new start -->
    <div class="card-section">
      <!-- new start -->
      <div class="card-wrapper">
        <div class="text-center">
          <div class="section-title kr-900" style="font-size: var(--size900)">NEW</div>
        </div>

        <div class="pr-list" style="align-items: center; justify-content: center">
		
	 		<c:forEach var="product" items="${newProducts}">
	          <div class="card-list">
	            <!-- 이미지 없으면 디폴트 이미지 불러옴 -->
	            <a href="/product/${product.product_id}">
	            	<img src="${product.img_url != null ? product.img_url : '/resources/img/product/default.jpg'}" class="img-card" alt="${product.product_name}" />
	            </a>
	            <div class="card-body">
	              <div class="card-title kr-700" style="font-size: var(--size200)">
	              		${product.brand_name}
	              </div>
	              <div class="kr-900" style="font-size: var(--size500)">
	                	${product.product_name}
	              </div>
	              <div class="kr-800" style="font-size: var(--size300)">
	              	<!-- 천원 단위로 가격 포맷 설정-->
	                <fmt:formatNumber value="${product.price}" type="number" groupingUsed="true" />
	              </div>
	            </div>
	          </div>
			</c:forEach>

        </div>
      </div>
      <!-- new end -->

      <!-- best start -->
      <div class="card-wrapper">
        <div class="text-center">
          <div class="section-title kr-900" style="font-size: var(--size900)">
            BEST
          </div>
        </div>

        <div class="pr-list" style="align-items: center; justify-content: center">

         <c:forEach var="product" items="${bestProducts}">
	          <div class="card-list">
	            <a href="/product/${product.product_id}">
	            	<img src="${product.img_url != null ? product.img_url : '/resources/img/product/default.jpg'}" class="img-card" alt="${product.product_name}" />
	            </a>
	            <div class="card-body">
	              <div class="card-title kr-700" style="font-size: var(--size200)">
	              		${product.brand_name}
	              </div>
	              <div class="kr-900" style="font-size: var(--size500)">
	                	${product.product_name}
	              </div>
	              <div class="kr-800" style="font-size: var(--size300)">
	                <!-- 천원 단위로 가격 포맷 설정-->
	                <fmt:formatNumber value="${product.price}" type="number" groupingUsed="true" />

	              </div>
	            </div>
	          </div>
			</c:forEach>

        </div>
      </div>
    </div>
    <!-- main end  -->
  </div>
  <!-- footer start  -->
  <%@ include file="common/footer.jsp" %>
  <!-- footer end  -->
  <script>
    var swiper = new Swiper(".swiper-container", {
      navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
      },
      loop: true,
      autoplay: {
        delay: 2500,
        disableOnInteraction: true,
      },
    });
  </script>
  <!-- footer end  -->
</body>

</html>