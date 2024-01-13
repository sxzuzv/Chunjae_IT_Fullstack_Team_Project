package kr.co.chunjae.goods.dao;

import kr.co.chunjae.goods.vo.CommentVO;
import org.springframework.dao.DataAccessException;

import java.util.List;

public interface CommentDAO {
	public int insertWriteComment(CommentVO commentVO) throws DataAccessException;
	public List selectCommentList(int brdId) throws DataAccessException;
}
