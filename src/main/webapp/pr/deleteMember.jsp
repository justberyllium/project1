<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="kr.co.sist.user.AdminMemberManageDAO" %>
<%@ page import="kr.co.sist.user.UserVO" %>
<%
    request.setCharacterEncoding("UTF-8");

    String memberId = request.getParameter("memberId");
    JSONObject jsonResponse = new JSONObject();

    AdminMemberManageDAO dao = AdminMemberManageDAO.getInstance();
    int deleteResult = dao.deleteMember(memberId);

    if (deleteResult > 0) {
        jsonResponse.put("status", "success");
        jsonResponse.put("message", "회원번호: " + memberId + "번이 삭제되었습니다.");
    } else {
        jsonResponse.put("status", "error");
        jsonResponse.put("message", "삭제에 실패했습니다. 다시 시도해 주세요.");
    }

    out.print(jsonResponse.toString());
%>
