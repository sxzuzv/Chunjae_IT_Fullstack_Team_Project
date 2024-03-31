package servlet.admin;

import dao.BoardDAO;
import dao.ReportDAO;
import dao.UserDAO;
import dto.BoardDTO;
import dto.ReportDTO;
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

@WebServlet("/admin/reportList.do")
public class ReportListController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    UserDAO userDao;

    public ReportListController() {
        super();
    }

    @Override
    public void init() throws ServletException {

        userDao = new UserDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doHandle(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doHandle(request, response);
    }

    private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nextPage = null;
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=UTF-8");
        String action = request.getPathInfo();


        ReportDAO dao = new ReportDAO();
        // 쿼리스트링 추가용 변수
        String addOther = "";
        // 뷰에 전달할 매개변수 저장용 맵 생성
        Map<String, Object> map = new HashMap<String, Object>();
        // 검색어 필드와 검색어를 받아옴
        String searchField = request.getParameter("searchField");
        String searchWord = request.getParameter("searchWord");
        if (searchWord != null) {
            // 쿼리스트링으로 전달받은 매개변수 중 검색어가 있다면 map에 저장
            map.put("searchField", searchField);
            map.put("searchWord", searchWord);
        }
        // 게시글의 총 개수를 조회
        int totalCount = dao.adreportSelectCount(map);  // 게시물 개수

        /* 페이지 처리 start */
        ServletContext application = getServletContext();
        int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
        int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));

        // 현재 페이지 확인
        int pageNum = 1;  // 기본값
        String pageTemp = request.getParameter("pageNum");
        if (pageTemp != null && !pageTemp.equals(""))
            pageNum = Integer.parseInt(pageTemp); // 요청받은 페이지로 수정

        // 목록에 출력할 게시물 범위 계산
        int start = (pageNum - 1) * pageSize;  // 첫 게시물 번호
        int end = pageNum * pageSize; // 마지막 게시물 번호
        map.put("start", start);
        map.put("end", end);
        /* 페이지 처리 end */
        // 페이지 번호에 따라 해당 범위의 게시글 목록을 가져옴
        List<ReportDTO> reportList = dao.adreportListPageWithPaging(map);
        // 페이징 처리를 위한 HTML 문자열 생성
        String pagingImg = BoardPage.pagingStr(totalCount, pageSize, blockPage,
                pageNum, searchField, searchWord, addOther, request.getContextPath() + "/admin/reportList.do"); // 바로가기 영역 HTML 문자열
        // 맵에 페이징 정보 추가
        map.put("pagingImg", pagingImg);
        map.put("totalCount", totalCount);
        map.put("pageSize", pageSize);
        map.put("pageNum", pageNum);

        // 전달할 데이터를 request 영역에 저장 후 csList.jsp로 포워드
        request.setAttribute("reportList", reportList);
        request.setAttribute("map", map);

        request.getRequestDispatcher("/view/admin/reportList.jsp").forward(request, response);
    }
}

