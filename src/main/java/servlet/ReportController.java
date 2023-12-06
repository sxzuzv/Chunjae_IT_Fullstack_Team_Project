package servlet;

import dao.BoardDAO;
import dto.BoardDTO;
import util.JSFunction;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/report/write.do")
public class ReportController extends HttpServlet {

    private BoardDAO dao = new BoardDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        BoardDTO dto = new BoardDTO();

        dto.setUserId((String)request.getSession().getAttribute("userId"));
        dto.setTitle(request.getParameter("title"));
        dto.setContent(request.getParameter("content"));
        dto.setCateSub(2);


        int result = dao.cscenterinsertWrite(dto);

        if (result == 1) {
            JSFunction.alertBack(response, "신고가 완료되었습니다");
        } else {
            System.out.println("신고 실패");
            JSFunction.alertLocation(response, "신고하기에 실패했습니다.", request.getContextPath() + "/report/write.do");
        }
    }
}
