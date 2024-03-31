package servlet.cscenter;

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

@WebServlet("/cscenter/view.do")
public class ViewController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 게시물 불러오기
        BoardDAO dao = new BoardDAO(); // BoardDAO 객체 생성
        String brdId = req.getParameter("brdId"); //brdId 매개변수 가져옴
        BoardDTO dto = dao.cscenterView(brdId); //brdId에 해당하는 게시물 정보 가져오기

        // 줄바꿈 처리
        dto.setContent(dto.getContent().replaceAll("\r\n", "<br/>"));

        //첨부파일 확장자 추출 및 이미지 타입 확인
        String ext = null, fileName = dto.getSfile();
        if(fileName!=null) {
            // 파일 이름에서 확장자 추출
            ext = fileName.substring(fileName .lastIndexOf(".")+1);
        }
        String[] mimeStr = {"png","jpg","gif","jpeg"}; // MIME 타입
        List<String> mimeList = Arrays.asList(mimeStr); // 배열을 리스트로 변환
        boolean isImage = false;
        if(mimeList.contains(ext)) {
            isImage = true;
        }

        // 게시물(dto) 저장 후 뷰로 포워드
        req.setAttribute("dto", dto);
        req.setAttribute("isImage", isImage);
        req.getRequestDispatcher("/view/board/cscenter/view.jsp").forward(req, resp);
    }
}
