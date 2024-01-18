package kr.co.chunjae.notice.service;

import kr.co.chunjae.admin.notice.vo.NoticeVO;
import kr.co.chunjae.page.pageVO;

import java.util.List;

public interface userNoticeService {
    public void updateViewCnt(Long brdId);
    public NoticeVO noticeDetail(Long brdId);
    public List<NoticeVO> paging(int page);
    public pageVO pagingParam(int page);
}
