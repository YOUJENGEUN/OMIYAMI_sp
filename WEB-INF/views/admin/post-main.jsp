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

  <link href="../img/logo/logo1.png" rel="icon" />

  <link href="/css/bootstrap/css/bootstrap.css" rel="stylesheet" />
  <link href="/css/fonts/fonts.css" rel="stylesheet" />
  <link href="/css/variables/round.css" rel="stylesheet" />
  <link href="/css/style/btn.css" rel="stylesheet" />
  <link href="/css/style/admin.css" rel="stylesheet" />
  <link href="/css/variables/colors.css" rel="stylesheet" />

  <script src="https://kit.fontawesome.com/efcc08af8c.js" crossorigin="anonymous"></script>
  <script src="/css/bootstrap/js/admin.js"></script>

  <title>OMIYAMI</title>
</head>

<body style="background-color: var(--bluegray100)">
  <div class="main-wrapper row">
    <div class="sidebar col-lg-2 px-0">
      <div class="d-flex justify-content-center my-5 logo">
        <a href="/main.html">
          <img class="logo-img" src="../img/logo/logo.png" alt="logo" /></a>
      </div>
      <div class="nav-items" id="sidebarMenu">
        <a href="admin.html" class="nav-item kr-500" id="menu1"><i class="fa-solid fa-store"></i> OMIYAMI</a>
        <a href="Product-main.html" class="nav-item active kr-500" id="menu2"><i class="fa-solid fa-tags"></i>상품관리</a>
        <a href="order-main.html" class="nav-item kr-500" id="menu3"><i class="fa-solid fa-receipt"></i>주문관리</a>
        <a href="member-main.html" class="nav-item kr-500" id="menu4"><i class="fa-solid fa-users"></i>회원관리</a>
        <a href="post-main.html" class="nav-item kr-500" id="menu5"><i class="fa-solid fa-list-check"></i>게시물관리</a>
        <a href="Inquiry-main.html" class="nav-item kr-500" id="menu6"><i class="fa-solid fa-pen-to-square"></i>문의관리</a>
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
        <hr style="
              border: 1px solid var(--gray900);
              transform: scaleY(1.1);
              opacity: 1;
            " />
      </div>

      <div class="dashboard-container">
        <div class="order-section">
          <div class="d-flex justify-content-between" style="margin: 0px 10px">
            <div class="kr-700 mb-2" style="font-size: var(--size700)">
              공지사항
            </div>
            <div class="see-more mb-2" onclick="location.href='/admin/post-notic.html'">
              더보기
            </div>
          </div>
          <table>
            <thead class="table-head">
              <tr>
                <th>No</th>
                <th>공지 유형</th>
                <th colspan="2">제목</th>
                <th>작성자</th>
                <th>작성일</th>
              </tr>
            </thead>
            <tbody class="table-body">
              <tr class="post-list-text">
                <td>1</td>
                <td class="kr-700">&#91;일반 공지&#93;</td>
                <td colspan="2">개인정보 처리방침 일부가 변경됩니다</td>
                <td>관리자</td>
                <td style="font-size: var(--size300)">2024.09.16</td>
              </tr>
              <tr class="post-list-text">
                <td>1</td>
                <td class="kr-700">&#91;이벤트 공지&#93;</td>
                <td colspan="2">개인정보 처리방침 일부가 변경됩니다</td>
                <td>관리자</td>
                <td style="font-size: var(--size300)">2024.09.16</td>
              </tr>
              <tr class="post-list-text">
                <td>1</td>
                <td class="kr-700">&#91;일반 공지&#93;</td>
                <td colspan="2">개인정보 처리방침 일부가 변경됩니다</td>
                <td>관리자</td>
                <td style="font-size: var(--size300)">2024.09.16</td>
              </tr>
            </tbody>
          </table>
        </div>
        <div class="order-section">
          <div class="d-flex justify-content-between" style="margin: 0px 10px">
            <div class="kr-700 mb-2" style="font-size: var(--size700)">
              FAQ
            </div>
            <div class="see-more mb-2" onclick="location.href='/admin/post-FAQ.html'">
              더보기
            </div>
          </div>
          <table>
            <thead class="table-head">
              <tr>
                <th>No</th>
                <th>공지 유형</th>
                <th colspan="2">제목</th>
                <th>작성자</th>
                <th>작성일</th>
              </tr>
            </thead>
            <tbody class="table-body">
              <tr class="post-list-text">
                <td>1</td>
                <td class="kr-700">&#91;FAQ&#93;</td>
                <td colspan="2">비회원도 주문이 가능한가요?</td>
                <td>관리자</td>
                <td style="font-size: var(--size300)">2024.09.16</td>
              </tr>
              <tr class="post-list-text">
                <td>1</td>
                <td class="kr-700">&#91;FAQ&#93;</td>
                <td colspan="2">비회원도 주문이 가능한가요?</td>
                <td>관리자</td>
                <td style="font-size: var(--size300)">2024.09.16</td>
              </tr>
              <tr class="post-list-text">
                <td>1</td>
                <td class="kr-700">&#91;FAQ&#93;</td>
                <td colspan="2">비회원도 주문이 가능한가요?</td>
                <td>관리자</td>
                <td style="font-size: var(--size300)">2024.09.16</td>
              </tr>
            </tbody>
          </table>
        </div>
        <div class="order-section" style="margin-bottom: 150px">
          <div class="d-flex justify-content-between" style="margin: 0px 10px">
            <div class="kr-700 mb-2" style="font-size: var(--size700)">
              최신리뷰
            </div>
            <div class="see-more mb-2" onclick="location.href='/admin/post-review.html'">
              더보기
            </div>
          </div>
          <table>
            <thead class="table-head">
              <tr>
                <th>No</th>
                <th colspan="2">상품명</th>
                <th colspan="2">제목</th>
                <th>작성자</th>
                <th>작성일</th>
              </tr>
            </thead>
            <tbody class="table-body">
              <tr class="post-list-text">
                <td>1</td>
                <td style="width: 5%">
                  <img class="pr-or-img" src="../img/product/1/1-2.jpg" alt="상품사진" />
                </td>
                <td class="order-text" style="line-height: 1.3; text-align: left; margin-left: 5px">
                  <span class="kr-700" style="font-size: var(--size500)">롯카노츠유 미니캔</span>

                  <span>롯카노츠유</span>
                </td>
                <td class="kr-700" colspan="2">배송도 빠르고 만족합니다.</td>
                <td>가길동</td>
                <td style="font-size: var(--size300)">2024.09.16</td>
              </tr>
              <tr class="post-list-text">
                <td>1</td>
                <td style="width: 5%">
                  <img class="pr-or-img" src="../img/product/1/1-2.jpg" alt="상품사진" />
                </td>
                <td class="order-text" style="line-height: 1.3; text-align: left; margin-left: 5px">
                  <span class="kr-700" style="font-size: var(--size500)">롯카노츠유 미니캔</span>

                  <span>롯카노츠유</span>
                </td>
                <td class="kr-700" colspan="2">배송도 빠르고 만족합니다.</td>
                <td>가길동</td>
                <td style="font-size: var(--size300)">2024.09.16</td>
              </tr>

              <tr class="post-list-text">
                <td>1</td>
                <td style="width: 5%">
                  <img class="pr-or-img" src="../img/product/1/1-2.jpg" alt="상품사진" />
                </td>
                <td class="order-text" style="line-height: 1.3; text-align: left; margin-left: 5px">
                  <span class="kr-700" style="font-size: var(--size500)">롯카노츠유 미니캔</span>

                  <span>롯카노츠유</span>
                </td>
                <td class="kr-700" colspan="2">배송도 빠르고 만족합니다.</td>
                <td>가길동</td>
                <td style="font-size: var(--size300)">2024.09.16</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</body>

</html>