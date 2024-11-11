<%@page import="kr.co.sist.user.AdminMemberVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.user.UserVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.user.AdminMemberManageDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관리 페이지</title>

<!-- 부트스트랩 및 jQuery -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<!-- 스타일 -->
<style type="text/css">
#member-table { min-height: 500px; }
</style>
</head>

<body>
	<jsp:include page="sidebar.jsp"></jsp:include>

	<!-- 메인 콘텐츠 영역 -->
	<div class="main-content">
		<form action="editMember.jsp" method="post">
			<div class="content-box" id="sub-title">
				<h4>회원관리</h4>
			</div>

			<div class="content-box" id="member-table">
				<h2>회원목록</h2>
				<jsp:useBean id="amVO" class="kr.co.sist.user.AdminMemberVO" scope="page"/>
				<table class="table">
				<%
					int totalCount=0;
					AdminMemberManageDAO ammDAO = AdminMemberManageDAO.getInstance();
					int pageScale = 7;
					String paramPage = request.getParameter("currentPage");
					int currentPage = (paramPage != null) ? Integer.parseInt(paramPage) : 1;

					int startNum = currentPage * pageScale - pageScale + 1;
					int endNum = startNum + pageScale - 1;

					amVO.setCurrntPage(currentPage);
					amVO.setEndNum(endNum);
					amVO.setStartNum(startNum);

					List<UserVO> listUser = null;
					try {
						listUser = ammDAO.selectAllMember(amVO);
					} catch(SQLException se) {
						se.printStackTrace();
					}
					
					
				%>
					<colgroup>
						<col width="11%"><col width="11%"><col width="17%">
						<col width="24%"><col width="15%"><col width="11%"><col width="15%">
					</colgroup>

					<thead class="table-light" align="center">
						<tr>
							<th>회원ID</th>
							<th>회원성명</th>
							<th>전화번호</th>
							<th>주소</th>
							<th>가입일자</th>
							<th colspan="2">이메일</th>
						</tr>
					</thead>

					<tbody align="center">
					<%
						if (listUser != null && !listUser.isEmpty()) {
							for (UserVO tempVO : listUser) {
					%>
						<tr>
							<td><a href="editMember.jsp?memberID=<%= tempVO.getUserId() %>"><%= tempVO.getUserId() %></a></td>
							<td><%= tempVO.getName() %></td>
							<td><%= tempVO.getPhone() %></td>
							<td><%= tempVO.getAddress1() %></td>
							<td><%= tempVO.getJoinDate() %></td>
							<td colspan="2"><%= tempVO.getEmail() %></td>
						</tr>
					<%
							}
						} else {
					%>
						<tr>
							<td colspan="7">등록된 회원이 없습니다.</td>
						</tr>
					<%
						}
					%>
					
					</tbody>
				</table>
			</div>
		</form>
	</div>
</body>
</html>
