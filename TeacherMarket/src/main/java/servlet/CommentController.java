package servlet;

import com.google.gson.Gson;
import dao.CommentDAO;
import dto.BoardCommentDTO;
import dto.BoardDTO;
import util.FileUtil;
import util.JSFunction;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/comment/*")
public class CommentController extends HttpServlet {

  protected void doGet(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
    doHandle(request, response);
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
    doHandle(request, response);
  }

  private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.setCharacterEncoding("utf-8");
    response.setContentType("text/html; charset=UTF-8");
    String action = request.getPathInfo();

    try {
      if("/addComment.do".equals(action)){
        //ajax로 전달용 PrintWriter 객체생성
        PrintWriter out = response.getWriter();

        int brdId = Integer.parseInt(request.getParameter("brdId"));

        String comContent = request.getParameter("comContent");

        BoardCommentDTO commentDto = new BoardCommentDTO();
        CommentDAO commentDao = new CommentDAO();

        commentDto.setParentId(brdId);
        commentDto.setComContent(comContent);
        commentDto.setUserId((String) request.getSession().getAttribute("userId"));
        int result = commentDao.insertWriteComment(commentDto);
        out.print(result);
        return;

      } else if ("/commentList.do".equals(action)) {
        //ajax로 전달용 PrintWriter 객체생성
        PrintWriter out = response.getWriter();

        //전달할 map 생성
        Map<String, Object> map = new HashMap<String, Object>();
        //brdId 전달
        String brdId = request.getParameter("brdId");
        map.put("brdId", brdId);

        CommentDAO commentDao = new CommentDAO();

        // 목록 받기
        List<BoardCommentDTO> commentLists = commentDao.selectCommentList(map);

        // List -> Json 문자열
          Gson gson = new Gson();
          String jsonStr = gson.toJson(commentLists);

        //ajax로 전달
        out.print(jsonStr);

        return;
      } else if ("/deleteComment.do".equals(action)){
        //ajax로 전달용 PrintWriter 객체생성
        PrintWriter out = response.getWriter();

        //brdId 전달
        String comId = request.getParameter("comId");

        CommentDAO commentDao = new CommentDAO();

        int result = commentDao.deleteComment(comId);  // 게시물 삭제
        out.print(result);

        return;

      } else if("/updateComment.do".equals(action)) {
        //ajax로 전달용 PrintWriter 객체생성
        PrintWriter out = response.getWriter();

        //comId, comContent전달
        int comId = Integer.parseInt(request.getParameter("comId"));
        String comContent = request.getParameter("comContent");

        BoardCommentDTO commentDto = new BoardCommentDTO();
        CommentDAO commentDao = new CommentDAO();

        commentDto.setComId(comId);
        commentDto.setComContent(comContent);
        int result = commentDao.updateComment(commentDto);  // 게시물 수정
        out.print(result);

        return;
      } else{


      }


    } catch (Exception e) {
      e.printStackTrace();
    }
  }



}

