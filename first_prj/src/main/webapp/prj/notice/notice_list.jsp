<%@page import="kr.co.sist.notice.SearchVO"%>
<%@page import="kr.co.sist.notice.NoticeVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.notice.MangeNoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" info="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>공지사항 리스트 페이지</title>
  <link rel="stylesheet" href="http://192.168.10.225/first_prj/prj/admin.css">
  <link rel="stylesheet" href="http://192.168.10.225/first_prj/prj/main_Sidbar.css">

  <!-- Bootstrap CDN -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

  <style>
     /* 상단 고정 헤더 */
      .header {
         position: fixed;
         top: 0;
         left: 0;
         width: 100%;
         background-color: #2D3539;
         color: white;
         padding: 15px;
         display: flex;
         justify-content: space-between;
         z-index: 1000;
      }
  
      .notice_title {
          height: 10%;
          border: 1px solid #333;
          font-weight: bold;
          font-size: 30pt;
          border-radius: 20px;
          text-align: center;
      }

      .notice_list {
          height: 70%;
          margin-top: 20px;
          padding-top: 20px;
          border: 1px solid #333;
          border-radius: 20px;
      }

      .button-group {
          margin-top: 20px;
          margin-right: 20px;
          text-align: right;
      }
  </style>
</head>

  <script>
   
  </script>
</html>


</head>
<body>

    <!-- 헤더와 사이드바 임포트-->
        <c:import url="/prj/sidebar.jsp"/>


<!-- 메인 콘텐츠 영역 -->
<div class="main-content">
  <div class="content-box">
    <div class="notice_title">공지사항 리스트</div>

    <div class="notice_list">
      	<jsp:useBean id="nVO" class="kr.co.sist.notice.NoticeVO" scope="page"/>
        <jsp:useBean id="sVO" class="kr.co.sist.notice.SearchVO" scope="page"/>
    	<% 
        MangeNoticeDAO mnDAO = MangeNoticeDAO.getInstance();
        int pageSize = 8; // 한 페이지당 게시물 수
        String pageParam = request.getParameter("page");
        int currentPage = (pageParam != null) ? Integer.parseInt(pageParam) : 1; // 기본 페이지 1
        int totalCount = mnDAO.selectTotalCount(sVO);
        int totalPages = (int) Math.ceil((double) totalCount / pageSize); // 전체 페이지 수 계산
        int startRow = (currentPage - 1) * pageSize; // 시작 행 번호
        List<NoticeVO> listnotice = mnDAO.selectAllNotice(startRow, pageSize); // 페이지별 공지사항 조회
        request.setAttribute("totalCount", totalCount);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("currentPage", currentPage);
      %>
      <span style="text-align: left; margin-left: 10px">공지사항 목록(총 14개)</span>
     
      <table class="table table-hover" style="text-align: center">
        <thead>
        <tr>
          <th><input type="checkbox" id="selectAll"></th>
          <th>번호</th>
          <th>카테고리</th>
          <th>제목</th>
          <th>작성자</th>
          <th>작성 일시</th>
        </tr>
        </thead>
        <tbody class="table-group-divider">
        <%
            if (listnotice != null && !listnotice.isEmpty()) {
              for (NoticeVO tempVO : listnotice) {
          %>
            <tr>
              <td><input type="checkbox" class="selectItem" value="<%= tempVO.getNotice_id() %>"></td>
              <td><%= tempVO.getNotice_id() %></td>
              <td><%= tempVO.getCategory_id() %></td>
              <td><a href="notice_update.jsp"><%= tempVO.getTitle() %></a></td>
              <td><%= tempVO.getAdmin_Id() %></td>
              <td><%= tempVO.getCreated_at() %></td>
            </tr>
          <% 
              }
            }
          %>
        </tbody>
      </table>
    </div>
    <div>
      <div class="button-group">
        <button class="btn btn-success" id="createBtn" onclick="location.href='notice_add.jsp'">공지사항 등록</button>
        <button class="btn btn-danger" id="deleteBtn">선택 삭제</button>
      </div>
      <div class="page-nation" style="text-align: center">
         <ul class="pagination">
        <li class="page-item <%= (currentPage == 1) ? "disabled" : "" %>">
          <a class="page-link" href="notice_list.jsp?page=1">첫 페이지</a>
        </li>
        <li class="page-item <%= (currentPage == 1) ? "disabled" : "" %>">
          <a class="page-link" href="notice_list.jsp?page=<%= currentPage - 1 %>">이전</a>
        </li>
        <% for (int i = 1; i <= totalPages; i++) { %>
          <li class="page-item <%= (i == currentPage) ? "active" : "" %>">
            <a class="page-link" href="notice_list.jsp?page=<%= i %>"><%= i %></a>
          </li>
        <% } %>
        <li class="page-item <%= (currentPage == totalPages) ? "disabled" : "" %>">
          <a class="page-link" href="notice_list.jsp?page=<%= currentPage + 1 %>">다음</a>
        </li>
        <li class="page-item <%= (currentPage == totalPages) ? "disabled" : "" %>">
          <a class="page-link" href="notice_list.jsp?page=<%= totalPages %>">마지막 페이지</a>
        </li>
      </ul>
      </div>
    </div>
  </div>

</div>

</body>
</html>
