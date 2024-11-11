<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.notice.MangeNoticeDAO"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" info="" %>

<%
String noticeIds = request.getParameter("noticeIds"); // 쉼표로 구분된 공지사항 ID들
MangeNoticeDAO dao = MangeNoticeDAO.getInstance();

if (noticeIds != null && !noticeIds.trim().isEmpty()) {
    String[] idsArray = noticeIds.split(",");
    
    try {
        for (String id : idsArray) {
            dao.deleteNotice(Integer.parseInt(id.trim()));
        }
        out.print("success");
    } catch (SQLException e) {
        e.printStackTrace();
        response.setStatus(500); // 서버 오류 상태 코드
    }
} else {
    response.setStatus(400); // 잘못된 요청 상태 코드
}
%>
