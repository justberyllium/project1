package kr.co.sist.notice;

import java.util.List;

public class UserNoticeDAO {

	public List<NoticeVO> selectAllNotice(NoticeVO nVO) {
        return List.of(new NoticeVO());
    }

    public NoticeVO selectOneNotice(int noticeId) {
        return new NoticeVO();
    }

    public NoticeVO selectByTitle(String title) {
        return new NoticeVO();
    }
}
