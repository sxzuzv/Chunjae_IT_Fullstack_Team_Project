package kr.co.chunjae.admin.notice.service;

import kr.co.chunjae.admin.notice.dao.NoticeDAO;
import kr.co.chunjae.admin.notice.vo.NoticeVO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class NoticeServiceImpl implements NoticeService {

    private final NoticeDAO noticeDAO;

    @Override
    public int noticeSave(NoticeVO noticeVO) {
        return noticeDAO.noticeSave(noticeVO);
    }

    @Override
    public List<NoticeVO> listNoticeBoard(int brdId) {
        return noticeDAO.listNoticeBoard(brdId);
    }

    @Override
    public NoticeVO findById(int brdId) {
        return noticeDAO.findById(brdId);
    }

    @Override
    public void delete(int brdId) {
        noticeDAO.delete(brdId);
    }

    @Override
    public void update(NoticeVO noticeVO) {
        noticeDAO.update(noticeVO);
    }
}
