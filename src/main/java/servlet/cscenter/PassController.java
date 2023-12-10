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
        String brdId = request.getParameter("brdId");   // brdId 받아옴
        String mode = request.getParameter("mode");     // mod 받아옴
        String userId = (String) request.getSession().getAttribute("userId"); // 세션에서 userId 가져옴

        boolean confirmed = false; // 비밀번호 확인 결과를 저장할 변수를 초기화
        BoardDAO dao = new BoardDAO(); // BoardDAO 객체 생성

        // 비 로그인 시 수정 불가
        if (userId == null) {
            // userId가 없다면 경고창을 띄우고, main으로 이동
            JSFunction.alertLocation(response, "로그인 후 이용 가능합니다.", request.getContextPath() + "/main/main.do");
        } else {
            if (mode.equals("write")) {
                response.sendRedirect(request.getContextPath() + "/cscenter/write.do");
                return;
            } else { // 로그인 시 확인
                dao = new BoardDAO();
                confirmed = dao.confirmPassword(userId, brdId);
                System.out.println(brdId);
            }
        }


            if (confirmed) {  // 비밀번호 일치
                if (mode.equals("edit")) {  // 수정 모드

                    response.sendRedirect(request.getContextPath() + "/cscenter/edit.do?brdId=" + brdId);

                } else if (mode.equals("delete")) {  // 삭제 모드
                    BoardDTO dto = dao.cscenterView(brdId);
                    int result = dao.deletePost(brdId);  // 게시물 삭제

                    if (result == 1) {  // 게시물 삭제 성공 시 첨부파일도 삭제
                        String saveFileName = dto.getSfile();
                        FileUtil.deleteFile(request, "/Uploads", saveFileName);
                    }
                    // 삭제완료 출력 후 게시판 목록으로 이동.
                    JSFunction.alertLocation(response, "삭제되었습니다.", request.getContextPath() + "/cscenter/list.do");
                }
            } else {  // 비밀번호 불일치치 메시지 띄우고 뒤로 보내기
                JSFunction.alertBack(response, "해당글에 접근 권한이 없습니다.");
            }
        }

        @Override
        protected void doPost (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        }
    }

