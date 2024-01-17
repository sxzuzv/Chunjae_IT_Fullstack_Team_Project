package kr.co.chunjae.admin.notice.dao;

import kr.co.chunjae.admin.notice.vo.NoticeVO;

import java.util.List;
import java.util.Map;

public interface NoticeDAO {
    public void noticeWrite(NoticeVO noticeVO);
    public int noticeCount();
    public List<NoticeVO> paging(Map<String, Integer> pagingParams);
}
