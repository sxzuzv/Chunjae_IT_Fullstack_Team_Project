package servlet.teachercommunity;

import dao.BoardDAO;
import util.FileUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/teachercommunity/download.do")
public class DownloadController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String ofile = req.getParameter("ofile");
        String sfile = req.getParameter("sfile");

        FileUtil.download(req, resp, "/Uploads", sfile, ofile);
    }
}
