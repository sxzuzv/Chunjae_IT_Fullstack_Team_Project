package kr.co.chunjae.goods.service;

import kr.co.chunjae.goods.vo.CommentVO;

import java.util.List;


public interface CommentService {

	public int insertWriteComment(CommentVO commentVO);

	public List<CommentVO> getCommentList(int brdId);
}
