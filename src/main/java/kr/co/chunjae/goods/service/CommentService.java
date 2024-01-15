package kr.co.chunjae.goods.service;

import kr.co.chunjae.goods.vo.CommentVO;

import java.util.List;
import java.util.Map;


public interface CommentService {

	public int insertWriteComment(CommentVO commentVO);

	public List<CommentVO> getCommentList(int brdId);

	public int deleteComment(int comId);

	public int updateComment(CommentVO commentVO);

	public int checkMember(Map<Integer, String> checkMap);
}
