<%@page import="org.json.simple.JSONObject"%>
<%@ page import="java.sql.SQLException" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.SQLException" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.sist.notice.MangeNoticeDAO" %>

<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="nVO" class="kr.co.sist.notice.NoticeVO" scope="page"/>
<jsp:setProperty property="*" name="nVO"/>
<%
JSONObject jsonObj=new JSONObject();
String method=request.getMethod();
jsonObj.put("result",!"GET".equals(method));

MangeNoticeDAO mnDAO=MangeNoticeDAO.getInstance();
try{
	mnDAO.insertNotice(nVO);
	jsonObj.put("insertStatus",true);
}catch(SQLException se){
	jsonObj.put("insertStatus",false);
	se.printStackTrace();
}
out.print(jsonObj.toJSONString());
%>
