package servlet;

import dao.BoardDAO;
import dto.BoardDTO;
import util.Encrypt;
import util.FileUtil;
import util.JSFunction;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "WriteController", value = "/board/write.do")
@MultipartConfig(
        maxFileSize = 1024 * 1024 * 1,
        maxRequestSize = 1024 * 1024 * 10
)
public class WriteController extends HttpServlet {

    private BoardDAO dao = new BoardDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("../view/board/write.jsp").forward(request, response);
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
            JSFunction.alertLocation(response, "파일 업로드 오류 발생", request.getContextPath() + "/board/write.do");
            return;
        }
        BoardDTO dto = new BoardDTO();

        dto.setTitle(request.getParameter("title"));
        dto.setContent(request.getParameter("content"));
        dto.setCateMain(1);
        dto.setCateSub(Integer.parseInt(request.getParameter("cateSub")));
        dto.setPrice(request.getParameter("price"));
        dto.setDealAddress(request.getParameter("dealAddress"));


        if (!originalFileName.isEmpty()) {
            String savedFileName = FileUtil.renameFile(saveDirectory, originalFileName);
            dto.setOfile(originalFileName);
            dto.setSfile(savedFileName);
        }
        int result = dao.insertWrite(dto);
        result = result * dao.insertWritePdt(dto);

        if (result == 1) {
            response.sendRedirect(request.getContextPath() + "../view/board/list.do");
        } else {
            System.out.println("글쓰기 실패");
            JSFunction.alertLocation(response, "글쓰기에 실패했습니다.", request.getContextPath() + "/board/write.do");
        }
    }
}
