package kr.co.chunjae.goods.dao;

import kr.co.chunjae.goods.vo.CommentVO;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("commentDAO")
@RequiredArgsConstructor
public class CommentDAOImpl implements CommentDAO{

	private final SqlSession sqlSession;

	@Override
	public int insertWriteComment(CommentVO commentVO) throws DataAccessException {
		return sqlSession.insert("mapper.comment.insertWriteComment",commentVO);
	}

	@Override
	public List selectCommentList(int brdId) throws DataAccessException {
		List<CommentVO> commentList= sqlSession.selectList("mapper.comment.selectCommentList", brdId);
		return commentList;
	}

}
