package kr.co.chunjae.goods.service;

import kr.co.chunjae.goods.dao.CommentDAO;
import kr.co.chunjae.goods.vo.CommentVO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service("commentService")
@Transactional(propagation=Propagation.REQUIRED)
@RequiredArgsConstructor
public class CommentServiceImpl implements CommentService{

	private final CommentDAO commentDAO;

	public int insertWriteComment(CommentVO commentVO) {
		return commentDAO.insertWriteComment(commentVO);
	}


	public List<CommentVO> getCommentList(int brdId) {
		List commentList = commentDAO.selectCommentList(brdId);
		return commentList;
	}


	public int deleteComment(int comId) {
		int result = commentDAO.deleteComment(comId);
		return result;
	}


	public int updateComment(CommentVO commentVO) {
		int result = commentDAO.updateComment(commentVO);
		return result;
	}

	@Override
	public int checkMember(Map<Integer, String> checkMap) {
		int result = commentDAO.selectCommentCheck(checkMap);
		return result;
	}


}
