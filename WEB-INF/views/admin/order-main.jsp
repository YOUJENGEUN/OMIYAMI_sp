<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	href="${pageContext.request.contextPath}/resources/img/logo/logo1.png"
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/efcc08af8c.js"
	crossorigin="anonymous"></script>
<script
	src="${pageContext.request.contextPath}/resources/css/bootstrap/js/admin.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/css/bootstrap/js/bootstrap.js"></script>

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
				<a href="admin.html" class="nav-item kr-500" id="menu1"><i
					class="fa-solid fa-store"></i> OMIYAMI</a> <a href="Product-main.html"
					class="nav-item active kr-500" id="menu2"><i
					class="fa-solid fa-tags"></i>상품관리</a> <a href="order-main.html"
					class="nav-item kr-500" id="menu3"><i
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
			<form action="${pageContext.request.contextPath}/admin/order/status"
				method="post">
				<input type="hidden" name="orderId" value="${order.orderId}">
				<input type="hidden" name="status" value="${order.status}">
				<div class="product-container">
					<div class="row d-flex">
						<div class="col section-title kr-700">주문관리</div>
						<button type="submit" class="btn btn-l">적용</button>
					</div>
					<hr class="admin-boder" />
					<!-- 디버깅을 위한 데이터 출력 -->
					<c:if test="${empty orders}">
						<div class="alert alert-warning" role="alert">주문 데이터가 없습니다.
						</div>
					</c:if>

					<!-- 에러 메시지 표시 -->
					<c:if test="${not empty error}">
						<div class="alert alert-danger" role="alert">${error}</div>
					</c:if>
					<div class="order-section mt-3">
						<table>
							<thead class="table-head">
								<tr>
									<th>No</th>
									<th colspan="2" style="width: 25%">주문내역</th>
									<th style="width: 10%">주문자</th>
									<th style="width: 10%">연락처</th>
									<th>주소</th>
									<th>진행상태</th>
								</tr>
							</thead>
							<tbody class="table-body">
								<c:forEach items="${orders}" var="order" varStatus="status">
									<tr class="order-item">
										<td style="text-align: center">${status.count}</td>
										<td style="width: 10%"><img class="or-img"
											src="${pageContext.request.contextPath}${order.productImage}"
											alt="상품사진" /></td>
										<td class="order-text"><span class="kr-700">${order.productName}</span>
											<span class="kr-500">${order.brandName}</span> <span><b>${order.quantity}</b>개</span>
										</td>
										<td style="text-align: center">${order.userName}</td>
										<td style="text-align: center">${order.userPhone}</td>
										<td style="text-align: center">${order.userAddress}</td>
										<td><input type="hidden" name="orderIds"
											value="${order.orderId}" /> <select name="statuses">
												<option value="배송준비중"
													${order.status eq '배송준비중' ? 'selected' : ''}>배송준비중</option>
												<option value="결제완료"
													${order.status eq '결제완료' ? 'selected' : ''}>결제완료</option>
												<option value="주문환불"
													${order.status eq '주문환불' ? 'selected' : ''}>주문환불</option>
												<option value="배송완료"
													${order.status eq '배송완료' ? 'selected' : ''}>배송완료</option>
												<option value="배송중"
													${order.status eq '배송중' ? 'selected' : ''}>배송중</option>
												<option value="취소" ${order.status eq '취소' ? 'selected' : ''}>취소</option>
										</select></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</form>



			<nav aria-label="Page navigation example "
				style="margin-bottom: 150px">
				<ul class="pagination">
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</ul>
			</nav>
		</div>
	</div>
	</div>
</body>
</html>
