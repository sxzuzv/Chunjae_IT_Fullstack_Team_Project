package servlet.cscenter;

import dao.BoardDAO;
import dto.BoardDTO;
import util.FileUtil;
import util.JSFunction;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/cscenter/write.do")
@MultipartConfig(
        maxFileSize = 1024 * 1024 * 1,
        maxRequestSize = 1024 * 1024 * 10
)
public class WriteController extends HttpServlet {
    private BoardDAO dao = new BoardDAO(); // BoardDAO 객체 생성

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/view/board/cscenter/write.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String saveDirectory = request.getServletContext().getRealPath("/Uploads");
        String originalFileName = "";
        try {
            originalFileName = FileUtil.uploadFile(request, saveDirectory);
        } catch (Exception e) {
            System.out.println("파일 업로드 실패");
            // /jsp_mvc2 => request.getContextPath();
            JSFunction.alertLocation(response, "파일 업로드 오류 발생", request.getContextPath() + "/cscenter/write.do");
            return;
        }
        BoardDTO dto = new BoardDTO();
        dto.setUserId((String)request.getSession().getAttribute("userId"));
        dto.setTitle(request.getParameter("title"));
        dto.setContent(request.getParameter("content"));
        dto.setCateMain(3);
        dto.setCateSub(Integer.parseInt(request.getParameter("cateSub")));

        if (!originalFileName.isEmpty()) {
            String savedFileName = FileUtil.renameFile(saveDirectory, originalFileName);
            dto.setOfile(originalFileName);
            dto.setSfile(savedFileName);
        }

        int result = dao.cscenterinsertWrite(dto);
        if (result == 1) {
            response.sendRedirect(request.getContextPath() + "/cscenter/list.do");
        } else {
            System.out.println("글쓰기 실패");
            JSFunction.alertLocation(response, "글쓰기에 실패했습니다.", request.getContextPath() + "/cscenter/write.do");
        }
    }
}
