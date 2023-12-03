package servlet;

import dao.BoardDAO;
import dto.BoardDTO;
import util.BoardPage;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/admin/*")
public class AdminController extends HttpServlet {
    private static final long serialVersionUID = 1L;
//	private static String ARTICEL_IMAGE_REPO = "D:\\file_repo";


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doHandle(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doHandle(request, response);
    }
    /*BoardDAO dao = new BoardDAO();
    // 뷰에 전달할 매개변수 저장용 맵 생성
    Map<String, Object> map = new HashMap<String, Object>();

    //서브 카테고리 받아와 map에 저장
    String cateMain = request.getParameter("cateMain");
        map. put("cateMain", cateMain);
        System.out.println(cateMain);
    //cate_sub가 존재하는 경우만 쿼리스트링 삽입
    String addOther = "";
        if (cateMain != null) {
        addOther = "&cateSub=" + cateMain;
    }

    String searchField = request.getParameter("searchField");
    String searchWord = request.getParameter("searchWord");
        if (searchWord != null) {
        // 쿼리스트링으로 전달받은 매개변수 중 검색어가 있다면 map에 저장
        map.put("searchField", searchField);
        map.put("searchWord", searchWord);
    }
    int totalCount = dao.csSelectCount(map);  // 게시물 개수

    *//* 페이지 처리 start *//*
    ServletContext application = getServletContext();
    int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
    int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));

    // 현재 페이지 확인
    int pageNum = 1;  // 기본값
    String pageTemp = request.getParameter("pageNum");
        if (pageTemp != null && !pageTemp.equals(""))
    pageNum = Integer.parseInt(pageTemp); // 요청받은 페이지로 수정

    int totalPage = (int) Math.ceil((double) totalCount / pageSize);

    // 목록에 출력할 게시물 범위 계산
    int start = (pageNum - 1) * pageSize;  // 첫 게시물 번호
    int end = pageNum * pageSize; // 마지막 게시물 번호
        map.put("start", start);
        map.put("end", end);
    *//* 페이지 처리 end *//*

    List<BoardDTO> boardList = dao.csSelectListPage(map);  // 게시물 목록 받기

    // 뷰에 전달할 매개변수 추가
    String pagingImg = BoardPage.pagingStr(totalCount, pageSize,
            blockPage, pageNum, searchField, searchWord, addOther, request.getContextPath() + "view/admin/list.do");  // 바로가기 영역 HTML 문자열
        map.put("pagingImg", pagingImg);
        map.put("totalCount", totalCount);
        map.put("pageSize", pageSize);
        map.put("pageNum", pageNum);

    // 전달할 데이터를 request 영역에 저장 후 List.jsp로 포워드
        request.setAttribute("boardList", boardList);
        request.setAttribute("map", map);
    // 서블렛 내장객체에서 루트컨택스트
        request.getRequestDispatcher("/view/admin/admin_list.jsp").forward(request, response);*/

    private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nextPage = null;
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=UTF-8");
        String action = request.getPathInfo();

        BoardDAO dao = new BoardDAO();
        // 뷰에 전달할 매개변수 저장용 맵 생성
        Map<String, Object> map = new HashMap<String, Object>();

        //서브 카테고리 받아와 map에 저장
        String cateMain = request.getParameter("cateMain");
        map.put("cateMain", cateMain);
        System.out.println(cateMain);
        //cate_sub가 존재하는 경우만 쿼리스트링 삽입
        String addOther = "";
        if (cateMain != null) {
            addOther = "&cateMain=" + cateMain;
        }

        String searchField = request.getParameter("searchField");
        String searchWord = request.getParameter("searchWord");
        if (searchWord != null) {
            // 쿼리스트링으로 전달받은 매개변수 중 검색어가 있다면 map에 저장
            map.put("searchField", searchField);
            map.put("searchWord", searchWord);
        }
        int totalCount = dao.csSelectCount(map);  // 게시물 개수

        /* 페이지 처리 start */
        ServletContext application = getServletContext();
        int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
        int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));

        // 현재 페이지 확인
        int pageNum = 1;  // 기본값
        String pageTemp = request.getParameter("pageNum");
        if (pageTemp != null && !pageTemp.equals(""))
            pageNum = Integer.parseInt(pageTemp); // 요청받은 페이지로 수정

        int totalPage = (int) Math.ceil((double) totalCount / pageSize);

        // 목록에 출력할 게시물 범위 계산
        int start = (pageNum - 1) * pageSize;  // 첫 게시물 번호
        int end = pageNum * pageSize; // 마지막 게시물 번호
        map.put("start", start);
        map.put("end", end);
        /* 페이지 처리 end */

        List<BoardDTO> boardList = dao.csSelectListPage(map);  // 게시물 목록 받기

        // 뷰에 전달할 매개변수 추가
        String pagingImg = BoardPage.pagingStr(totalCount, pageSize,
                blockPage, pageNum, searchField, searchWord, addOther, request.getContextPath() + "view/admin/list.do");  // 바로가기 영역 HTML 문자열
        map.put("pagingImg", pagingImg);
        map.put("totalCount", totalCount);
        map.put("pageSize", pageSize);
        map.put("pageNum", pageNum);

        // 전달할 데이터를 request 영역에 저장 후 List.jsp로 포워드
        request.setAttribute("boardList", boardList);
        request.setAttribute("map", map);
        // 서블렛 내장객체에서 루트컨택스트
        request.getRequestDispatcher("/view/admin/admin_list.jsp").forward(request, response);



    }
}


