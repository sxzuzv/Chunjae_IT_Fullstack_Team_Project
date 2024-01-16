package kr.co.chunjae.goods.dao;

import kr.co.chunjae.goods.vo.CommentVO;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

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

	@Override
	public int deleteComment(int comId) throws DataAccessException {
		int result = sqlSession.delete("mapper.comment.deleteComment", comId);
		return result;
	}

	@Override
	public int updateComment(CommentVO commentVO) throws DataAccessException {
		int result = sqlSession.update("mapper.comment.updateComment", commentVO);
		return result;
	}

	@Override
	public int selectCommentCheck(Map<Integer, String> checkMap) throws DataAccessException {
		int result = sqlSession.selectOne("mapper.comment.selectCommentCheck", checkMap);
		return result;
	}

}
