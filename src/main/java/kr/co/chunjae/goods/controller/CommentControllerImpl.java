package kr.co.chunjae.goods.controller;

import kr.co.chunjae.goods.service.CommentService;
import kr.co.chunjae.goods.vo.CommentVO;
import lombok.RequiredArgsConstructor;

import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller("commentController")
@RequestMapping(value="/comment")
@RequiredArgsConstructor
@Slf4j
public class CommentControllerImpl implements CommentController {

    private final CommentService commentService;

    @PostMapping("/addComment.do/{brdId}")
    public ResponseEntity<String> addComment(
            @PathVariable("brdId")Integer brdId, @RequestBody CommentVO commentVO) {
        ResponseEntity<String> resEntity = null;
        try {
            System.out.println("===========================");
            System.out.println(commentVO);
            int result = commentService.insertWriteComment(commentVO);
            resEntity = new ResponseEntity<String>("ADD_SECCEEDED", HttpStatus.OK);
        } catch (Exception e) {
            resEntity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        return resEntity;
    }


    @GetMapping("/commentList.do/{brdId}")
    public ResponseEntity<CommentVO> getCommentList(@PathVariable("brdId")int brdId) {
        List<CommentVO> commentLists = commentService.getCommentList(brdId);
        return new ResponseEntity(commentLists, HttpStatus.OK);
    }


    @DeleteMapping(value = "/{articleNo}")
    public ResponseEntity<String> removeArticle (@PathVariable("articleNo") Integer articleNo) {
        ResponseEntity<String> resEntity = null;
        try {
            log.info(articleNo.toString());
            resEntity = new ResponseEntity<String>("REMOVE_SECCEEDED", HttpStatus.OK);
        } catch (Exception e) {
            resEntity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        return resEntity;
    }


}
