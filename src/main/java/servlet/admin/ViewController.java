package servlet.admin;

import dao.BoardDAO;
import dto.BoardDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

@WebServlet("/admin/view.do")
public class ViewController extends HttpServlet{

        private static final long serialVersionUID = 1L;

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

            request.setCharacterEncoding("UTF-8");
            response.setContentType("text/html; charset=UTF-8");

            // 게시물 불러오기
            BoardDAO dao = new BoardDAO();
            String brdId = request.getParameter("brdId");
            BoardDTO dto = dao.adselectView(brdId);


            // 줄바꿈 처리
            dto.setContent(dto.getContent().replaceAll("\r\n", "<br/>"));

            //첨부파일 확장자 추출 및 이미지 타입 확인
            String ext = null, fileName = dto.getSfile();
            if(fileName!=null) {
                ext = fileName.substring(fileName .lastIndexOf(".")+1);
            }
            String[] mimeStr = {"png","jpg","gif","jpeg"};
            List<String> mimeList = Arrays.asList(mimeStr);
            boolean isImage = false;
            if(mimeList.contains(ext)) {
                isImage = true;
            }
            //현재 로그인 유저 정보 입력
            String userId = (String)request.getSession().getAttribute("userId");

            // 게시물(dto) 저장 후 뷰로 포워드
            request.setAttribute("dto", dto);
            request.setAttribute("isImage", isImage);
            request.setAttribute("SessionUserId", userId);
            request.getRequestDispatcher("/view/admin/view.jsp").forward(request, response);
        }
    }



