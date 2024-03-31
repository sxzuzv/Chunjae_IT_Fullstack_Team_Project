package servlet.market;


import dao.BoardDAO;
import dto.BoardDTO;
import util.Encrypt;
import util.FileUtil;
import util.JSFunction;

import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/market/edit.do")
@MultipartConfig(
        maxFileSize = 1024 * 1024 * 1,
        maxRequestSize = 1024 * 1024 * 10
)
public class EditController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String brdId = request.getParameter("brdId");

        BoardDAO dao = new BoardDAO();
        BoardDTO dto = dao.marketSelectView(brdId);
        request.setAttribute("dto", dto);
        request.getRequestDispatcher("/view/board/market/edit.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

         // 1. 파일 업로드 처리 =============================
         // 업로드 디렉터리의 물리적 경로 확인
         String saveDirectory = request.getServletContext().getRealPath("/Uploads");

         // 파일 업로드
         String originalFileName = "";
         try {
             originalFileName = FileUtil.uploadFile(request, saveDirectory);
         } catch (Exception e) {
             JSFunction.alertBack(response, "파일 업로드 오류입니다.");
             return;
         }

         // 2. 파일 업로드 외 처리 =============================
         // 수정 내용을 매개변수에서 얻어옴
         int brdId = Integer.parseInt(request.getParameter("brdId"));
         String prevOfile = request.getParameter("prevOfile");
         String prevSfile = request.getParameter("prevSfile");

         String title = request.getParameter("title");
         String content = request.getParameter("content");
         String buyerId = request.getParameter("buyerId");

         //        // 비밀번호는 session에서 가져옴
         //        HttpSession session = request.getSession();
         //        String pass = (String)session.getAttribute("pass");

         // DTO에 저장
         BoardDTO dto = new BoardDTO();
         dto.setBrdId(brdId);

         dto.setTitle(title);
         dto.setContent(content);

         dto.setCateSub(Integer.parseInt(request.getParameter("cateSub")));
         dto.setPrice(request.getParameter("price"));
         dto.setDealAddress(request.getParameter("dealAddress"));
         dto.setStatus(request.getParameter("status"));

         //구매자 지정한 경우만 저장
         if (buyerId != null) {
           dto.setBuyerId(buyerId);
         }
         // 원본 파일명과 저장된 파일 이름 설정
         if (!originalFileName.isEmpty()) {
             String savedFileName = FileUtil.renameFile(saveDirectory, originalFileName);

             dto.setOfile(originalFileName);  // 원래 파일 이름
             dto.setSfile(savedFileName);  // 서버에 저장된 파일 이름

             // 기존 파일 삭제
             FileUtil.deleteFile(request, "/Uploads", prevSfile);
         } else {
             // 첨부 파일이 없으면 기존 이름 유지
             dto.setOfile(prevOfile);
             dto.setSfile(prevSfile);
         }

         // DB에 수정 내용 반영
         BoardDAO dao = new BoardDAO();
         int result = dao.marketUpdatePost(dto);
         result = result * dao.marketUpdatePostPdt(dto);
         // 성공 or 실패?
         if (result == 1) {  // 수정 성공
             //            session.removeAttribute("pass");
             response.sendRedirect(request.getContextPath() + "/market/view.do?brdId=" + brdId);
         } else {  // 수정 실패
             JSFunction.alertLocation(response, "오류로 수정내용이 반영되지 않았습니다",
                     request.getContextPath() + "/market/view.do?brdId=" + brdId);
         }



    }
}