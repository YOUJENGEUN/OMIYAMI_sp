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
  <link href="${pageContext.request.contextPath}/resources/css/style/product.css" rel="stylesheet" />

  <script src="https://kit.fontawesome.com/efcc08af8c.js" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
    crossorigin="anonymous"></script>
  <script src="${pageContext.request.contextPath}/resources/css/bootstrap/js/main.js"></script>
  <title>OMIYAMI</title>
</head>

<body style="background-color: var(--truegray50)">
  <!-- scroll up  -->
  <div class="scroll-top" id="scrollUp">
    <i class="fa-solid fa-cloud kr-700" style="font-size: var(--size900); color: var(--indigo100)"></i>
    <i class="fa-solid fa-plane-up kr-700" style="font-size: var(--size900); color: var(--rose300)"></i>
  </div>

  <!-- header include -->
  <%@ include file="/WEB-INF/views/common/header.jsp" %>

    <!-- HEADER END-->
    <div class="product-wrapper" style="margin-top: 100px">
      <!--item-container START-->
      <div class="item-container">
        <!-- 상품이미지&정보 -->
        <div class="item-topContainer">
          <!-- 상품이미지 -->
          <div class="item-imgs">
            <div class="item-large-img">
              <img src="${productImages[0]}" class="item-img" id="target"/>
            </div>
            <div class="item-small-imgs">
            <c:forEach var="imgUrl" items="${productImages}" varStatus="status">
            <c:if test="${status.index < 4}">
              <div class="item-small-img">
                <a href="#" onclick="setImage(${status.index}); return false;">
                	<img src="${imgUrl}" class="item-img" />
                </a>
              </div>
             </c:if>
             </c:forEach>
             <c:forEach var="index" begin="${fn:length(productImages)}" end="3" >
              <div class="item-small-img">
                <a href="#" onclick="setImage(${index}); return false;">
                	<img src="${pageContext.request.contextPath}/resources/img/product/default.jpg" class="item-img" />
                </a>
              </div>
        	</c:forEach>
            </div>
          </div>
          <!-- 상품정보 -->
          <div class="item-infos">
            <div class="item-info">
              <span class="item-brand kr-600">${product.brand_name}</span>
              <p class="item-name my-0">
				${product.product_name}
                <span class="item-option">${product.option}</span>
              </p>
              <div class="item-price" id="itemPrice">
              	<fmt:formatNumber value="${product.price}" type="number" groupingUsed="true" />원
              </div>
              <hr />
            </div>
            <!-- 상품수량선택 -->
            <div class="item-quantity">
              <div>수량선택
              	<p class="item-option" style="margin:0px !important">주문가능수량<span class="item-option" style="color: red">${product.stock}</span></p>
              </div>
              
              <div class="set-quantity">
                <button class="quantity-btn" onclick="changeQuantity(-1, ${product.stock}) ">-</button>
				<input type="text" id="itemQuantity" class="quantity-input" value="0" readonly />
				<button class="quantity-btn" onclick="changeQuantity(1, ${product.stock})">+</button>
              </div>
            </div>
            <!-- 상품총가격 -->
            <div class="total-price">
              <div>총액</div>
              <div id="totalPrice"></div>
            </div>
            <!-- 상품주문버튼 -->
            <div class="item-submit">
            <form action="/cart/add" method="POST">
		        <input type="hidden" name="product_id" value="${product.product_id}">
		        <input type="hidden" name="quantity" id="selectedQuantity" value="1">
		       
		      <c:choose>
			      <c:when test="${product.stock == 0}">
				      <button class="soldout-btn" type="button" disabled>품절</button>
			      </c:when>
			      <c:otherwise>
		              <button class="checkout-btn" onclick="location.href='/checkout/checkout.html'">바로구매</button>
		              <button class="cart-btn" type="submit" >장바구니담기</button>
	              </c:otherwise>
              </c:choose> 
            </form>
            </div>
          </div>
        </div>
        <!-- item-topContainer END -->

        <!-- 상세페이지 -->
        <div class="item-details">
          <div class="item-detail-title pb-4">상세정보</div>
          <div class="item-detail mt-4">
          <c:forEach var="imgUrl" items="${productImages}" varStatus="status">
              <div class="img-detail">
                	<img src="${imgUrl}" class="item-img" />
              </div>
          </c:forEach>
		    <p class="text-box" style="text-align: center;">
		        <c:out value="${product.content}" escapeXml="false" />
		    </p>
          </div>
        </div>
        <!-- 리뷰 -->
        <div class="review">
          	<div class="review-title pb-4">리뷰</div>
          	<!--리뷰없을때표시-->
		    <c:if test="${empty reviews}">
		        <div class="no-review">리뷰가 존재하지 않습니다</div>
		    </c:if>

		    <!-- 리뷰가 있을 때 표시 -->
		    <c:if test="${!empty reviews}">
		        <table>
		            <c:forEach var="review" items="${reviews}">
					<tr>
	                    <td class="review-total">${review.status}</td>
	                    <td class="review-content">${review.content}</td>
	                    <td class="review-writer">${review.username}</td>
	                    <td class="review-date">
	                    	<fmt:formatDate value="${review.write_date}" pattern="yyyy-MM-dd" />
						</td>
					</tr>
		            </c:forEach>
		        </table>
		    </c:if>
          

        </div>
      </div>
      <!-- item-container END -->

      <!-- 추천상품섹션 -->
      <div class="recommend">
        <div class="recommend-title">추천상품</div>
        <div class="recommend-pics">
        <c:forEach var="recommend" items="${recommendeds}">
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

    <script>
    //수량변경 -> 총금액반영
	function changeQuantity(quantity, productStock) {
   		const quantityInput = document.getElementById("itemQuantity");
   	 	const selectedQuantityInput = document.getElementById("selectedQuantity");
        let currentquantity = parseInt(quantityInput.value);
        let newquantity = currentquantity + quantity;

        // 수량이 1보다 작으면 1로 설정
        if (newquantity < 1) {
          newquantity = 1;
        }

        // 재고보다 수량이 많아지지 않도록 설정
        if (newquantity > productStock) {
          newquantity = productStock;
        }

        quantityInput.value = newquantity;
        
     	// 서버로 전송될 수량 업데이트
        selectedQuantityInput.value = newquantity;

		const itemPrice = parseInt(document.getElementById("itemPrice").textContent.replace(/,/g, ""));
        const totalPrice = itemPrice * newquantity;
        document.getElementById("totalPrice").textContent = totalPrice.toLocaleString() + "원";
      }

      
	// 이미지 교체 함수
	function setImage(index) {
		var smallImages = document.querySelectorAll('.item-small-img img');
		var imgUrl = smallImages[index].src;
		// 이미지가 default.jpg인지 확인
		if (imgUrl.includes('default.jpg')) {
			return;  // default.jpg이면 아무 동작도 하지 않음
		}
		document.getElementById('target').src = imgUrl;  // 큰 이미지 교체
      }
    </script>

  </body>
</html>
