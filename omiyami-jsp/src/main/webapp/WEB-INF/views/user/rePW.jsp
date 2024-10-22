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
     <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>OMIYAMI</title>
  </head>

  <body style="background-color: var(--trueGray50)">
      <%@ include file="/WEB-INF/views/common/header.jsp" %>
      
    <main class="signup-wrapper my-5">
    <form  id="rePwform" action="/rePW" method="post">
      <div class="row my-4 text-center">
        <div class="my-5 bt-5 kr-900" style="font-size: var(--size800)">
          비밀번호 재설정
        </div>
      </div>
		
      <div class="form-signin ms-5">
      <input type="hidden" name="username" value="${username}" />
        <div class="d-flex pb-5" style="margin-left: 150px">
          <div class="col-2 kr-700">비밀번호</div>
          <div class="col-10 w-60">
            <input type="password" class="form-control-id" id="user_password" name="password"/>
          </div>
        </div>
        <div class="d-flex pb-5" style="margin-left: 150px">
          <div class="col-2 kr-700">비밀번호 확인</div>
          <div class="w-60">
            <input type="password" class="form-control-id" id="user_passwordConfirm" name="passwordConfirm" />
           <br>
           <div style="padding-top:10px" >
           	<span style="padding-top:200px" id="passwordCheckMessage" class="ms-1"></span>
           </div>
          </div>
        </div>
      </div>

      <div>
        <button class="login btn-pro mx-auto" type="submit">확인</button>
      </div>
	</form>
      <div class="text-center mb-5 pb-5">
        <p>
          이미 가입하셨나요?
          <a
            href="${pageContext.request.contextPath}/login"
            class="text-reset mx-2"
            style="font-weight: bold"
            >로그인</a
          >
        </p>
      </div>
    </main>
	 <%@ include file="/WEB-INF/views/common/footer.jsp" %>
	 
	 
	 <script type="text/javascript">
	    $(document).ready(function() {
	        // 비밀번호 확인 일치 여부 확인
	        $("#user_passwordConfirm").on("input", function() {
	            var password = $("#user_password").val();
	            var passwordConfirm = $(this).val();

	            if (password === passwordConfirm) {
	                $("#passwordCheckMessage").text("비밀번호가 일치합니다")
	                    .css("color", "var(--success)").removeClass("error").addClass("success");
	            } else {
	                $("#passwordCheckMessage").text("비밀번호가 일치하지 않습니다")
	                    .css("color", "var(--error)").removeClass("success").addClass("error");
	            }
	        });

	        // 폼 제출 시 비밀번호 일치 여부 확인
	        $("#rePwform").on("submit", function(event) {
	            var password = $("#user_password").val();
	            var passwordConfirm = $("#user_passwordConfirm").val();

	            if (password !== passwordConfirm) {
	                alert("비밀번호가 일치하지 않습니다.");
	                event.preventDefault();  // 제출을 막음
	            }
	        });
	    });
	</script>
	 
  </body>
</html>
