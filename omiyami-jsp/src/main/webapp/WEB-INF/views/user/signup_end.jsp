<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


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

	<link href="${pageContext.request.contextPath}/resources/css/style/main.css"rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/resources/css/bootstrap/css/bootstrap.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/resources/css/fonts/fonts.css"rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/resources/css/variables/colors.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/resources/css/variables/round.css"rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/resources/css/style/btn.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/resources/css/style/login.css" rel="stylesheet" />

    <script  src="https://kit.fontawesome.com/efcc08af8c.js" crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath}/resources/css/bootstrap/js/main.js"></script>

    <title>OMIYAMI</title>
  </head>

  <body style="background-color: var(--trueGray50)">
   
    <%@ include file="/WEB-INF/views/common/header.jsp"%>

    <main class="signwel-wrapper">
      <div class="d-flex">
        <img class="logo-img-center" src="${pageContext.request.contextPath}/resources/img/logo/logo.png" />
      </div>
		
		<form action="/login" method="get">	
	      <div class="welcom-text text-center">
	        <p class="my-4 kr-600" style="font-size: 50px">환영합니다!</p>
	        <p><span style="font-size: var(--size400); font-weight: 600;">${name}</span>님 회원가입을 축하합니다.</p>
	        <p><span style="font-size: var(--size400); font-weight: 600;">${name}</span>님 아이디는 <span style="font-size: var(--size300); font-weight: 600;">${username}</span>입니다.</p>
	      </div>
		
      <div style="margin-bottom: 150px">
        
          <button class="login btn-pro mx-auto" type="submit">
         	   로그인 하기
          </button>
        
      </div>
      </form>
    </main>

    <%@ include file="/WEB-INF/views/common/footer.jsp"%>
  </body>
</html>
