package kr.co.chunjae.admin.notice.dao;

import kr.co.chunjae.admin.notice.vo.NoticeVO;

import java.util.List;
import java.util.Map;

public interface NoticeDAO {
    public void noticeWrite(NoticeVO noticeVO);
    public int noticeCount();
    public void updateViewCnt(Long brdId);

    public NoticeVO noticeDetail(Long brdId);
    public List<NoticeVO> paging(Map<String, Integer> pagingParams);

    public void updateNotice(NoticeVO noticeVO);
}
