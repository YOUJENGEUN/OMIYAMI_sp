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

    <link href="../css/style/main.css" rel="stylesheet" />
    <link href="../css/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="../css/fonts/fonts.css" rel="stylesheet" />
    <link href="../css/variables/colors.css" rel="stylesheet" />
    <link href="../css/variables/round.css" rel="stylesheet" />
    <link href="../css/style/btn.css" rel="stylesheet" />
    <link href="../css/style/mypageMain.css" rel="stylesheet" />

    <script
      src="https://kit.fontawesome.com/efcc08af8c.js"
      crossorigin="anonymous"
    ></script>
    <script src="../css/bootstrap/js/main.js"></script>
    <title>OMIYAMI</title>
  </head>

  <body style="background-color: var(--trueGray50)">
    <!-- scroll up  -->
    <div class="scroll-top" id="scrollUp">
      <i
        class="fa-solid fa-cloud kr-700"
        style="font-size: var(--size900); color: var(--indigo100)"
      ></i>
      <i
        class="fa-solid fa-plane-up kr-700"
        style="font-size: var(--size900); color: var(--rose300)"
      ></i>
    </div>

    <!-- main start  -->
    <header>
      <nav class="navbar navbar-expand-xl">
        <div class="container-fluid">
          <a class="navbar-brand" href="../main.html">
            <img
              class="logo-img"
              src="../img/logo/logo.png"
              alt="OMIYAMI"
              width="65"
              height="65"
            />
          </a>

          <div
            class="nav-li collapse navbar-collapse"
            id="navbarSupportedContent"
          >
            <div class="nav-right kr-600">
              <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                  <a class="nav-link" href="../login/login.html">로그인</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="../signup/signup.html">회원가입 </a>
                </li>
              </ul>
            </div>

            <div class="nav-center">
              <form class="d-flex" role="search">
                <input
                  class="searchform form-control me-4 kr-500"
                  type="search"
                  placeholder="OMIYAMI에서 최고의 선물을 찾아보세요"
                  aria-label="Search"
                />
                <button
                  class="btn btn-lg"
                  type="submit"
                  style="font-weight: 600"
                >
                  찾기
                </button>
              </form>
            </div>

            <div class="nav-left">
              <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                  <a class="nav-link" href="../mypage/mypageMain.html">
                    <i
                      class="fa-solid fa-user"
                      style="font-size: var(--size550)"
                    ></i>
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="../checkout/cart.html">
                    <i
                      class="fa-solid fa-cart-shopping"
                      style="font-size: var(--size550)"
                    ></i>
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link kr-700" href="#">JP </a>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </nav>

      <nav class="menu d-flex align-items-center justify-content-center mt-2">
        <ul class="nav nav-fill w-80 d-flex">
          <li class="nav-item">
            <a href="../product/productList.html" class="menu-font"
              >홋카이도/토호쿠</a
            >
          </li>

          <li class="nav-item">
            <a href="../product/productList_1.html" class="menu-font"
              >칸토/츄부</a
            >
          </li>

          <li class="nav-item">
            <a href="../product/productList_2.html" class="menu-font">간사이</a>
          </li>

          <li class="nav-item">
            <a href="../product/productList_3.html" class="menu-font"
              >츄고쿠/시코쿠</a
            >
          </li>

          <li class="nav-item">
            <a href="../product/productList_4.html" class="menu-font"
              >큐슈/오키나와</a
            >
          </li>

          <li class="nav-item">
            <a href="../customerservice/notices.html" class="menu-font"
              >공지사항</a
            >
          </li>

          <li class="nav-item">
            <a href="../customerservice/inquiryForm.html" class="menu-font"
              >1:1</a
            >
          </li>
        </ul>
      </nav>
    </header>
    <!-- header end -->

    <div class="mypage-wrapper my-5">
      <div class="container mt-5">
        <div class="section-title-in kr-700" style="font-size: var(--size800)">
          마이페이지
        </div>
        <hr
          style="
            border: 1px solid var(--gray900);
            transform: scaleY(1.1);
            opacity: 1;
          "
        />

        <div class="row">
          <!-- sidebar -->
          <div class="col">
            <div class="list-group" id="sidebar-menu">
              <div class="list-group-title">쇼핑정보</div>
              <ul>
                <li><a href="orderList.html">주문/배송</a></li>
                <li><a href="orderCancel.html">취소/환불</a></li>
                <li><a href="../checkout/cart.html">장바구니</a></li>
              </ul>

              <div class="list-group-title">혜택정보</div>
              <ul>
                <li><a href="point.html">포인트/쿠폰</a></li>
              </ul>

              <div class="list-group-title">나의정보</div>
              <ul>
                <li>
                  <a href="../customerservice/inquiryForm.html">1:1 문의</a>
                </li>
                <li><a href="modifyForm.html">회원정보 수정</a></li>
                <li><a href="modifyFormdel.html">회원탈퇴</a></li>
              </ul>
            </div>
          </div>

          <!-- content -->
          <div class="col-10">
            <div class="user-check">
              <div class="user-check-name">
                <div><span style="font-weight: 600">홍길동</span> 님</div>
              </div>

              <div class="user-check-item">
                <div>주문/취소</div>
                <span style="font-weight: 600">7/4</span>
              </div>

              <div class="user-check-item">
                <div>포인트</div>
                <span style="font-weight: 600">97 P</span>
              </div>

              <div class="user-check-item">
                <div>쿠폰</div>
                <span style="font-weight: 600">2</span>
              </div>
            </div>

            <div class="text-left mt-4">주문처리 근황</div>
            <hr style="border: 1px solid var(--gray600); opacity: 1" />

            <div class="uorder-check kr-600">
              <div class="uorder-check-item">
                <div>결제 전</div>
              </div>
              <i
                class="fa-solid fa-greater-than"
                style="color: var(--gray600)"
              ></i>
              <div class="uorder-check-item">
                <div>결제 완료</div>
              </div>
              <i
                class="fa-solid fa-greater-than"
                style="color: var(--gray600)"
              ></i>
              <div class="uorder-check-item">
                <div>상품 준비중</div>
              </div>
              <i
                class="fa-solid fa-greater-than"
                style="color: var(--gray600)"
              ></i>
              <div class="uorder-check-item">
                <div>배송중</div>
              </div>
              <i
                class="fa-solid fa-greater-than"
                style="color: var(--gray600)"
              ></i>
              <div class="uorder-check-item">
                <div>배송완료</div>
              </div>
            </div>

            <br /><br />

            <div class="text-left mt-4">최근 주문상품</div>
            <hr style="border: 1px solid var(--gray600); opacity: 1" />

            <div class="order-container">
              <table class="table table-borderless mb-5">
                <thead>
                  <tr>
                    <td class="table-title">주문번호</td>
                    <td class="table-title">상품정보</td>
                    <td class="table-title">수량</td>
                    <td class="table-title">주문금액</td>
                    <td class="table-title">주문상태</td>
                  </tr>
                </thead>
                <tbody>
                  <!-- product data -->
                  <tr>
                    <td valign="middle">
                      <div
                        style="text-align: center"
                        onclick="location.href='orderInfo.html'"
                      >
                        20240823112233
                      </div>
                    </td>

                    <td>
                      <div class="product-info">
                        <div class="product-image"></div>
                        <div class="ms-2">
                          <p class="mb-1 table-sub" valign="middle">브랜드명</p>
                          <p class="mb-1 table-sub" valign="middle">상품명</p>
                          <p class="mb-1 table-sub" valign="middle">옵션</p>
                        </div>
                      </div>
                    </td>
                    <td valign="middle">
                      <div style="text-align: center">1</div>
                    </td>

                    <td valign="middle">
                      <div style="text-align: center">16,000</div>
                    </td>

                    <td valign="middle">
                      <div style="text-align: center">배송준비중</div>
                    </td>
                  </tr>
                </tbody>
                <tbody>
                  <!-- product data -->
                  <tr>
                    <td valign="middle">
                      <div style="text-align: center">20240823112233</div>
                    </td>

                    <td>
                      <div class="product-info">
                        <div class="product-image"></div>
                        <div class="ms-2">
                          <p class="mb-1 table-sub" valign="middle">브랜드명</p>
                          <p class="mb-1 table-sub" valign="middle">상품명</p>
                          <p class="mb-1 table-sub" valign="middle">옵션</p>
                        </div>
                      </div>
                    </td>
                    <td valign="middle">
                      <div style="text-align: center">1</div>
                    </td>

                    <td valign="middle">
                      <div style="text-align: center">16,000</div>
                    </td>

                    <td valign="middle">
                      <div style="text-align: center">배송준비중</div>
                    </td>
                  </tr>
                </tbody>
                <tbody>
                  <!-- product data -->
                  <tr>
                    <td valign="middle">
                      <div style="text-align: center">20240823112233</div>
                    </td>

                    <td>
                      <div class="product-info">
                        <div class="product-image"></div>
                        <div class="ms-2">
                          <p class="mb-1 table-sub" valign="middle">브랜드명</p>
                          <p class="mb-1 table-sub" valign="middle">상품명</p>
                          <p class="mb-1 table-sub" valign="middle">옵션</p>
                        </div>
                      </div>
                    </td>
                    <td valign="middle">
                      <div style="text-align: center">1</div>
                    </td>

                    <td valign="middle">
                      <div style="text-align: center">16,000</div>
                    </td>

                    <td valign="middle">
                      <div style="text-align: center">배송준비중</div>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
          <nav aria-label="Page navigation example mb-5">
            <ul class="pagination">
              <li class="page-item">
                <a class="page-link" href="#" aria-label="Previous">
                  <span aria-hidden="true">&laquo;</span>
                </a>
              </li>
              <li class="page-item"><a class="page-link" href="#">1</a></li>
              <li class="page-item"><a class="page-link" href="#">2</a></li>
              <li class="page-item"><a class="page-link" href="#">3</a></li>
              <li class="page-item">
                <a class="page-link" href="#" aria-label="Next">
                  <span aria-hidden="true">&raquo;</span>
                </a>
              </li>
            </ul>
          </nav>
        </div>
      </div>
    </div>

    <!-- content end -->

    <!-- FOOTER START-->
    <footer>
      <div class="navbar navbar-expand-xl">
        <div class="container-fluid">
          <div class="nav-li collapse navbar-collapse">
            <div class="nav-right kr-800" style="font-size: var(--size300)">
              <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                  <a class="nav-link" href="#">회사소개</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">이용약관</a>
                </li>
                <li>
                  <a class="nav-link" href="#">개인정보처리방침</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">청소년보호방침</a>
                </li>
                <li>
                  <a class="nav-link" href="#">입점/제휴문의</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">대량구매문의</a>
                </li>
                <li>
                  <a class="nav-link" href="#">매장안내</a>
                </li>
              </ul>
            </div>
            <div class="nav-left kr-800" style="font-size: var(--size300)">
              <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                  <a class="nav-link" href="#">판매자서비스</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">파트너센터</a>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <hr style="border-width: 2px" />

      <div class="navbar navbar-expand-xl" style="color: var(--bs-gray600)">
        <div class="container-fluid">
          <div class="nav-li collapse navbar-collapse">
            <div class="nav-right">
              <div class="footer-left">
                <p class="mb-1 kr-800" style="font-size: var(--size400)">
                  (주)OMIYAMI
                </p>
                <span style="font-size: var(--size200)">
                  대표이사: 오미야 | 서울특별시 가나구 다라동 오미빌딩 10층
                  1111호 | 사업자 등록번호: 1111-22-333444 | 통신판매업신고:
                  2023-서울다라동-5555
                </span>
                <br />
                <span style="font-size: var(--size200)">
                  고객센터: 1566-1122 | 팩스: 02-1111-2222
                </span>
              </div>
              <div class="pt-3">
                <p class="mb-1 kr-900" style="font-size: var(--size300)">
                  소비자 피해보상
                </p>
                <span style="font-size: var(--size200)">
                  고객님은 안전거래를 위해 현금등으로 결제시 저희 쇼핑몰에서
                  가입한 구매안전 서비스로 소비자 피해보상 보험 서비스를
                  이용하실 수 있습니다.
                </span>
                <p class="copyright pt-1" style="font-size: var(--size200)">
                  © 2024 cRc SYSTEM. All Rights Reserved.
                </p>
              </div>
            </div>

            <div class="nav-left kr-700">
              <div class="footer-right">
                <p class="mb-1" style="font-size: var(--size400)">Contact us</p>

                <div>
                  <p class="mb-1 kr-900" style="font-size: var(--size500)">
                    1234-5678
                  </p>
                  <span style="font-size: var(--size200)">
                    상담가능 시간: 평일 10:00~18:00 <br />
                    Email: OMIYAMI@admin.com
                  </span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </footer>
    <!-- FOOTER END-->
  </body>
</html>
