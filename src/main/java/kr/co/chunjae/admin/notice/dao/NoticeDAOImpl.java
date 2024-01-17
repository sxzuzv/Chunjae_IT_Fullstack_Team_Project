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
    public int noticeSave(NoticeVO noticeVO) {
        return sqlSession.insert("mapper.admin.notice.noticeSave", noticeVO);
    }

    public List<NoticeVO> findAll() {
        return sqlSession.selectList("mapper.admin.notice.findAll");
    }

    public List<NoticeVO> paging(Map<String, Integer> pagingParams) {
        return sqlSession.selectList("mapper.admin.notice.noticePageList", pagingParams);
    }



    @Override
    public List<NoticeVO> listNoticeBoard(int brdId) {
        return sqlSession.selectList("mapper.admin.notice.listAllNoticeBoard", brdId);
    }

    @Override
    public NoticeVO findById(int brdId) {
        return sqlSession.selectOne("mapper.admin.notice.findById", brdId);
    }

    @Override
    public void update(NoticeVO noticeVO) {
        sqlSession.update("mapper.admin.notice.update", noticeVO);
    }

    @Override
    public void delete(int brdId) {
        sqlSession.delete("mapper.admin.notice.delete", brdId);

    }

    @Override
    public int noticeCount() {
        return sqlSession.selectOne("mapper.admin.notice.noticeCount");
    }
}
