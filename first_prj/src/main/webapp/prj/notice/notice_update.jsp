<%@page import="kr.co.sist.notice.MangeNoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" info="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>관리 페이지</title>
  <link rel="stylesheet" href="admin.css">

  <!-- Bootstrap CDN -->
  <link rel="stylesheet" href="http://192.168.10.225/first_prj/prj/main_Sidbar.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

  <style>
    .notice_title {
        height: 10%;
        border: 1px solid #333;
        font-weight: bold;
        font-size: 30pt;
        border-radius: 20px;
        text-align: center;
    }
    .notice_list {
        height: 80%;
        margin-top: 20px;
        padding-top: 20px;
        border: 1px solid #333;
        border-radius: 20px;
    }
    .notice-form {
        width: 100%;
        border-collapse: separate;
        border-spacing: 0 15px;
    }
    .notice-form .label {
        width: 150px;
        text-align: left;
        padding-right: 20px;
        vertical-align: top;
    }
    .notice-form .required {
        color: red;
        margin-right: 5px;
    }
    .notice-form input, .notice-form select, .notice-form textarea {
        width: 100%;
    }
    .button-group {
        text-align: center;
    }
    .button-group .btn {
        width: 150px;
        height: 50px;
    }
  </style>
</head>
<body>

<!-- 헤더와 사이드바 임포트-->
  <c:import url="/prj/sidebar.jsp"/>

<!-- 좌측 고정 사이드바 -->
<div class="sidebar">
  <h3>관리자 명</h3>
  <div class="accordion" id="accordionSidebar">
    <!-- 상품 관리 -->
    <div class="accordion-item">
      <h2 class="accordion-header" id="headingOne">
        <button class="accordion-button collapsed" type="button"
                data-bs-toggle="collapse" data-bs-target="#collapseOne"
                aria-expanded="false" aria-controls="collapseOne">상품 관리
        </button>
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
                aria-expanded="false" aria-controls="collapseTwo">판매 관리
        </button>
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
                aria-expanded="false" aria-controls="collapseSeven">회원 관리
        </button>
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
<jsp:useBean id="nVO" class="kr.co.sist.notice.NoticeVO" scope="page"/>
<!-- 메인 콘텐츠 영역 -->
<div class="main-content">
  <div class="content-box">
    <div class="notice_title">공지사항 수정</div>
    <div class="notice_list">
    
      <table class="table notice-form">
        <tr>
          <td class="label"><span class="required">*</span>분류</td>
          <td><select name="category" id="category" style="width: 20%">
            <option value="N/A">선택하세요</option>
            <option value="delivery">1</option>
            <option value="order">2</option>
            <option value="why">3</option>
          </select></td>
        </tr>
         <tr>
        <td class="label"><span class="required">*</span>제목</td>
        <td><input type="text" id="title" value="<%= nVO.getTitle() %>"></td>
    </tr>
    <tr>
        <td class="label"><span class="required">*</span>공지사항 상세</td>
        <td><textarea id="content" rows="10" placeholder="선택한 공지사항의 내용 출력" style="resize:none;"><%= nVO.getContent() %></textarea></td>
    </tr>
      </table>
      <div class="button-group">
        <button class="btn btn-success" id="updateBtn">수정</button>
        <button class="btn btn-warning" id="cancelBtn">취소</button>
      </div>
    </div>
  </div>
<script>
$(function () {
    $('#updateBtn').click(function () {
        if (!$('#title').val()) {
            alert("제목을 입력해 주세요.");
            return;
        }
        if (!$('#content').val()) {
            alert("내용을 입력해 주세요.");
            return;
        }
        if ($('#categoryId').val() === "N/A") {
            alert("카테고리를 선택해 주세요.");
            return;
        }

        var param = {
            title: $('#title').val(),
            content: $('#content').val(),
            categoryId: $('#categoryId').val(),
            noticeId: $('#noticeId').val()
        };

        $.ajax({
            url: "update_notice.jsp",
            type: "post",
            data: param,
            dataType: "json",
            error: function (xhr) {
                console.log(xhr.status);
                alert("공지사항이 정상적으로 수정되지 못하였습니다");
            },
            success: function (jsonObj) {
                if (jsonObj.result) {
                    if (!jsonObj.updateStatus) {
                        alert("공지사항 수정에 실패하였습니다.");
                    } else {
                        alert("공지사항이 성공적으로 수정되었습니다.");
                        location.href = "notice_list.jsp"; // 수정 완료 후 notice_list.jsp로 이동
                    }
                } else {
                    alert("요청이 실패했습니다. 서버 오류가 발생했습니다.");
                }
            }
        });
    });

    $('#cancelBtn').click(() => {
        location.href = 'notice_list.jsp';
    });
});
</script>
</div>
</body>
</html>