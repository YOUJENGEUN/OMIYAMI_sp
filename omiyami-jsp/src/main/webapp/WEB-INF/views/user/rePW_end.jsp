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
	  <link href="${pageContext.request.contextPath}/resources/css/style/login.css" rel="stylesheet" />

    <script src="https://kit.fontawesome.com/efcc08af8c.js" crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath}/resources/css/bootstrap/js/main.js"></script>
    <title>OMIYAMI</title>
  </head>

  <body style="background-color: var(--trueGray50)">
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
    <main class="signwel-wrapper">
      <div class="find-text text-center">
        <p class="my-4 kr-900" style="font-size: 40px">비밀번호 재설정 완료</p>
        <p style="margin-top: 100px">회원님의 비밀번호가 재설정되었습니다</p>
      </div>

      <div class="d-flex justify-content-center" style="margin-bottom: 150px">
        <a href="/login">
          <button class="login btn-pro" type="submit">로그인 하기</button>
        </a>
      </div>
    </main>

    <%@ include file="/WEB-INF/views/common/footer.jsp" %>
  </body>
</html>
