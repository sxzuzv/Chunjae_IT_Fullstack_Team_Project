package kr.co.chunjae.admin.notice.service;

import kr.co.chunjae.admin.notice.vo.NoticeVO;
import kr.co.chunjae.page.pageVO;

import java.util.List;

public interface NoticeService {
    public void noticeWrite(NoticeVO noticeVO);
    public List<NoticeVO> paging(int page);
    public pageVO pagingParam(int page);
}
