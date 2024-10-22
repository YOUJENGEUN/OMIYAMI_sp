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
    
    <main class="signup-wrapper my-5">
      <div class="row my-4 text-center">
        <div class="my-5 bt-5 kr-900" style="font-size: var(--size800)">
          	아이디 찾기
        </div>
      </div>
	
	 <form action="/findID" method="post">
      <div class="form-signin ms-5">
        <div class="d-flex pb-5" style="margin-left: 150px">
          <div class="col-2 kr-700">이름</div>
          <div class="col-10 w-60">
            <input type="text" class="form-control-id" id="user-id" name="name" />
          </div>
        </div>
        <div class="d-flex pb-5" style="margin-left: 150px">
          <div class="col-2 kr-700">전화번호</div>
          <div class="w-60">
            <input type="tel" class="form-control-id" id="user-tel" name="phone" />
          </div>
        </div>
        <div class="d-flex pb-5" style="margin-left: 150px">
          <div class="col-2 kr-700">이메일</div>
          <div class="w-60">
            <input type="email" class="form-control-id" id="user-email" name="email"/>
          </div>
        </div>
      </div>

      <div>
        <button class="login btn-pro mx-auto" type="submit">확인</button>
      </div>

      <div class="text-center mb-5 pb-5">
        <p>이미 가입하셨나요?
          <a
            href="/login"
            class="text-reset mx-2"
            style="font-weight: bold"
            >로그인</a>
        </p>
      </div>
      </form>
      
    </main>
  
    <%@ include file="/WEB-INF/views/common/footer.jsp" %>
    <script>
    <c:if test="${not empty ErrorMessage}">
        alert('${ErrorMessage}');
    </c:if>
</script>
  </body>
</html>
