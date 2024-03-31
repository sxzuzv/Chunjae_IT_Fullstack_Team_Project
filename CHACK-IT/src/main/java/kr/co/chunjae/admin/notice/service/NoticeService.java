package kr.co.chunjae.admin.notice.service;

import kr.co.chunjae.admin.notice.vo.NoticeVO;
import kr.co.chunjae.page.pageVO;

import java.util.List;

public interface NoticeService {
    public void noticeWrite(NoticeVO noticeVO);
    public void updateViewCnt(Long brdId);
    public NoticeVO noticeDetail(Long brdId);
    public List<NoticeVO> paging(int page);
    public pageVO pagingParam(int page);
    public void updateNotice(NoticeVO noticeVO);
    public void deleteNotice(Long brdId);
}
