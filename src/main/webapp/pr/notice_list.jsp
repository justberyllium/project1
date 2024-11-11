<%@page import="kr.co.sist.util.BoardUtil"%>
<%@page import="org.apache.tomcat.dbcp.dbcp2.SQLExceptionList"%>
<%@page import="kr.co.sist.notice.NoticeVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.notice.SearchVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.notice.MangeNoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" info="" %>
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

<!-- 메인 콘텐츠 영역 -->
<div class="main-content">
  <div class="content-box">
    <div class="notice_title">공지사항 리스트</div>

    <div class="notice_list">
      <span style="text-align: left; margin-left: 10px">공지사항 목록(총 n개)</span>
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
        <tr>
          <td><input type="checkbox" class="rowCheckbox"></td>
          <td>1</td>
          <td>NOTICE</td>
          <td><a href="notice_update.jsp">배송 공지사항</a></td>
          <td>관리자</td>
          <td>2024/10/14</td>
        </tr>
        <tr>
          <td><input type="checkbox" class="rowCheckbox"></td>
          <td>2</td>
          <td>NOTICE</td>
          <td><a href="notice_update.jsp">주문 공지사항</a></td>
          <td>관리자</td>
          <td>2024/10/15</td>
        </tr>
        <tr>
          <td><input type="checkbox" class="rowCheckbox"></td>
          <td>3</td>
          <td>NOTICE</td>
          <td><a href="notice_update.jsp">일반 공지사항</a></td>
          <td>관리자</td>
          <td>2024/10/15</td>
        </tr>
        <tr>
          <td><input type="checkbox" class="rowCheckbox"></td>
          <td>4</td>
          <td>NOTICE</td>
          <td><a href="notice_update.jsp">연휴 공지사항</a></td>
          <td>관리자</td>
          <td>2024/10/17</td>
        </tr>
        </tbody>
      </table>
    </div>
    <div>
      <div class="button-group">
        <button class="btn btn-success" id="createBtn">공지사항 등록</button>
        <button class="btn btn-danger" id="deleteBtn">선택 삭제</button>
      </div>
      <div class="page-nation" style="text-align: center">
      <jsp:useBean id="sVO" class="kr.co.sist.notice.SearchVO" scope="page"/>
	<jsp:setProperty property="*" name="sVO"/>
     <%
     int totalCount=0;
     
     MangeNoticeDAO mnDAO=MangeNoticeDAO.getInstance();
     try{
    	 totalCount=mnDAO.selectTotalCount(sVO);
     }catch(SQLException se){
    	 se.printStackTrace();
     }
     
     int pageScale=10;
     
     int totalPage=(int)Math.ceil((double)totalCount/pageScale);
     
     String paramPage=request.getParameter("currentPage");
     
     int currentPage=1;	
 	if(paramPage != null){
 		try{
 			currentPage=Integer.parseInt(paramPage);
 		}catch(NumberFormatException nfe){
 		}//end catch
 	}//end if
 	
 	int startNum=currentPage*pageScale-pageScale+1;
 	
 	int endNum=startNum+pageScale-1;
 	
 	sVO.setCurrentPage(currentPage);
	sVO.setStartNum(startNum);
	sVO.setEndNum(endNum);
	sVO.setTotalPage(totalPage);
	sVO.setTotalCount(totalCount);
	
	out.print( sVO );
	
	 List<NoticeVO> noticeList = null;

	    try {
	        noticeList = mnDAO.selectNotice(sVO);
	        
	        // 공지사항 제목 길이 제한 처리
	        String tempSubject = "";
	        for (NoticeVO tempVO : noticeList) {
	            tempSubject = tempVO.getTitle();
	            if (tempSubject.length() > 30) {
	                tempVO.setTitle(tempSubject.substring(0, 29) + "...");
	            }
	        }
	        
	    } catch (SQLException se) {
	        se.printStackTrace();
	    }
	
	pageContext.setAttribute("totalCount", totalCount);
	pageContext.setAttribute("pageScale", pageScale);
	pageContext.setAttribute("totalPage", totalPage);
	pageContext.setAttribute("currentPage", currentPage);
	pageContext.setAttribute("noticeList", noticeList);
     %>
     <%= new BoardUtil().pagination(sVO)	%>
      </div>
    </div>
  </div>
  <script>
      $(function () {
          $('#createBtn').click(() => {
              location.href='notice_add.jsp'
          })
          $('#deleteBtn').click(()=>{
              const selectedRows = $('.rowCheckbox:checked');

              if(selectedRows.length === 0){
                  alert('삭제할 항목을 선택해주세요');
                  return;
              }
              if(confirm('선택한' + selectedRows.length + '개의 게시물을 삭제하시겠습니까?')){
                  selectedRows.each(()=>{
                      $(this).closest('tr').remove();
                  });
                  // 전체 선택 체크박스 해제
                  $('#selectAll').prop('checked', false);

                  // 남은 행들의 번호 재정렬
                  $('.table tbody tr').each(function(index) {
                      $(this).find('td:eq(1)').text(index + 1);
                  });

                  alert('선택한 게시물이 삭제되었습니다.');
              }

          })
          $('#selectAll').change(function() {
              $('.rowCheckbox').prop('checked', $(this).prop('checked'));
          });

          $('.rowCheckbox').change(function() {
              $('#selectAll').prop('checked', $('.rowCheckbox:checked').length === $('.rowCheckbox').length);
          });
      });
  </script>
</div>


</body>
</html>