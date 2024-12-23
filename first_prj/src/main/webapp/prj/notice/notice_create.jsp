<%@ page contentType="application/json; charset=UTF-8" %>
<%@ page import="kr.co.sist.notice.MangeNoticeDAO, kr.co.sist.notice.NoticeVO" %>

<%
    // JSON 형식을 위해 StringBuilder 사용
    StringBuilder json = new StringBuilder();
    json.append("{ \"insertStatus\": ");

    try {
        // NoticeVO 객체 생성 및 요청 파라미터로 설정
        NoticeVO nVO = new NoticeVO();
        nVO.setCategory_id(Integer.parseInt(request.getParameter("categoryId")));
        nVO.setTitle(request.getParameter("title"));
        nVO.setContent(request.getParameter("content"));

        // DAO 호출
        MangeNoticeDAO mnDAO = MangeNoticeDAO.getInstance();
        int result = mnDAO.insertNotice(nVO);

        if (result > 0) {
            json.append("true");
        } else {
            json.append("false");
        }
    } catch (Exception e) {
        json.append("false");
        e.printStackTrace();
    }

    json.append(" }");
    out.print(json.toString());
%>
