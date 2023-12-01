//package servlet.market;
//
//import dao.BoardDAO;
//import dto.BoardDTO;
//import util.FileUtil;
//import util.JSFunction;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//import java.io.IOException;
//
//@WebServlet("/market/pass.do")
//public class PassController extends HttpServlet {
//    private static final long serialVersionUID = 1L;
//
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        // 매개변수 저장
//        String brdId = request.getParameter("brdId");
//        String mode = request.getParameter("mode");
//
//        // 비로그인시 튕겨냄
//        if(request.getSession().getAttribute("userId") == null) {
//            JSFunction.alertLocation(response,"로그인해 주세요","/main/main.do");
//            return;
//        }
//
//        // 본인 글이 아닐시 불가 메시지
//        if(request.getSession().getAttribute("userId") == null) {
//            JSFunction.alertBack(response, "해당글에 접근 권한이 없습니다.");
//            return;
//        }
//        // 비밀번호 확인
//        BoardDAO dao = new BoardDAO();
//        boolean confirmed = dao.confirmPassword(pass, brdId);
//        if (confirmed) {  // 비밀번호 일치
//            if (mode.equals("edit")) {  // 수정 모드
//                HttpSession session = request.getSession();
//                session.setAttribute("pass", pass);
//                response.sendRedirect("/market/edit.do?brdId=" + brdId);
//            }
//            else if (mode.equals("delete")) {  // 삭제 모드
//                dao = new BoardDAO();
//                BoardDTO dto = dao.marketSelectView(brdId);
//                int result = dao.deletePost(brdId);  // 게시물 삭제
//                result = result * dao.deletePdtPost(brdId);
//
//                if (result == 1) {  // 게시물 삭제 성공 시 첨부파일도 삭제
//                    String saveFileName = dto.getSfile();
//                    FileUtil.deleteFile(request, "/Uploads", saveFileName);
//                }
//                JSFunction.alertLocation(response, "삭제되었습니다.", "/market/list.do");
//            }
//        }
//        else {  // 비밀번호 불일치
//            JSFunction.alertBack(response, "비밀번호 검증에 실패했습니다.");
//        }
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//
//    }
//}
