<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<header>
	<nav class="navbar navbar-expand-xl">
		<div class="container-fluid">
			<a class="navbar-brand" href="/main">
				<img class="logo-img"
						src="/resources/img/logo/logo.png"
						alt="OMIYAMI" width="65" height="65" />
			</a>

			<div class="nav-li collapse navbar-collapse" id="navbarSupportedContent">
				<div class="nav-right kr-600">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<c:choose>
						<c:when test="${empty sessionScope.userVO}">
						<li class="nav-item">
							<a class="nav-link" href="/login">로그인</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="/signup">회원가입 </a>
						</li>
						</c:when>
						<c:otherwise>
						<li class="nav-item">
							<a class="nav-link" href="/mypage">${sessionScope.userVO.name} 님</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="/logout">로그아웃</a>
						</li>
						</c:otherwise>
					</c:choose>
					</ul>
				</div>

				<div class="nav-center">
					<form action="/search" method="GET" class="d-flex" role="search">
						<input type="search" name="searchKeyword" class="searchform form-control me-4 kr-500" 
							placeholder="OMIYAMI에서 최고의 선물을 찾아보세요" aria-label="Search" />
						<button class="btn btn-lg" type="submit" style="font-weight: 600">찾기</button>
					</form>
				</div>

				<div class="nav-left">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item">
							<a class="nav-link" href="/mypage">
								<i class="fa-solid fa-user" style="font-size: var(--size550)"></i>
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="/cart/view">
								<i class="fa-solid fa-cart-shopping" style="font-size: var(--size550)"></i>
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link kr-700" href="#">JP</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</nav>

	<nav class="menu d-flex align-items-center justify-content-center mt-2">
		<ul class="nav nav-fill w-80 d-flex">
			<li class="nav-item"><a
				href="/productList/1"
				class="menu-font">홋카이도/토호쿠</a></li>

			<li class="nav-item"><a
				href="/productList/2"
				class="menu-font">칸토/츄부</a></li>

			<li class="nav-item"><a
				href="/productList/3"
				class="menu-font">간사이</a></li>

			<li class="nav-item"><a
				href="/productList/4"
				class="menu-font">츄고쿠/시코쿠</a></li>

			<li class="nav-item"><a
				href="/productList/5"
				class="menu-font">큐슈/오키나와</a></li>

			<li class="nav-item"><a
				href="/customerservice/notices" class="menu-font">공지사항</a>
			</li>

			<li class="nav-item"><a
				href="/customerservice/faqs" class="menu-font">FAQ</a>
			</li>
		</ul>
	</nav>
</header>