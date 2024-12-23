<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원관리 페이지</title>

<!-- 부트스트랩 CDN -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="http://192.168.10.225/first_prj/prj/main_Sidbar.css">
<!-- 내가 쓴거 -->
<link rel="shortcut icon"
	href="http://192.168.10.225/first_prj/common/images/favicon.ico" />
<link rel="stylesheet" type="text/css"
	href="http://192.168.10.225/first_prj/common/css/main_20240911.css">
<link rel="stylesheet" type="text/css"
	href="http://192.168.10.225/first_prj/common/css/main_Sidbar.css">

<!-- jQuery CDN -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<style type="text/css">
#member-table {
	min-height: 500px;
}
</style>

<script type="text/javascript">
$(function(){
	// 페이지네이션 버튼 클릭 시
});
</script>


</head>


<body>
    <!-- 헤더와 사이드바 임포트-->
        <c:import url="/prj/sidebar.jsp"/>


	<!-- 메인 콘텐츠 영역 -->
	<div class="main-content">
		<form action="editMember.jsp" method="post">
			<div class="content-box" id="sub-title">
				<h4>회원관리</h4>
			</div>

			<div class="content-box" id="member-table">
				<h2>회원목록</h2>
				<table class="table">
				<jsp:useBean id="uVO" class="kr.co.sist.user.UserVO" scope="page"/>
				<jsp:useBean id="amVO" class="kr.co.sist.user.AdminMemberVO" scope="page"/>
				
				
					<colgroup>
						<col width="11%">
						<col width="11%">
						<col width="17%">
						<col width="24%">
						<col width="15%">
						<col width="11%">
						<col width="15%">
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
					<tr>
						<td><a href="editMember.jsp?memberID=admin">test_user</a></td>
						<td>테스트</td>
						<td>010-1111-2222</td>
						<td>경기 성남시 분당구 대왕판교로 477 테스트</td>
						<td>24/11/12</td>
						<td colspan="2">test@test.com</td>
					</tr>
					<tr>
						<td><a href="editMember.jsp?memberID=admin">test</a></td>
						<td>테스트</td>
						<td>010-1111-2222</td>
						<td>경기 성남시 분당구 대왕판교로 477 테스트</td>
						<td>24/10/28</td>
						<td colspan="2">test@test.com</td>
					</tr>
					<tr>
						<td><a href="editMember.jsp?memberID=admin">user1</a></td>
						<td>박민준</td>
						<td>010-1234-5678</td>
						<td>서울시 강남구 쌍용교육센터</td>
						<td>24/10/21</td>
						<td colspan="2">usermail@naver.com</td>
					</tr>
					<tr>
						<td><a href="editMember.jsp?memberID=admin">user2</a></td>
						<td>김석원</td>
						<td>010-1234-5678</td>
						<td>서울시 노원구 쌍용교육센터</td>
						<td>24/10/21</td>
						<td colspan="2">usermail2@naver.com</td>
					</tr>
					<tr>
						<td><a href="editMember.jsp?memberID=admin">user3</a></td>
						<td>신동빈</td>
						<td>010-1234-5678</td>
						<td>부산광역시 롯데정보통신</td>
						<td>22/05/21</td>
						<td colspan="2">usermail3@naver.com</td>
					</tr>
					<tr>
						<td><a href="editMember.jsp?memberID=admin">user4</a></td>
						<td>김성심</td>
						<td>010-1234-5678</td>
						<td>대전광역시 빵공장</td>
						<td>18/02/10</td>
						<td colspan="2">usermail4@naver.com</td>
					</tr>
					</tbody>
				</table>


<div class="page-nation" style="text-align: center">
</div>

			</div>
		</form>
	</div>

</body>
</html>
