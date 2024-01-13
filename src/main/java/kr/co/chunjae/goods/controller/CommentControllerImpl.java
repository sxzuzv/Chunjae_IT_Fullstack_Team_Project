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
import java.util.Map;

@Controller("commentController")
@RequestMapping(value="/comment")
@RequiredArgsConstructor
@Slf4j
public class CommentControllerImpl implements CommentController {

    private final CommentService commentService;

    @PostMapping("/addComment.do/{brdId}")
    public ResponseEntity<String> addComment(
            @PathVariable("brdId") int brdId, @RequestBody CommentVO commentVO) {
        ResponseEntity<String> resEntity = null;
        try {
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


    @DeleteMapping("/deleteComment.do/{comId}")
    public ResponseEntity<String> removeArticle (@PathVariable("comId") int comId) {
        ResponseEntity<String> resEntity = null;
        try {
            log.info(String.valueOf(comId));
            int result = commentService.deleteComment(comId);
            resEntity = new ResponseEntity<String>("REMOVE_SECCEEDED", HttpStatus.OK);
        } catch (Exception e) {
            resEntity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        return resEntity;
    }

    @PutMapping("/updateComment.do/{comId}")
    public ResponseEntity<String> modComment(
            @PathVariable("comId")Integer comId, @RequestBody CommentVO commentVO) {
        ResponseEntity<String> resEntity = null;
        try {
            int result = commentService.updateComment(commentVO);  // 게시물 수정
            resEntity = new ResponseEntity<String>("MOD_SECCEEDED", HttpStatus.OK);
        } catch (Exception e) {
            resEntity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        return resEntity;
    }

    @GetMapping("/checkMember.do/{comId}/{memberId}")
    public ResponseEntity<String> checkMember(@PathVariable Map<Integer, String> checkMap) {
        ResponseEntity<String> resEntity = null;
        try {
            int result = commentService.checkMember(checkMap);  //댓글 작성자 일치여부 체크
            if(result == 1) {
                resEntity = new ResponseEntity<String>("ACCESS_OK", HttpStatus.OK);
            }else{
                resEntity = new ResponseEntity<String>("WRONG_ACCESS", HttpStatus.FORBIDDEN);
            }
        } catch (Exception e) {
            resEntity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        return resEntity;
    }

}
