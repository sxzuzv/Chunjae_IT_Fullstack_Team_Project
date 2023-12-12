package servlet.market;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import dto.BoardDTO;

import util.BoardPage;
import util.JSFunction;

@WebServlet("/market/list.do")
public class ListController extends HttpServlet {
  private static final long serialVersionUID = 1L;
//	private static String ARTICEL_IMAGE_REPO = "D:\\file_repo";


  protected void doGet(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
    doHandle(request, response);
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doHandle(request, response);
  }

  private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String nextPage = null;
    request.setCharacterEncoding("utf-8");
    response.setContentType("text/html; charset=UTF-8");


    BoardDAO dao = new BoardDAO();

    // 뷰에 전달할 매개변수 저장용 맵 생성
    Map<String, Object> map = new HashMap<String, Object>();

    //서브 카테고리 받아옴
    String cateSub = request.getParameter("cateSub");
    String myStore = request.getParameter("myStore");

    //검색 받아옴
    String searchField = request.getParameter("searchField");
    String searchWord = request.getParameter("searchWord");

    //로그인 유저정보 받아옴
    String userId = (String)request.getSession().getAttribute("userId");



    if (searchWord != null) {
      // 쿼리스트링으로 전달받은 매개변수 중 검색어가 있다면 map에 저장
      map.put("searchField", searchField);
      map.put("searchWord", searchWord);
    }

    //기타 쿼리스트링 삽입용 변수선언
    String addOther = "";

    // 중고거래 or 내상점 여부 판단하여 분기 처리
    if (myStore == null){ // 중고거래 게시판일때
      nextPage = "/view/board/market/list.jsp"; //포워딩 페이지 중고거래 게시판으로 지정
      if (cateSub != null) { //cateSub가 존재하면 쿼리스트링과 맵에 추가
        addOther = "&cateSub="+cateSub;
        map.put("cateSub", cateSub);
      }
    }
    else{ //내상점인 경우

      if(userId == null) { //비로그인시 내상점 접근 불가
        JSFunction.alertLocation(response, "로그인해 주세요", request.getContextPath() + "/member/main.do");

      } else {
        map.put("userId", userId); //현재 로그인한 사용자Id 값 맵에 넘김
        nextPage = "/view/board/market/myList.jsp"; //포워딩 페이지 내상점으로 지정
        addOther = "&myStore="+myStore; // 쿼리스트링 추가(sell 인지 buy인지)
        map.put("myStore", myStore); //맵에 추가
      }
    }



    /* 페이지 처리 start */

    // 게시물 총 개수
    int totalCount = dao.marketSelectCount(map);

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


    // 게시물 목록 받기
    List<BoardDTO> boardLists = dao.marketSelectListPage(map);

    // 뷰에 전달할 매개변수 추가
    String pagingImg = BoardPage.pagingStr(totalCount, pageSize,
            blockPage, pageNum, searchField, searchWord, addOther, request.getContextPath() + "/market/list.do");  // 바로가기 영역 HTML 문자열
    map.put("pagingImg", pagingImg);
    map.put("totalCount", totalCount);
    map.put("pageSize", pageSize);
    map.put("pageNum", pageNum);

    // 전달할 데이터를 request 영역에 저장 후 List.jsp or MyList.jsp로 포워드
    request.setAttribute("boardLists", boardLists);
    request.setAttribute("map", map);
    request.setAttribute("SessionUserId", userId);


    request.getRequestDispatcher(nextPage).forward(request, response);

  }

}

