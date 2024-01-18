package kr.co.chunjae.notice.dao;

import kr.co.chunjae.admin.notice.vo.NoticeVO;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@RequiredArgsConstructor
public class userNoticeDAOImpl implements userNoticeDAO {

    private final SqlSession sqlSession;

    @Override
    public void updateViewCnt(Long brdId) {
        sqlSession.update("mapper.notice.updateViewCnt", brdId);
    }

    @Override
    public NoticeVO noticeDetail(Long brdId) {
        return sqlSession.selectOne("mapper.notice.noticeDetail", brdId);
    }

    @Override
    public List<NoticeVO> paging(Map<String, Integer> pagingParams) {
        return sqlSession.selectList("mapper.notice.pagingNoticeList", pagingParams);
    }

    @Override
    public int noticeCount() {
        return sqlSession.selectOne("mapper.notice.noticeCount");
    }
}
