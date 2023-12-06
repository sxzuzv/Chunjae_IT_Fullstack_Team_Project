package servlet.admin;

import dao.BoardDAO;
import dao.UserDAO;
import dto.BoardDTO;
import dto.UserDTO;
import util.BoardPage;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
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

@WebServlet("/admin/*")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	UserDAO userDao;

	public AdminController() {
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


		if (action == null) {

			nextPage = "/view/main/main.jsp";

		} else if (action.equals("/memberlist.do")) {//
			//status가 reject인 회원만 불러오기
			Map<String, Object> map = new HashMap<String, Object>();
			String searchField = request.getParameter("searchField");
			String searchWord = request.getParameter("searchWord");

			if (searchWord != null) {
				// 쿼리스트링으로 전달받은 매개변수 중 검색어가 있다면 map에 저장
				map.put("searchField", searchField);
				map.put("searchWord", searchWord);
			}
			String addOther = "";


			int totalCount = userDao.userSelectNonPassCount(map);
			ServletContext application = getServletContext();
			int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
			int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));

			int pageNum = 1;  // 기본값
			String pageTemp = request.getParameter("pageNum");
			if (pageTemp != null && !pageTemp.equals(""))
				pageNum = Integer.parseInt(pageTemp); // 요청받은 페이지로 수정

			// 목록에 출력할 게시물 범위 계산
			int start = (pageNum - 1) * pageSize;  // 첫 게시물 번호
			int end = pageNum * pageSize; // 마지막 게시물 번호

			map.put("start", start);
			map.put("end", end);

			List<UserDTO> userlist = userDao.userSelectNonPassPage(map);
			String pagingImg = BoardPage.pagingStr(totalCount, pageSize,
					blockPage, pageNum, searchField, searchWord, addOther, request.getContextPath() + "/admin/memberlist.do");  // 바로가기 영역 HTML 문자열
			map.put("pagingImg", pagingImg);
			map.put("totalCount", totalCount);
			map.put("pageSize", pageSize);
			map.put("pageNum", pageNum);

			request.setAttribute("list", userlist);
			request.setAttribute("map", map);

			nextPage = "/view/member/member_list.jsp";


		}else if (action.equals("/memreportlist.do")) {//
			//status가 reject인 회원만 불러오기
			Map<String, Object> map = new HashMap<String, Object>();
			String searchField = request.getParameter("searchField");
			String searchWord = request.getParameter("searchWord");

			if (searchWord != null) {
				// 쿼리스트링으로 전달받은 매개변수 중 검색어가 있다면 map에 저장
				map.put("searchField", searchField);
				map.put("searchWord", searchWord);
			}
			String addOther = "";


			int totalCount = userDao.userSelectReportCount(map);
			ServletContext application = getServletContext();
			int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
			int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));

			int pageNum = 1;  // 기본값
			String pageTemp = request.getParameter("pageNum");
			if (pageTemp != null && !pageTemp.equals(""))
				pageNum = Integer.parseInt(pageTemp); // 요청받은 페이지로 수정

			// 목록에 출력할 게시물 범위 계산
			int start = (pageNum - 1) * pageSize;  // 첫 게시물 번호
			int end = pageNum * pageSize; // 마지막 게시물 번호

			map.put("start", start);
			map.put("end", end);

			List<UserDTO> userlist = userDao.userSelectReportPage(map);
			String pagingImg = BoardPage.pagingStr(totalCount, pageSize,
					blockPage, pageNum, searchField, searchWord, addOther, request.getContextPath() + "/admin/memreportlist.do");  // 바로가기 영역 HTML 문자열
			map.put("pagingImg", pagingImg);
			map.put("totalCount", totalCount);
			map.put("pageSize", pageSize);
			map.put("pageNum", pageNum);

			request.setAttribute("reportlist", userlist);
			request.setAttribute("map", map);

			nextPage = "/view/member/member_list.jsp";


		}else if (action.equals("/pass.do")) {
			//회원승인시
			String userId = request.getParameter("id");
			int result = userDao.updateUserPass(userId);
			if (result == 1) {
				PrintWriter out = response.getWriter();
				out.print("<script>"
						+ "  alert('회원승인.');"   // 알림창
						+ " location.href='" + request.getContextPath() + "/admin/memberlist.do';"
						+ "</script>");

			} else {
				PrintWriter out = response.getWriter();
				out.print("<script>"
						+ "  alert('승인 거절 오류');"   // 알림창
						+ " location.href='" + request.getContextPath() + "/admin/memberlist.do';"
						+ "</script>");

			}


		} else if (action.equals("/remove2.do")) {               // 회원 삭제
			String userId = request.getParameter("id");
			int result = userDao.updateUserPending(userId);
			if (result == 1) {
				PrintWriter out = response.getWriter();
				out.print("<script>"
						+ "  alert('회원승인 거절.');"   // 알림창
						+ " location.href='" + request.getContextPath() + "/admin/memberlist.do';"
						+ "</script>");

			} else {
				PrintWriter out = response.getWriter();
				out.print("<script>"
						+ "  alert('승인 거절 오류');"   // 알림창
						+ " location.href='" + request.getContextPath() + "/admin/memberlist.do';"
						+ "</script>");

			}

		} else if (action.equals("/dropuser.do")) {
			String userId = request.getParameter("id");
			int result = userDao.updateUserDrop(userId);
			if (result == 1) {
				PrintWriter out = response.getWriter();
				out.print("<script>"
						+ "  alert('회원강퇴.');"   // 알림창
						+ " location.href='" + request.getContextPath() + "/admin/memreportlist.do';"
						+ "</script>");

			}else{
				PrintWriter out = response.getWriter();
				out.print("<script>"
						+ "  alert('회원탈퇴 실패.');"   // 알림창
						+ " location.href='" + request.getContextPath() + "/admin/memberReportList.do';"
						+ "</script>");

			}


		}

		RequestDispatcher dis = request.getRequestDispatcher(nextPage);
		dis.forward(request, response);

	}
}