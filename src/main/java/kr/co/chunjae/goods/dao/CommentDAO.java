package kr.co.chunjae.goods.dao;

import kr.co.chunjae.goods.vo.CommentVO;
import org.springframework.dao.DataAccessException;

import java.util.List;
import java.util.Map;

public interface CommentDAO {
	public int insertWriteComment(CommentVO commentVO) throws DataAccessException;
	public List selectCommentList(int brdId) throws DataAccessException;

	public int deleteComment(int comId) throws DataAccessException;

	public int updateComment(CommentVO commentVO) throws DataAccessException;

	public int selectCommentCheck(Map<Integer, String> checkMap) throws DataAccessException;
}
