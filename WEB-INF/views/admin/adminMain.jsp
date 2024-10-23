<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<link
	href="=${pageContext.request.contextPath}/resources/img/logo/logo1.png"
	rel="icon" />

<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap/css/bootstrap.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/css/fonts/fonts.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/css/variables/round.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/css/style/btn.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/css/style/admin.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/css/variables/colors.css"
	rel="stylesheet" />

<script src="https://kit.fontawesome.com/efcc08af8c.js"
	crossorigin="anonymous"></script>
<script
	src="${pageContext.request.contextPath}/resources/css/bootstrap/js/admin.js"></script>

<title>OMIYAMI</title>
</head>

<body style="background-color: var(- -bluegray100)">
	<div class="main-wrapper row">
		<div class="sidebar col-lg-2 px-0">
			<div class="d-flex justify-content-center my-5 logo">
				<a href="/main"> <img class="logo-img"
					src="${pageContext.request.contextPath}/resources/img/logo/logo.png"
					alt="logo" /></a>
			</div>
			<div class="nav-items" id="sidebarMenu">
				<a href="admin.html" class="nav-item   active kr-500" id="menu1"><i
					class="fa-solid fa-store"></i> OMIYAMI</a> <a href="Product-main.html"
					class="nav-item kr-500" id="menu2"><i class="fa-solid fa-tags"></i>상품관리</a>
				<a href="/order-main" class="nav-item kr-500" id="menu3"><i
					class="fa-solid fa-receipt"></i>주문관리</a> <a href="member-main.html"
					class="nav-item kr-500" id="menu4"><i class="fa-solid fa-users"></i>회원관리</a>
				<a href="post-main.html" class="nav-item kr-500" id="menu5"><i
					class="fa-solid fa-list-check"></i>게시물관리</a> <a
					href="Inquiry-main.html" class="nav-item kr-500" id="menu6"><i
					class="fa-solid fa-pen-to-square"></i>문의관리</a>
			</div>
			<footer>
				<p class="copyright">© 2024 OMIYAMI. All Rights Reserved.</p>
			</footer>
		</div>

		<div class="content col-lg-9">
			<div class="top-section">
				<div class="top-bar">
					<div class="top-icon">
						<i class="fa-solid fa-bell fa-xl"></i>
					</div>
					<div class="top-icon">
						<i class="fa-solid fa-user fa-xl"></i>
					</div>
				</div>
				<hr
					style="border: 1px solid var(- -gray900); transform: scaleY(1.1); opacity: 1;" />
			</div>

			<div class="dashboard-container">
				<div class="card-section">
					<div class="card1">
						<div class="kr-600">
							<div>판매 현황</div>
							<p>
								<span class="card-title kr-900">
                                    <fmt:formatNumber value="${totalSales/10000}" pattern="#,###" />
                                </span>만원
							</p>
						</div>
					</div>
					<div class="card1">
						<div class="kr-600">
							<div>신규 주문</div>
							<p>
								 <span class="card-title kr-900">${newOrderCount}</span>건
							</p>
						</div>
					</div>
					<div class="card1">
						<div class="kr-600">
							<div>고객문의</div>
							<p>
								<span class="card-title kr-900">${inquiryCount}</span>건
							</p>
						</div>
					</div>
				</div>
				
				  <!-- 문의 & 리뷰 섹션 -->
				<div class="content-section">
				 <!-- 고객문의 -->
					<div class="inquiry">
						<div class="d-flex justify-content-between"
							style="margin: 0px 10px">
							<div class="kr-700" style="font-size: var(- -size700)">
								고객문의</div>
							<div class="see-more" onclick="location.href='Inquiry-main.html'">
								더보기</div>
						</div>
						<table style="margin-top: 15px">
							<tbody>
								<c:forEach items="${inquiries}" var="inquiry">
                                    <tr class="inquiry-item">
                                        <td class="kr-600">${inquiry.userName}</td>
                                        <td>${inquiry.content}</td>
                                        <td>${inquiry.date}</td>
                                    </tr>
                                </c:forEach>
							</tbody>
						</table>
					</div>
					
					 <!-- 최신리뷰 -->
					<div class="review">
						<div class="d-flex justify-content-between"
							style="margin: 0px 10px">
							<div class="kr-700" style="font-size: var(- -size700)">
								최신리뷰</div>
							<div class="see-more" onclick="location.href='review.html'">
								더보기</div>
						</div>
						<table>
							<tbody>
								 <c:forEach items="${reviews}" var="review">
                                    <tr class="review-item">
                                        <td>
                                            <img class="pr-img" src="${pageContext.request.contextPath}${review.productImage}" alt="상품사진" />
                                        </td>
                                        <td class="review-text">
                                            <span>${review.content}</span>
                                            <span class="kr-600 my-0" style="font-size: var(--size200)">${review.productName}</span>
                                        </td>
                                        <td style="width: 15%">${review.date}</td>
                                    </tr>
                                </c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				
				 <!-- 주문현황 섹션 -->
				<div class="order-section" style="margin-bottom: 150px">
					<div class="d-flex justify-content-between"
						style="margin: 0px 10px">
						<div class="kr-700 mb-2" style="font-size: var(- -size700)">
							주문현황</div>
						<div class="see-more mb-2"
							onclick="location.href='/admin/order-main.html'">더보기</div>
					</div>
					<table>
						<thead class="table-head">
							<tr>
								<th colspan="2" style="width: 35%">상품명</th>
								<th style="width: 15%">금액</th>
								<th style="width: 15%">배송료</th>
								<th style="width: 15%">배송현황</th>
							</tr>
						</thead>
						<tbody class="table-body">
							 <c:forEach items="${orders}" var="order">
                                <tr class="order-item">
                                    <td style="width: 5%">
                                        <img class="pr-or-img" src="${pageContext.request.contextPath}${order.productImage}" alt="상품사진" />
                                    </td>
                                    <td class="order-text">
                                        <span class="kr-700" style="font-size: var(--size500)">${order.productName}</span>
                                        <span>수량: <span class="kr-700">${order.quantity}</span>개</span>
                                        <span>${order.brandName}</span>
                                    </td>
                                    <td class="kr-700" style="text-align: center">
                                        <fmt:formatNumber value="${order.price}" pattern="#,###"/>원
                                    </td>
                                    <td class="kr-700" style="text-align: center">
                                        <fmt:formatNumber value="${order.deliveryFee}" pattern="#,###"/>원
                                    </td>
                                    <td class="kr-700" style="text-align: center">${order.status}</td>
                                </tr>
                            </c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>

</html>