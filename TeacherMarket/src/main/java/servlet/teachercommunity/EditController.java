package servlet.teachercommunity;

import dao.BoardDAO;
import dto.BoardDTO;
import dto.CategoriesDTO;
import util.FileUtil;
import util.JSFunction;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/teachercommunity/edit.do")
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
        BoardDTO dto = dao.tcselectView(brdId);
        request.setAttribute("dto", dto);
        request.getRequestDispatcher("/view/board/teachercommunity/edit.jsp").forward(request, response);

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

        // DTO에 저장
        BoardDTO dto = new BoardDTO();
        dto.setBrdId(brdId);

        dto.setTitle(title);
        dto.setContent(content);

        dto.setCateSub(Integer.parseInt(request.getParameter("cateSub")));

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
        int result = dao.tcUpdatePost(dto);
        // 성공 or 실패?
        if (result == 1) {  // 수정 성공
            //            session.removeAttribute("pass");
            response.sendRedirect(request.getContextPath() + "/teachercommunity/view.do?brdId=" + brdId);
        } else {  // 수정 실패
            JSFunction.alertLocation(response, "오류로 수정 내용이 반영되지 않았습니다.",request.getContextPath() +
                    "/teachercommunity/view.do?brdId=" + brdId);
        }
    }
}
