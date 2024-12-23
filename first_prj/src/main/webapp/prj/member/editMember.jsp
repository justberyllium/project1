<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원 수정</title>

<!-- 부트스트랩 CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
    // 수정 버튼 클릭 시
    $("#update").click(function() {
        if (confirm("수정하시겠습니까?")) {
            alert("회원이 수정되었습니다.");
        }
    });

    // 삭제 버튼 클릭
    $("#delete").click(function() {
        if (confirm("삭제하시겠습니까?")) {
            alert("회원이 삭제되었습니다.");
        }
    });

    // 목록 버튼 클릭
    $("#list").click(function() {
        window.location.href = "memberList.jsp";
    });
});
</script>

</head>
<body>

  <!-- 좌측 고정 사이드바 -->
   <div class="sidebar" id="sidebar">
       <c:import url="/prj/sidebar.jsp"/>
   </div>

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
					<tr>
						<th>회원ID</th>
						<td><input type="text" id="memberId" value="test_user" readonly="readonly"></td>
					</tr>
					<tr>
						<th>회원성명</th>
						<td><input type="text" id="memberName" value="테스트" /></td>
					</tr>
					<tr>
						<th>회원주소</th>
						<td>
							<input type="text" id="zipcode" value="13480" style="width: 80px;" />
							<input type="text" id="address" style="width: 60%" value="경기 성남시 분당구 대왕판교로 477 테스트" />
						</td>
					</tr>
					<tr>
						<th>가입일자</th>
						<td><input type="text" id="joindate" value="24/11/12" readonly="readonly"></td>
					</tr>

					<tr>
						<th>이메일</th>
						<td><input type="text" id="email" value="test@test.com" /></td>
					</tr>

				</tbody>
			</table>

			<div class="btn_group" style="text-align: center">
				<button type="button" id="update" class="btn btn-primary">수정</button>
				<button type="button" id="delete" class="btn btn-danger">삭제</button>
				<button type="button" id="list" class="btn btn-secondary">목록</button>
			</div>

		</div>
	</div>

</body>
</html>
