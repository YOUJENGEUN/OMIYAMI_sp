<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
    
	<link href="${pageContext.request.contextPath}/resources/img/logo/logo1.png" rel="icon" />
	<link href="${pageContext.request.contextPath}/resources/css/style/main.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/resources/css/bootstrap/css/bootstrap.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/resources/css/fonts/fonts.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/resources/css/variables/colors.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/resources/css/variables/round.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/resources/css/style/btn.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/resources/css/style/cart.css" rel="stylesheet" />

	<script src="https://kit.fontawesome.com/efcc08af8c.js" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	  crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath}/resources/css/bootstrap/js/main.js"></script>
	<script src="${pageContext.request.contextPath}/resources/css/bootstrap/js/cart.js?v=1.0"></script>
	<title>OMIYAMI</title>
</head>
<body style="background-color: var(--trueGray50)">
  <!-- scroll up  -->
  <div class="scroll-top" id="scrollUp">
    <i class="fa-solid fa-cloud kr-700" style="font-size: var(--size900); color: var(--indigo100)"></i>
    <i class="fa-solid fa-plane-up kr-700" style="font-size: var(--size900); color: var(--rose300)"></i>
  </div>

    <!-- header include -->
  	<%@ include file="/WEB-INF/views/common/header.jsp" %>

    <!-- CART-CONTAINER START-->
    <div class="cart-wrapper">
      <div class="cart-container">
        <div class="cart-top">
          <!-- 타이틀 -->
          <div class="cart-top-title">
            <span>장바구니</span>
          </div>
          <!-- 진행상태 -->
          <div class="cart-top-breadcrumb">
            <span class="kr-800" style="color: var(--gray900)">장바구니</span> > 결제 > 주문완료
          </div>
        </div>

	
        <div class="cart-left">
        <form id="cartForm" action="/cart/delete" method="POST">
          <!-- 전체선택/삭제 -->
          <div class="cart-select">
            <div>
              <input type="checkbox" id="checkAll" name="selectAll-item" />
              <label for="checkAll">전체 선택 (0/${fn:length(cartItems)})</label>
            </div>
            <button type="submit" class="btn-sm" id="deltebtn">삭제</button>
          </div>

          <!-- 장바구니 상품 -->
          <div class="cart-items">
          	<!-- 장바구니 비어 있을 때 -->
          	<c:if test="${empty cartItems}">
          	<div class="cart-empty">장바구니에 담긴 상품이 없습니다</div>
          	</c:if>
          	
            <!-- 장바구니 출력 -->
            <c:if test="${not empty cartItems}">
	            <c:forEach var="item" items="${cartItems}">
	            <div class="cart-item" data-product-id="${item.productVO.product_id}" data-product-price="${item.productVO.price}">
				  <input type="checkbox" name="product_ids" value="${item.productVO.product_id}" />
				  <a href="/product/${item.productVO.product_id}">
				    <img src="${item.productVO.img_url}" alt="상품이미지" />
				  </a>
				  <div class="cart-item-details">
				    <p>${item.productVO.brand_name}</p>
				    <p style="font-weight:600;">${item.productVO.product_name}</p>
				    <p>${item.productVO.option}</p>
				    <!-- 수량조절 -->
				    <div class="cart-item-quantity" data-quantity="${item.quantity}">
				      <button type="button" class="decrease-btn">-</button>
				      <input type="text" class="quantity-input" value="${item.quantity}" min="1" readonly />
				      <button type="button" class="increase-btn">+</button>
				    </div>
				  </div>
				  <div class="cart-item-price">
				  	<p class="total-price" data-price="${item.productVO.price}">
				      <fmt:formatNumber value="${item.getTotalPrice()}" type="number" groupingUsed="true" />원
				    </p>
				  </div>
				</div>
	            </c:forEach>
            </c:if>
            <!-- CART-ITEM END-->
          </div>
          </form>
          <!--CART-ITEMS END-->
        </div>
		<!--CART-LEFT END-->

        <div class="cart-right">
          <div class="cart-summaries-title">결제 금액</div>
          <!--  결제금액/주문하기버튼 -->
          <div class="cart-summaries">
            <ul class="cart-summary-list">
              <li class="cart-summary">
                <span>주문 금액</span>
                <span class="kr-600" id="total-order-amount">0원</span>
              </li>
              <li class="cart-summary">
                <span>배송비</span>
                <span class="kr-600" id="shipping-fee">원</span>
              </li>
              <li class="cart-summary total-price">
                <span>예정 결제 금액</span>
                <span style="color: var(--rose300)" id="final-payment-amount">원</span>
              </li>
              <li class="cart-summary">
                <span>예정 적립 포인트</span>
                <span class="kr-600" id="reward-point">0p</span>
              </li>
            </ul>
            <div class="cart-checkout">
              <button class="checkout-btn" onclick="#">
				주문하기 (0개)
              </button>
            </div>
          </div>

          <div class="cart-to-main">
            <a href="/main">쇼핑 계속하기</a>
          </div>
        </div>
      </div>

      <!-- CART-CONTAINER END -->



<!-- 추천상품섹션 -->
      <div class="recommend">
        <!--타이틀-->
        <div class="recommend-title">추천상품</div>
        <!--상품이미지-->
        <div class="recommend-pics">
        <c:forEach var="recommend" items="${cartRecommends}">
          <div class="recommend-pic">
            <a href="/product/${recommend.product_id}">
              <img src="${recommend.img_url}" class="recommend-pic" />
              <div class="caption">
                <p>${recommend.product_name}</p>
              </div>
            </a>
          </div>
          </c:forEach>
        </div>
      </div>

      <!-- recommend END -->
    </div>

    <!-- footer include -->
  	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
  </body>
</html>
