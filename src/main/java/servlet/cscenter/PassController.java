package servlet.cscenter;

import dao.BoardDAO;
import dto.BoardDTO;
import util.FileUtil;
import util.JSFunction;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/cscenter/pass.do")
public class PassController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 매개변수 저장
        String brdId = request.getParameter("brdId");
        String mode = request.getParameter("mode");
        String userId = (String)request.getSession().getAttribute("userId");

        boolean confirmed = false;
        BoardDAO dao = new BoardDAO();

        // 비 로그인 시 수정 불가
        if( userId == null) {

            JSFunction.alertLocation(response,"로그인 후 이용 가능합니다.",request.getContextPath() + "/main/main.do");

        }else{ // 로그인 시 확인
            dao = new BoardDAO();
            confirmed = dao.confirmPassword(userId, brdId);
            System.out.println(brdId);
        }


        if (confirmed) {  // 비밀번호 일치
            if (mode.equals("edit")) {  // 수정 모드

                response.sendRedirect(request.getContextPath() + "/cscenter/edit.do?brdId=" + brdId);

            }
            else if (mode.equals("delete")) {  // 삭제 모드
                BoardDTO dto = dao.cscenterView(brdId);
                int result = dao.deletePost(brdId);  // 게시물 삭제

                if (result == 1) {  // 게시물 삭제 성공 시 첨부파일도 삭제
                    String saveFileName = dto.getSfile();
                    FileUtil.deleteFile(request, "/Uploads", saveFileName);
                }
                JSFunction.alertLocation(response, "삭제되었습니다.", request.getContextPath() + "/cscenter/list.do");
            }
        }
        else {  // 비밀번호 불일치
            JSFunction.alertBack(response, "해당글에 접근 권한이 없습니다.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}
