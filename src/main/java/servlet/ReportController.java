package servlet;

import dao.BoardDAO;
import dao.ReportDAO;
import dao.UserDAO;
import dto.BoardDTO;
import dto.ReportDTO;
import util.JSFunction;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/report/write.do")
public class ReportController extends HttpServlet {

    private ReportDAO dao = new ReportDAO();
    private UserDAO userDao = new UserDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
        doHandle(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doHandle(request, response);
    }

    protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //신고 내용 dto에 담음
        ReportDTO dto = new ReportDTO();
        //신고자
        dto.setUserId((String)request.getSession().getAttribute("userId"));
        //피신고자
        String reportedUserId = request.getParameter("userId");

        dto.setReportTitle(request.getParameter("title"));
        dto.setReportContent(request.getParameter("content"));
        dto.setBrdId(Integer.parseInt(request.getParameter("brdId")));

        // report 테이블 Insert문 실행
        int result = dao.reportInsertWrite(dto);
        // user 테이블 report_cnt +1
        result = result * userDao.updateUserRptCnt(reportedUserId);

        if (result == 1) {
            JSFunction.alertBack(response, "신고가 완료되었습니다");
        } else {
            System.out.println("신고 실패");
            JSFunction.alertBack(response, "신고하기에 실패했습니다.");
        }
    }
}
