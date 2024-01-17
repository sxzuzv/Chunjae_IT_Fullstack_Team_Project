package kr.co.chunjae.admin.notice.service;

import kr.co.chunjae.admin.notice.vo.NoticeVO;

import java.util.List;

public interface NoticeService {

    public int noticeSave(NoticeVO noticeVO);

    public List<NoticeVO> listNoticeBoard(int brdId);

    public NoticeVO findById (int brdId);

    public void delete(int brdId);

    public void update(NoticeVO noticeVO);
}
