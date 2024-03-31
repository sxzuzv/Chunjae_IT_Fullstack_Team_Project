package servlet.admin;

import dao.BoardDAO;
import dao.ReportDAO;
import dto.BoardDTO;
import dto.ReportDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

@WebServlet("/admin/reportView.do")
public class ReportViewController extends HttpServlet{

    private static final long serialVersionUID = 1L;

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        // 게시물 불러오기
        ReportDAO dao = new ReportDAO();
        String reportId = request.getParameter("reportId");
        ReportDTO dto = dao.reportSelectView(reportId);



        // 게시물(dto) 저장 후 뷰로 포워드
        request.setAttribute("dto", dto);

        request.getRequestDispatcher("/view/admin/reportView.jsp").forward(request, response);
    }
}



