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
import java.util.List;

@WebServlet("/mainPage/*")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	List<BoardDTO> marketTopLists = null;
	@Override
	public void init(){
		System.out.println("여긴 몇번");
		BoardDAO brdDao = new BoardDAO();
		marketTopLists = brdDao.marketSelectTop(); // 조회수 기준 중고게시판 인기글 6개 목록 받기
	}
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nextPage = "";
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		String action = request.getPathInfo();

		request.setAttribute("marketTopLists", marketTopLists);



		try {
			if(action == null){

				nextPage = "/view/main/main.jsp";
				
			} else if("/mainPage.do".equals(action)) {
				//최영주


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
