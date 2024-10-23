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
  
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  <script src="${pageContext.request.contextPath}/resources/css/bootstrap/js/zipcode.js"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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

    <main class="signup-wrapper my-5">
      <div class="row my-4 text-center">
        <div class="my-5 bt-5 kr-800" style="font-size: var(--size900)">회원가입</div>
      </div>

	<form action="/signup" method="POST">
      <table style="margin-left: 150px">
        <tr>
          <td width="200px">아이디</td>
          <td width="600px">
            <input type="text" name="username" id="username" class="form-control-add ms-4 mb-3" style="width: 250px"/>
            <button type="button" class="btn checkId" style="background: #d1d5db50; font-size: var(--size300); margin-left: 3px;">중복확인</button>
            <span id="idCheckMessage" class="ms-1"></span>
          </td>
        </tr>
        <tr>
          <td>비밀번호</td>
          <td>
            <input type="password" name="password" id="user_password" required class="form-control-add ms-4 mb-3" style="width: 250px"/>
          </td>
        </tr>
        <tr>
          <td>비밀번호 확인</td>
          <td>
            <input  type="password" name="passwordConfirm" id="user_passwordConfirm" required class="form-control-add ms-4 mb-3" style="width: 250px"/>
          	<span id="passwordCheckMessage" class="ms-1"></span>
          </td>
        </tr>
        <tr>
          <td>이름</td>
          <td>
            <input type="text" name="name" required class="form-control-add ms-4 mb-3" style="width: 250px"/>
          </td>
        </tr>
        <tr>
          <td>이메일</td>
          <td>
            <input
              class="form-control-add ms-4 mb-3"
              type="text"
              style="width: 250px"
            />
          </td>
        </tr>

        <tr>
          <td>우편번호</td>
          <td>
            <input
              class="form-control-add ms-4 mb-3"
              type="text"
              id="sample6_postcode"
              placeholder="우편번호"
              style="width: 150px"
            />
            <input
              class="btn"
              style="
                background: #d1d5db50;
                font-size: var(--size300);
                margin-left: 3px;
              "
              type="button"
              onclick="searchZipcode()"
              value="우편번호찾기"
            />
          </td>
        </tr>

        <tr>
          <td>주소</td>
          <td class="address">
            <input
              type="text"
              class="form-control-add ms-4"
              id="sample6_address"
              style="width: 265px; margin-right: 10px"
            />
            <input
              type="text"
              class="form-control-add mb-2"
              id="sample6_extraAddress"
              placeholder="(비고)"
              style="width: 120px"
            />
            <input
              type="text"
              class="form-control-add ms-4"
              id="sample6_detailAddress"
              placeholder="상세주소"
              style="width: 400px"
            />
          </td>
        </tr>
      </table>
	</form>
      <div>
        <button type="submit" class="login btn-pro mx-auto" >회원가입</button>
      </div>

      <div class="text-center mb-5 pb-5">
        <p>
        	이미 가입하셨나요?
          	<a href="${pageContext.request.contextPath}/login" class="text-reset mx-2 kr-700">로그인</a>
        </p>
      </div>
    </main>

    <!-- footer include -->
    <%@ include file="/WEB-INF/views/common/footer.jsp" %>
    
    
   
	<script>
	    $(document).ready(function() {
	        // 중복확인 버튼 클릭 시 처리
	        $(".checkId").on("click", function() {
	            var username = $("#username").val();  // 입력된 username 값 가져오기
	
	            if (username.length === 0) {
	                $("#idCheckMessage").text("아이디를 입력해 주세요").css("color", "red");
	                return;  // 아이디가 입력되지 않았을 때
	            }
	
	            // AJAX 요청 보내기
	            $.get("/checkId", { username: username }, function(response) {
	                if (response === "duplicated") {
	                    $("#idCheckMessage").text("이미 사용 중인 아이디입니다").css("color", "red");
	                } else {
	                    $("#idCheckMessage").text("사용 가능한 아이디입니다").css("color", "green");
	                }
	            });
	        });
	    });
	    
	    $(document).ready(function() {
            // 비밀번호 확인 일치 여부 확인
            $("#user_passwordConfirm").on("input", function() {
                var password = $("#user_password").val();
                var passwordConfirm = $(this).val();

                if (password === passwordConfirm) {
                    $("#passwordCheckMessage").text("비밀번호가 일치합니다").css("color", "green").removeClass("error").addClass("success");
                } else {
                    $("#passwordCheckMessage").text("비밀번호가 일치하지 않습니다").css("color", "red").removeClass("success").addClass("error");
                }
            });

            // 폼 제출 시 비밀번호 일치 여부 확인
            $("#signupForm").on("submit", function(event) {
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
