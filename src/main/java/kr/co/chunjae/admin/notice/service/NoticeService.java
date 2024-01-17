package kr.co.chunjae.admin.notice.service;

import kr.co.chunjae.admin.notice.vo.NoticeVO;
import kr.co.chunjae.page.pageVO;

import java.util.List;

public interface NoticeService {

    public int noticeSave(NoticeVO noticeVO);

    public List<NoticeVO> listNoticeBoard(int brdId);

    public NoticeVO findById (int brdId);

    public void delete(int brdId);

    public void update(NoticeVO noticeVO);

    public List<NoticeVO> findAll();

    public List<NoticeVO> paging(int page);

    public pageVO pagingParam(int page);
}
