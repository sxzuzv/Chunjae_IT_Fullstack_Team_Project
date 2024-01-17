package kr.co.chunjae.admin.notice.dao;

import kr.co.chunjae.admin.notice.vo.NoticeVO;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@RequiredArgsConstructor
public class NoticeDAOImpl implements NoticeDAO {

    private final SqlSession sqlSession;

    @Override
    public void noticeWrite(NoticeVO noticeVO) {
        sqlSession.insert("mapper.admin.notice.noticeWrite", noticeVO);
    }

    @Override
    public void updateViewCnt(Long brdId) {
        sqlSession.update("mapper.admin.notice.updateViewCnt", brdId);
    }

    @Override
    public NoticeVO noticeDetail(Long brdId) {
        return sqlSession.selectOne("mapper.admin.notice.noticeDetail", brdId);
    }

    @Override
    public List<NoticeVO> paging(Map<String, Integer> pagingParams) {
        return sqlSession.selectList("mapper.admin.notice.pagingNoticeList", pagingParams);
    }

    @Override
    public int noticeCount() {
        return sqlSession.selectOne("mapper.admin.notice.noticeCount");
    }
}
