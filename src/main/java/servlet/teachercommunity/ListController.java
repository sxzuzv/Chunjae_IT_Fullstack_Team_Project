package servlet.teachercommunity;

import com.mysql.cj.PreparedQuery;
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

@WebServlet("/teachercommunity/list.do")
public class ListController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nextPage = null;
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        // DAO 생성
        BoardDAO dao = new BoardDAO();
        // 쿼리스트링 추가용 변수
        String addOther = "";
        // 뷰에 전달할 매개변수 저장용 맵 생성
        Map<String, Object> map = new HashMap<String, Object>();

        String cateSub = request.getParameter("cateSub");
        map.put("cateSub", cateSub);

        String searchField = request.getParameter("searchField");
        String searchWord = request.getParameter("searchWord");
        if (searchWord != null) {
            // 쿼리스트링으로 전달받은 매개변수 중 검색어가 있다면 map에 저장
            map.put("searchField", searchField);
            map.put("searchWord", searchWord);
        }
        int totalCount = dao.tcselectCount(map);  // 게시물 개수

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

        List<BoardDTO> boardLists = dao.tcselectListPage(map);
        List<BoardDTO> topLists = dao.selectTopList(map); // 선택한 소분류에서 조회수 기준 인기글 3개 목록 받기

        // 뷰에 전달할 매개변수 추가
        String pagingImg = BoardPage.pagingStr(totalCount, pageSize,
                blockPage, pageNum, searchField, searchWord, addOther,request.getContextPath() + "/teachercommunity/list.do");  // 바로가기 영역 HTML 문자열
        map.put("pagingImg", pagingImg);
        map.put("totalCount", totalCount);
        map.put("pageSize", pageSize);
        map.put("pageNum", pageNum);

        // 전달할 데이터를 request 영역에 저장 후 TeacherCommunityBoard.jsp로 포워드
        request.setAttribute("boardLists", boardLists);
        request.setAttribute("topLists", topLists);
        request.setAttribute("map", map);
        request.getRequestDispatcher("/view/board/teachercommunity/list.jsp").forward(request, response);
    }

}
