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

<body style="background-color: var(--trueGray50)">
  <!-- scroll up  -->
  <div class="scroll-top" id="scrollUp">
    <i class="fa-solid fa-cloud kr-700" style="font-size: var(--size900); color: var(--indigo100)"></i>
    <i class="fa-solid fa-plane-up kr-700" style="font-size: var(--size900); color: var(--rose300)"></i>
  </div>

  <!-- header include -->
    <%@ include file="/WEB-INF/views/common/header.jsp" %>

  <!-- Shop Product Start -->

  <div class="card-wrapper" style="margin-top: 50px">
    <div class="text-center" style="font-weight: 600; font-size: 30px; color: var(--gray800)">
   		  '${searchKeyword}'의 검색 결과 (${totalProducts}개)
    </div>
	<div class="d-flex justify-content-between my-3"></div>
	
	<div class="pr-list" style="align-items: center; justify-content: center">
 		<c:if test="${not empty products}">
    		<c:forEach var="product" items="${products}">
	          <div class="card-list">
	            <!-- 이미지 없으면 default.jpg 불러옴 -->
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
					<c:choose>
						<%-- stock이 0일때 --%>
						<c:when test="${product.stock == 0}">
							<span style="text-decoration: line-through;">
								<fmt:formatNumber value="${product.price}" type="number" groupingUsed="true" />
							</span>
							<span style="color: red; font-weight: bold;">SOLD OUT</span>
						</c:when>
						<%-- stock이 0이 아닐때 --%>
						<c:otherwise>
							<fmt:formatNumber value="${product.price}" type="number" groupingUsed="true" />
						</c:otherwise>
					</c:choose>
					</div>
	            </div>
	          </div>
			</c:forEach>
			</c:if>
			<c:if test="${empty products}">
		    <div class="text-center mt-4" style="margin-bottom: 200px; font-size: 20px; color: var(--gray800)">
   				  검색 결과가 없습니다
    		</div>
		</c:if>
    </div>
  </div>
  <c:if test="${not empty products}">
	<nav aria-label="Page navigation example " style="margin-bottom: 150px">
		<ul class="pagination">
			<li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
				<a class="page-link" href="?searchKeyword=${searchKeyword}&page=${currentPage - 1}">
					<span aria-hidden="true">&laquo;</span>
				</a>
			</li>
			
			<c:forEach begin="1" end="${totalPages}" var="i">
	            <li class="page-item ${i == currentPage ? 'active' : ''}">
	                <a class="page-link" href="?searchKeyword=${searchKeyword}&page=${i}">${i}</a>
	            </li>
        	</c:forEach>
			
			<li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
	            <a class="page-link" href="?searchKeyword=${searchKeyword}&page=${currentPage + 1}">
	                <span aria-hidden="true">&raquo;</span>
	            </a>
        	</li>
		</ul>
	</nav>
	</c:if>
	
		
	<!-- Shop Product End -->

  <!-- footer include-->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>

</body>

</html>