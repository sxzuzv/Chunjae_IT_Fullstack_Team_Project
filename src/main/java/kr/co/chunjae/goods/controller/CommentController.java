package kr.co.chunjae.goods.controller;


import kr.co.chunjae.goods.vo.CommentVO;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;


public interface CommentController {

	public ResponseEntity<String> addComment(@PathVariable("brdId") int brdId, @RequestBody CommentVO commentVO) throws Exception;

	public ResponseEntity<CommentVO> getCommentList(@PathVariable("brdId")int brdId) throws Exception;

	public ResponseEntity<String> removeArticle (@PathVariable("comId") int comId) throws Exception;

}
