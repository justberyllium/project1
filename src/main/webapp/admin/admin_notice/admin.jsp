<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" info=""%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>관리 페이지</title>
  <link rel="stylesheet" href="admin.css">

  <!-- Bootstrap CDN -->
  <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet">
  <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

  <style>
  </style>
</head>
<body>

<!-- 상단 고정 헤더 -->
<div class="header">
  <span>스마트스토어 센터</span> <span>로그인 상태</span>
</div>

<!-- 좌측 고정 사이드바 -->
<div class="sidebar">
  <h3>관리자 명</h3>
  <div class="accordion" id="accordionSidebar">
    <!-- 상품 관리 -->
    <div class="accordion-item">
      <h2 class="accordion-header" id="headingOne">
        <button class="accordion-button collapsed" type="button"
                data-bs-toggle="collapse" data-bs-target="#collapseOne"
                aria-expanded="false" aria-controls="collapseOne">상품 관리</button>
      </h2>
      <div id="collapseOne" class="accordion-collapse collapse"
           aria-labelledby="headingOne" data-bs-parent="#accordionSidebar">
        <div class="accordion-body">
          <a href="#">상품 조회/수정</a> <a href="#">상품 등록</a>
        </div>
      </div>
    </div>

    <!-- 판매 관리 -->
    <div class="accordion-item">
      <h2 class="accordion-header" id="headingTwo">
        <button class="accordion-button collapsed" type="button"
                data-bs-toggle="collapse" data-bs-target="#collapseTwo"
                aria-expanded="false" aria-controls="collapseTwo">판매 관리</button>
      </h2>
      <div id="collapseTwo" class="accordion-collapse collapse"
           aria-labelledby="headingTwo" data-bs-parent="#accordionSidebar">
        <div class="accordion-body">
          <a href="#">판매 리스트</a>
        </div>
      </div>
    </div>

    <!-- 문의 관리 -->
    <div class="accordion-item">
      <h2 class="accordion-header" id="headingFour">
        <button class="accordion-button collapsed" type="button"
                data-bs-toggle="collapse" data-bs-target="#collapseFour"
                aria-expanded="false" aria-controls="collapseFour">문의 관리
        </button>
      </h2>
      <div id="collapseFour" class="accordion-collapse collapse"
           aria-labelledby="headingFour" data-bs-parent="#accordionSidebar">
        <div class="accordion-body">
          <a href="#">문의 리스트</a>
        </div>
      </div>
    </div>

    <!-- 리뷰 관리 -->
    <div class="accordion-item">
      <h2 class="accordion-header" id="headingFive">
        <button class="accordion-button collapsed" type="button"
                data-bs-toggle="collapse" data-bs-target="#collapseFive"
                aria-expanded="false" aria-controls="collapseFive">리뷰 관리
        </button>
      </h2>
      <div id="collapseFive" class="accordion-collapse collapse"
           aria-labelledby="headingFive" data-bs-parent="#accordionSidebar">
        <div class="accordion-body">
          <a href="#">리뷰 리스트</a>
        </div>
      </div>
    </div>

    <!-- 공지사항 관리 -->
    <div class="accordion-item">
      <h2 class="accordion-header" id="headingSix">
        <button class="accordion-button collapsed" type="button"
                data-bs-toggle="collapse" data-bs-target="#collapseSix"
                aria-expanded="false" aria-controls="collapseSix">공지사항 관리
        </button>
      </h2>
      <div id="collapseSix" class="accordion-collapse collapse"
           aria-labelledby="headingSix" data-bs-parent="#accordionSidebar">
        <div class="accordion-body">
          <a href="notice_list.jsp">공지사항 리스트</a> <a href="notice_add.jsp">공지사항 등록</a>
        </div>
      </div>
    </div>

    <!-- 회원 관리 -->
    <div class="accordion-item">
      <h2 class="accordion-header" id="headingSeven">
        <button class="accordion-button collapsed" type="button"
                data-bs-toggle="collapse" data-bs-target="#collapseSeven"
                aria-expanded="false" aria-controls="collapseSeven">회원 관리</button>
      </h2>
      <div id="collapseSeven" class="accordion-collapse collapse"
           aria-labelledby="headingSeven" data-bs-parent="#accordionSidebar">
        <div class="accordion-body">
          <a href="#">회원 목록</a>
        </div>
      </div>
    </div>

  </div>
</div>

<!-- 메인 콘텐츠 영역 -->
<div class="main-content">
  <div class="content-box">컨텐츠 공간 1</div>
  <div class="content-box">컨텐츠 공간 2</div>
  <div class="content-box">컨텐츠 공간 3</div>
  <div class="content-box">컨텐츠 공간 4</div>
  <script>
      $(function () {
          $('#addBtn').click(() => {
              location.href='notice_add.jsp'
          })
      });
  </script>
</div>

</body>
</html>