package kr.co.chunjae.goods.controller;


import kr.co.chunjae.goods.vo.CommentVO;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;


public interface CommentController {

	public ResponseEntity<String> addComment(@PathVariable("brdId")Integer brdId, @RequestBody CommentVO commentVO) throws Exception;
}
