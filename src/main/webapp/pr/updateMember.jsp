<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="kr.co.sist.user.AdminMemberManageDAO" %>
<%@ page import="kr.co.sist.user.UserVO" %>

<%
    String userId = request.getParameter("userId");
    String Name = request.getParameter("Name");
    String phone = request.getParameter("phoner");
    String address1 = request.getParameter("address1");
    String joinDate = request.getParameter("joinDate");
    String email = request.getParameter("email");

    UserVO user = new UserVO();
    user.setUserId(userId);
    user.setName(Name);
    user.setPhone(phone);
    user.setAddress1(address1);
    user.setJoinDate(joinDate);
    user.setEmail(email);

    AdminMemberManageDAO dao = AdminMemberManageDAO.getInstance();
    int result = dao.updateMember(user);  // 회원 정보 수정

    // JSON 객체 생성
    JSONObject responseObject = new JSONObject();
    if (result > 0) {
        responseObject.put("success", true);
        responseObject.put("message", "회원 정보가 성공적으로 수정되었습니다.");
    } else {
        responseObject.put("success", false);
        responseObject.put("message", "회원 정보 수정에 실패했습니다.");
    }

    // JSON 응답을 클라이언트에 전송
    response.setContentType("application/json; charset=UTF-8");
    response.getWriter().write(responseObject.toString());
%>
