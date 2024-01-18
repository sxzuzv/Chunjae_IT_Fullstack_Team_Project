package kr.co.chunjae.notice.dao;

import kr.co.chunjae.admin.notice.vo.NoticeVO;

import java.util.List;
import java.util.Map;

public interface userNoticeDAO {
    public int noticeCount();
    public void updateViewCnt(Long brdId);
    public NoticeVO noticeDetail(Long brdId);
    public List<NoticeVO> paging(Map<String, Integer> pagingParams);
}
