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
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
    crossorigin="anonymous"></script>
  <script src="${pageContext.request.contextPath}/resources/css/bootstrap/js/main.js"></script>
  <title>OMIYAMI</title>
</head>
<body style="background-color: var(--trueGray50)">
    <!-- header include -->
  	<%@ include file="/WEB-INF/views/common/header.jsp" %>

    <main class="login-wrapper">
      <div class="d-flex">
        <img class="logo-img-center" src="${pageContext.request.contextPath}/resources/img/logo/logo.png" />
      </div>
      
      <form action="/login" method="POST">
      <div class="form-signin w-50">
        <div class="my-5 form-floating">
          <input type="text" name="username" class="form-control" id="id" placeholder="ID" aria-label="ID" />
          <label for="id">ID</label>
        </div>

        <div class="my-5 form-floating">
			<input type="password" name="password" class="form-control" id="pwd" placeholder="Password" />
			<label for="pwd">PASSWORD</label>
        </div>
      </div>

      <div>
        <a href="${pageContext.request.contextPath}/login">
          <button type="submit" class="login btn-pro mx-auto" >로그인 하기</button>
        </a>
      </div>
      </form>
      <div class="text-center" style="font-weight: 600; margin-bottom: 150px">
        <p>
          <a href="../signup/signup.html" class="card-link text-reset px-3">
            회원가입
          </a>
          <a href="../find/fidID.html" class="card-link text-reset px-3">
            아이디찾기
          </a>
          <a href="../find/findPW.html" class="card-link text-reset px-3">
            비밀번호찾기
          </a>
        </p>
      </div>
    </main>

<!-- footer include-->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	
	
<script>
    <c:if test="${not empty loginError}">
        alert('${loginError}');
    </c:if>
</script>
  </body>
</html>
