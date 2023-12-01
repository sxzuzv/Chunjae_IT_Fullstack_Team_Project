//package servlet;
//
//import dao.BoardDAO;
//import dao.CommentDAO;
//import dao.UserDAO;
//import dto.BoardDTO;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.IOException;
//import java.util.List;
//
//@WebServlet("/admin/*")
//public class AdminController extends HttpServlet {
//    private static final long serialVersionUID = 1L;
//    BoardDAO boardDAO;
//    UserDAO userDAO;
//    CommentDAO commentDAO;
//    public AdminController (){
//        super();
//    }
//    @Override
//    public void init() throws ServletException {
//
//        userDAO = new UserDAO();
//        boardDAO = new BoardDAO();
//        commentDAO = new
//
//    }
//
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        doHandle(request, response);
//    }
//
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        doHandle(request, response);
//    }
//
//    private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String nextPage = null;
//        request.setCharacterEncoding("utf-8");
//        response.setContentType("text/html; charset=UTF-8");
//
//        String action = request.getPathInfo();
//
//    }
//    // 관리자 계정만 접근
//        if(!request.getSession().getAttribute("userId").equals("admin")) {
//        response.sendRedirect("/main/main.do");
//        return;
//    }
//
//
//    // 로그인 되어 있지 않다면 로그인 페이지로 이동
//        if(request.getSession().getAttribute("userId") == null) {
//        response.sendRedirect("/member/main.do");
//        return;
//    }
//    /*public class AdminController {
//        private final BoardDAO boardDAO;*/
//
//        public AdminController(BoardDAO boardDAO) {
//            this.boardDAO = boardDAO;
//        }
//
//        public List<BoardDTO> getPostsByCategories(int category1, int category2) {
//            return boardDAO.getPostsByCategories(category1, category2);
//        }
//}
