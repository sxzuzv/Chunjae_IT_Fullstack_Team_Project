package servlet;

import dao.BoardDAO;
import dto.BoardDTO;

import javax.servlet.RequestDispatcher;
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

@WebServlet("/main/*")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;

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
		String action = request.getPathInfo();

		
        if(request.getSession().getAttribute("userId") == null) {
            response.sendRedirect(request.getContextPath() + "/member/main.do");
            return;
        }


		try {
			if(action == null){

				nextPage = "/view/main/main.jsp";
				
			} else if("/main.do".equals(action)) {
				//최영주
				BoardDAO brdDao = new BoardDAO();
				Map<String, Object> marketMap = new HashMap<String, Object>();
				List<BoardDTO> marketTopLists = brdDao.marketSelectTop(marketMap); // 조회수 기준 중고게시판 인기글 6개 목록 받기
				request.setAttribute("marketTopLists", marketTopLists);

				//신수진
				
				nextPage = "/view/main/main.jsp";
			} else if(action.equals("/change.do")){
				
				PrintWriter out = response.getWriter();

				out.print("success");
			}

			RequestDispatcher dis = request.getRequestDispatcher(nextPage);
			dis.forward(request, response);
		
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
}
