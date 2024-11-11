<%@page import="kr.co.sist.user.UserVO"%>
<%@page import="kr.co.sist.user.AdminMemberManageDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%
    String memberID = request.getParameter("memberID");
    AdminMemberManageDAO dao = AdminMemberManageDAO.getInstance();
    UserVO user = dao.selectOneMember(memberID);
%>

<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관리 페이지</title>

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

<!-- 내가 쓴거 -->
<link rel="shortcut icon"
	href="http://192.168.10.219/project1/common/images/favicon.ico" />
<link rel="stylesheet" type="text/css"
	href="http://192.168.10.219/project1/common/css/main_20240911.css">
<link rel="stylesheet" type="text/css"
	href="http://192.168.10.219/project1/common/css/main_Sidbar.css">

<!-- jQuery CDN -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<style type="text/css">
</style>

<script type="text/javascript">
	$(function() {

		$("#update").click(function() {
	        if (confirm("수정하시겠습니까?")) {
	            // 수정 Ajax 요청
	            $.ajax({
	                url: "updateMember.jsp", // 서버의 수정 URL
	                type: "POST",
	                data: {
	                    memberId: $("#memberId").val(),  // 예시로 회원 ID를 전송
	                    memberName: $("#memberName").val(),  // 예시로 수정할 회원 이름 전송
	                    // 필요한 다른 데이터 추가
	                },
	                success: function(response) {
	                    if (response === "success") {
	                        alert("정상적으로 수정되었습니다.");
	                        window.location.href = "memberList.jsp";
	                    } else {
	                        alert("수정에 실패했습니다. 다시 시도해 주세요.");
	                    }
	                },
	                error: function() {
	                    alert("서버 오류가 발생했습니다. 다시 시도해 주세요.");
	                }
	            });
	        }
	    });

	    $("#delete").click(function() {
	        if (confirm("삭제하시겠습니까?")) {
	            // 삭제 Ajax 요청
	            $.ajax({
	                url: "deleteMember.jsp", // 서버의 삭제 URL
	                type: "POST",
	                data: {
	                    memberId: $("#memberId").val()  // 예시로 회원 ID를 전송
	                },
	                success: function(response) {
	                    if (response === "success") {
	                        alert("회원번호: " + $("#memberId").val() + "번이 삭제되었습니다.");
	                        window.location.href = "memberList.jsp";
	                    } else {
	                        alert("삭제에 실패했습니다. 다시 시도해 주세요.");
	                    }
	                },
	                error: function() {
	                    alert("서버 오류가 발생했습니다. 다시 시도해 주세요.");
	                }
	            });
	        }
	    });

	    $("#list").click(function() {
	        window.location.href = "memberList.jsp";
	    });


	});// ready
</script>

</head>


<body>

	<jsp:include page="sidebar.jsp"></jsp:include>

	<!-- 메인 콘텐츠 영역 -->
	<div class="main-content">
		<div class="content-box" id="sub-title">
			<h4>회원관리</h4>
		</div>

		<div class="content-box">
			<h2>회원 수정</h2>
			<table class="table">
				<colgroup>
					<col width="40%">
					<col width="60%">
				</colgroup>
				<tbody>

					<%
					String id = request.getParameter("memberID");
					%>
					<tr>
						<th>회원ID</th>
						<td><input type="text" name="custno" value="<%=id%>"
							readonly="readonly"></td>
					</tr>
					<tr>
						<th>회원성명</th>
						<td><input type="text" name="custname" /></td>
					</tr>
					<tr>
						<th>회원주소</th>
						<td><input type="text" name="zipcode" style="width: 80px;" /><br>
						<input type="text" name="address" /></td>
					</tr>
					<tr>
						<th>가입일자</th>
						<td><input type="text" name="joindate" /></td>
					</tr>

					<tr>
						<th>이메일</th>
						<td><input type="text" name="email" /></td>
					</tr>

				</tbody>
			</table>

			<div class="btn_group" style="text-align: center">
				<button type="submit" id="update">수정</button>
				<button type="submit" id="delete">삭제</button>
				<button type="submit" id="list">목록</button>

			</div>


		</div>

	</div>

</body>
</html>