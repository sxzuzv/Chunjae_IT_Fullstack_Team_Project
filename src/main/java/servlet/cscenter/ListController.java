package servlet.cscenter;

import dao.BoardDAO;
import dao.ReportDAO;
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

@WebServlet("/cscenter/list.do")
public class ListController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // DAO 객체 생성
        BoardDAO dao = new BoardDAO();
        // 쿼리스트링 추가용 변수
        String addOther = "";
        // 뷰에 전달할 매개변수 저장용 맵 생성
        Map<String, Object> map = new HashMap<String, Object>();
        // 검색어 필드와 검색어를 받아옴
        String searchField = req.getParameter("searchField");
        String searchWord = req.getParameter("searchWord");
        if (searchWord != null) {
            // 쿼리스트링으로 전달받은 매개변수 중 검색어가 있다면 map에 저장
            map.put("searchField", searchField);
            map.put("searchWord", searchWord);
        }
        // 세션에서 userId를 받아옴
        String userId = (String)req.getSession().getAttribute("userId");
        map.put("userId", userId);
        // 게시글의 총 개수를 조회
        int totalCount = dao.cscenterCount(map);  // 게시물 개수

        /* 페이지 처리 start */
        ServletContext application = getServletContext();
        int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
        int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));

        // 현재 페이지 확인
        int pageNum = 1;  // 기본값
        String pageTemp = req.getParameter("pageNum");
        if (pageTemp != null && !pageTemp.equals(""))
            pageNum = Integer.parseInt(pageTemp); // 요청받은 페이지로 수정

        // 목록에 출력할 게시물 범위 계산
        int start = (pageNum - 1) * pageSize;  // 첫 게시물 번호
        int end = pageNum * pageSize; // 마지막 게시물 번호
        map.put("start", start);
        map.put("end", end);
        /* 페이지 처리 end */
        // 페이지 번호에 따라 해당 범위의 게시글 목록을 가져옴
        List<BoardDTO> csList = dao.cscenterListPageWithPaging(map);
        // 페이징 처리를 위한 HTML 문자열 생성
        String pagingImg = BoardPage.pagingStr(totalCount, pageSize, blockPage,
                pageNum, searchField, searchWord, addOther, req.getContextPath() + "/cscenter/list.do"); // 바로가기 영역 HTML 문자열
        // 맵에 페이징 정보 추가
        map.put("pagingImg", pagingImg);
        map.put("totalCount", totalCount);
        map.put("pageSize", pageSize);
        map.put("pageNum", pageNum);

        // 전달할 데이터를 request 영역에 저장 후 csList.jsp로 포워드
        req.setAttribute("csList", csList);
        req.setAttribute("map", map);

        req.getRequestDispatcher("/view/board/cscenter/csList.jsp").forward(req, resp);
    }
    //report
}
