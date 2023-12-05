package servlet.market;

import com.google.gson.Gson;
import dao.CommentDAO;
import dto.BoardCommentDTO;
import dto.BoardDTO;

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
    String nextPage = null;
    request.setCharacterEncoding("utf-8");
    response.setContentType("text/html; charset=UTF-8");
    String action = request.getPathInfo();

    try {
      if("/addComment.do".equals(action)){
        int brdId = Integer.parseInt(request.getParameter("brdId"));

        String comContent = request.getParameter("comContent");

        BoardCommentDTO commentDto = new BoardCommentDTO();
        CommentDAO commentDao = new CommentDAO();

        commentDto.setParentId(brdId);
        commentDto.setComContent(comContent);
        commentDto.setUserId((String) request.getSession().getAttribute("userId"));
        commentDao.insertWriteComment(commentDto);

        request.setAttribute("brdId", brdId);

        nextPage = "/market/view.do";
      } else if ("/commentList.do".equals(action)) {
        //전달할 map 생성
        Map<String, Object> map = new HashMap<String, Object>();
        PrintWriter out = response.getWriter();
        //brdId 전달
        String brdId = request.getParameter("brdId");
        map.put("brdId", brdId);

        BoardCommentDTO commentDto = new BoardCommentDTO();
        CommentDAO commentDao = new CommentDAO();

        // 목록 받기
        List<BoardCommentDTO> commentLists = commentDao.selectCommentList(map);

        // List -> Json 문자열
          Gson gson = new Gson();
          String jsonStr = gson.toJson(commentLists);

        //ajax로 전달
        out.print(jsonStr);

        return;
      }

      RequestDispatcher dis = request.getRequestDispatcher(nextPage);
        dis.forward(request, response);





    } catch (Exception e) {
      e.printStackTrace();
    }
  }



}

