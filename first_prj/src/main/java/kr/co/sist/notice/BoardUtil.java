package kr.co.sist.notice;


import java.net.URLEncoder;
import java.io.UnsupportedEncodingException;

public class BoardUtil {
    private static String[] columnName = {"subject", "content", "writer"};

    public static String numToField(String fieldNum) {
        try {
            int index = Integer.parseInt(fieldNum);
            if (index >= 0 && index < columnName.length) {
                return columnName[index];
            } else {
                throw new IllegalArgumentException("Invalid field number: " + fieldNum);
            }
        } catch (NumberFormatException e) {
            throw new IllegalArgumentException("Field number must be an integer", e);
        }
    }

    public String pagination(SearchVO sVO) {
        StringBuilder pagination = new StringBuilder();

        if (sVO.getTotalCount() != 0) {
            int pageNumber = 3;
            int startPage = ((sVO.getCurrentPage() - 1) / pageNumber) * pageNumber + 1;
            int endPage = startPage + pageNumber - 1;

            if (sVO.getTotalPage() <= endPage) {
                endPage = sVO.getTotalPage();
            }

            pagination.append(createPrevLink(sVO, startPage));
            pagination.append(" ... ");

            pagination.append(createPageLinks(sVO, startPage, endPage));
            pagination.append(" ... ");

            pagination.append(createNextLink(sVO, endPage));
        }

        return pagination.toString();
    }

    private String createPrevLink(SearchVO sVO, int startPage) {
        StringBuilder prevMark = new StringBuilder();
        prevMark.append("[ &lt;&lt; ]");

        if (sVO.getCurrentPage() > 3) {
            int movePage = startPage - 1;
            prevMark.delete(0, prevMark.length());
            prevMark.append("[ <a href='").append(sVO.getUrl()).append("?currentPage=").append(movePage);

            if (sVO.getKeyword() != null && !"".equals(sVO.getKeyword())) {
                prevMark.append("&field=").append(sVO.getField())
                        .append("&keyword=").append(encodeURIComponent(sVO.getKeyword()));
            }

            prevMark.append("'> &lt;&lt; </a> ]");
        }

        return prevMark.toString();
    }

    private String createNextLink(SearchVO sVO, int endPage) {
        StringBuilder nextMark = new StringBuilder();
        nextMark.append("[ &gt;&gt; ]");

        if (sVO.getTotalPage() > endPage) {
            int movePage = endPage + 1;
            nextMark.delete(0, nextMark.length());
            nextMark.append("[ <a href='").append(sVO.getUrl()).append("?currentPage=").append(movePage);

            if (sVO.getKeyword() != null && !"".equals(sVO.getKeyword())) {
                nextMark.append("&field=").append(sVO.getField())
                        .append("&keyword=").append(encodeURIComponent(sVO.getKeyword()));
            }

            nextMark.append("'> &gt;&gt; </a> ]");
        }

        return nextMark.toString();
    }

    private String createPageLinks(SearchVO sVO, int startPage, int endPage) {
        StringBuilder pageLink = new StringBuilder();
        int movePage = startPage;

        while (movePage <= endPage) {
            if (movePage == sVO.getCurrentPage()) {
                pageLink.append("[ ").append(movePage).append(" ]");
            } else {
                pageLink.append("[ <a href='").append(sVO.getUrl()).append("?currentPage=").append(movePage);

                if (sVO.getKeyword() != null && !"".equals(sVO.getKeyword())) {
                    pageLink.append("&field=").append(sVO.getField())
                            .append("&keyword=").append(encodeURIComponent(sVO.getKeyword()));
                }

                pageLink.append("'>").append(movePage).append("</a> ]");
            }
            movePage++;
        }

        return pageLink.toString();
    }

    private String encodeURIComponent(String value) {
        try {
            return URLEncoder.encode(value, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            return value; // 기본적으로는 인코딩 오류시 그대로 반환
        }
    }
}
