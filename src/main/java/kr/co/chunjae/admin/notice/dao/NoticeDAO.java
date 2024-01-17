package kr.co.chunjae.admin.notice.dao;

import kr.co.chunjae.admin.notice.vo.NoticeVO;

import java.util.List;
import java.util.Map;

public interface NoticeDAO {

    public int noticeSave(NoticeVO noticeVO);

    public List<NoticeVO> listNoticeBoard(int brdId);

    public NoticeVO findById(int brdId);

    public void update (NoticeVO noticeVO);

    public void delete (int brdId);

    public int noticeCount();

    public List<NoticeVO> paging(Map<String, Integer> pagingParams);
}
