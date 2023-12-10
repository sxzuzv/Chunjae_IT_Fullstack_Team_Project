package servlet;

import dao.BoardDAO;
import dao.UserDAO;
import dto.BoardDTO;
import dto.UserDTO;
import util.Encrypt;
import util.FileUtil;
import util.JSFunction;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.List;

@WebServlet("/member/*")
@MultipartConfig(
		maxFileSize = 1024 * 1024 * 1,
		maxRequestSize = 1024 * 1024 * 10
)
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserDAO userDao;


	public UserController() {
		super();
	}

	@Override
	public void init() throws ServletException {

		userDao = new UserDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doHandle(request, response);
	}


	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nextPage = null;
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session;

		String action = request.getPathInfo();

		if (action == null) {
			nextPage = "/view/member/login.jsp";

		} else if (action.equals("/find.do")) {
			nextPage = "/view/member/find.jsp";

		} else if ("/main.do".equals(action)) {
			nextPage = "/view/member/login.jsp";


		}else if ("/updateform.do".equals(action)) {
			nextPage = "/view/member/update.jsp";


		} else if (action.equals("/join.do")) {
			nextPage = "/view/member/join.jsp";

		} else if ("/idFind.do".equals(action)) {
			//아이디찾기
			String userName = request.getParameter("userName");
			String userEmail = request.getParameter("userEmail");
			String userId = userDao.authenticateFind(userName, userEmail);
			request.setAttribute("memberId", userId);
			if (userId == null) {
				//아이디가 일치하지 않을때
				PrintWriter out = response.getWriter();
				out.print("<script>"
						+ "  alert('일치하는 정보가 없습니다.');"   // 알림창
						+ " location.href='" + request.getContextPath() + "/view/member/find.jsp';"  // 로그인 페이지로 이동
						+ "</script>");

			} else {
				request.getSession(false);
				nextPage = "/view/member/findcomplete.jsp";
			}

		} else if ("/passFind.do".equals(action)) {
			//비밀번호변경으로 넘어가기
			String userId = request.getParameter("userId");
			String userEmail = request.getParameter("userEmail");
			String userCp = request.getParameter("userCp");

			boolean authenticateId = userDao.authenticateFindPass(userId, userEmail, userCp);
			if (authenticateId) {
				request.getSession().setAttribute("memberId", userId);
				nextPage = "/view/member/passChange.jsp";

			} else {
				PrintWriter out = response.getWriter();
				out.print("<script>"
						+ "  alert('일치하는 정보가 없습니다.');"   // 알림창
						+ " location.href='" + request.getContextPath() + "/view/member/find.jsp';"  // 로그인 페이지로 이동
						+ "</script>");


			}
		} else if ("/passChange.do".equals(action)) {
			//비밀번호 변경
			UserDTO userDTO = new UserDTO();
			userDTO.setUserId((String) request.getSession().getAttribute("memberId"));
			userDTO.setUserPwd(Encrypt.getEncrypt(request.getParameter("userPW")));
			int result = userDao.updatePass(userDTO);

			if (result == 1) {
				request.getSession().removeAttribute("memberId");
				PrintWriter out = response.getWriter();
				out.print("<script>"
						+ "  alert('비밀번호가 변경 되었습니다..');"   // 알림창
						+ " location.href='" + request.getContextPath() + "/view/member/login.jsp';"  // 로그인 페이지로 이동
						+ "</script>");
			} else {
				PrintWriter out = response.getWriter();
				out.print("<script>"
						+ "  alert('비밀번호가 변경에 실패했습니다. 다시 진행해 주세요');"   // 알림창
						+ " location.href='" + request.getContextPath() + "/view/member/find.jsp';"  // 로그인 페이지로 이동
						+ "</script>");

			}


		} else if (action.equals("/save.do")) {
			//회원가입
			String saveDirectory = request.getServletContext().getRealPath("/Uploads");
			String originalFileName = "";
			try {
				originalFileName = FileUtil.uploadFile(request, saveDirectory);
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("파일 업로드 실패");
				JSFunction.alertLocation(response, "파일 업로드 오류 발생", request.getContextPath() + "/market/write.do");
				return;
			}
			UserDTO userDTO = new UserDTO();

			userDTO.setUserId(request.getParameter("userID"));
			userDTO.setUserPwd(Encrypt.getEncrypt(request.getParameter("userPW")));
			userDTO.setUserName(request.getParameter("name"));
			userDTO.setUser_nick(request.getParameter("nickname"));
			userDTO.setUserCp(request.getParameter("tel"));
			userDTO.setUserEmail(request.getParameter("email"));
			userDTO.setUserAddr(request.getParameter("addr"));
			userDTO.setUserDaddr(request.getParameter("addr2"));
			userDTO.setUserSchool(request.getParameter("userschool"));

			if (!originalFileName.isEmpty()) {
				String savedFileName = FileUtil.renameFile(saveDirectory, originalFileName);
				userDTO.setOfile(originalFileName);
				userDTO.setSfile(savedFileName);
			}
			int result = userDao.createUser(userDTO);

			if (result == 1) {
				PrintWriter out = response.getWriter();
				out.print("<script>"
						+ "  alert('회원가입 되었습니다...');"   // 알림창
						+ " location.href='" + request.getContextPath() + "/member/main.do';"  // 회원정보 보여주는 화면으로이동
						+ "</script>");

			} else {
				PrintWriter out = response.getWriter();
				out.print("<script>"
						+ "  alert('회원정보 가입에 실패했습니다. 다시 진행해 주세요');"   // 알림창
						+ " location.href='" + request.getContextPath() + "view/member/login.jsp';"  // 로그인 페이지로 이동
						+ "</script>");


			}


		} else if (action.equals("/update.do")) {
			// 회원정보수정
			UserDTO userDTO = new UserDTO();
			userDTO.setUserId((String) request.getSession().getAttribute("userId"));
			userDTO.setUserPwd(Encrypt.getEncrypt(request.getParameter("userPW")));
			userDTO.setUserEmail(request.getParameter("email"));
			userDTO.setUser_nick(request.getParameter("nickname"));
			userDTO.setUserAddr(request.getParameter("addr"));
			userDTO.setUserDaddr(request.getParameter("addr2"));
			userDTO.setUserCp(request.getParameter("tel"));


			int result = userDao.updateUserInfo(userDTO);

			if (result == 1) {
				PrintWriter out = response.getWriter();
				out.print("<script>"
						+ "  alert('회원정보가 변경 되었습니다..');"   // 알림창
						+ " location.href='" + request.getContextPath() + "/member/mypage.do';"  // 회원정보 보여주는 화면으로이동
						+ "</script>");
			} else {
				PrintWriter out = response.getWriter();
				out.print("<script>"
						+ "  alert('회원정보 변경에 실패했습니다. 다시 진행해 주세요');"   // 알림창
						+ " location.href='" + request.getContextPath() + "login.do';"  // 로그인 페이지로 이동
						+ "</script>");

			}


		} else if ("/login.do".equals(action)) {
			String userID = request.getParameter("userID");
			String userPW = Encrypt.getEncrypt(request.getParameter("userPW"));

			//password 암호화
			//String hashedPassword = sha256Hash(userPW);

			// 로그인 처리
			boolean isAuthenticated = userDao.authenticateUser(userID, userPW);
			String isStatus = userDao.authenticateStatus(userID);
			String isAdmin = userDao.authenticateAdmin(userID);
			if (isAuthenticated) {
				if (isStatus.equals("pass") && isAdmin.equals("E")) {
					// 로그인 성공 가입승인된사람
					request.getSession().setAttribute("userId", userID);
					//로그인 성공시 접속날짜 업데이트. sql에서 SYSDATE() 또는 now() 함수를 써도됨
					Date utilDate = new Date();
					java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
					//	userDao.joinDateUpdate(userID, sqlDate);

					nextPage = "/mainPage/mainPage.do";
				} else if (isStatus.equals("pass") && isAdmin.equals("A")) {
					//로그인 성공 관리자
					request.getSession().setAttribute("userId", userID);
					request.getSession().setAttribute("userStatus", isAdmin);
					PrintWriter out = response.getWriter();
					out.print("<script>"
							+ "  alert('관리자로 로그인 합니다.');"   // 알림창

							+ " location.href='" + request.getContextPath() + "/admin/memberlist.do';"  // 로그인 페이지로 이동

							+ "</script>");

				}else if(isStatus.equals("pending") && isAdmin.equals("E")){
					userDao.userSelfDelete(userID);
					PrintWriter out = response.getWriter();
					out.print("<script>"
							+ "  alert('가입승인이 거절되어 다시 가입해주세요.');"   // 알림창

							+ " location.href='" + request.getContextPath() + "/member/join.do';"  // 로그인 페이지로 이동

							+ "</script>");

				}else {// 로그인 실패
					PrintWriter out = response.getWriter();
					out.print("<script>"
							+ "  alert('아직 승인이 완료되지 않았습니다.');"   // 알림창
							+ " location.href='" + request.getContextPath() + "/member/main.do';"  // 로그인 페이지로 이동
							+ "</script>");

					return;

				}

			} else {
				// 로그인 실패
				PrintWriter out = response.getWriter();
				out.print("<script>"
						+ "  alert('아이디 또는 비밀번호가 올바르지 않습니다.');"   // 알림창
						+ " location.href='" + request.getContextPath() + "/member/main.do';"  // 로그인 페이지로 이동
						+ "</script>");

				return;
			}
		} else if ("/checkId.do".equals(action)) {
			//회원가입시 중복 아이디 체크
			PrintWriter out = response.getWriter();

			String userId = request.getParameter("userID");

			boolean checkID = userDao.idCheck(userId);
			if (checkID)
				out.print("fail");
			else
				out.print("success");

			return;


		} else if ("/mypage.do".equals(action)) {
			//마이페이지 들어가면서 회원정보 보여줌
			String userId = (String) request.getSession().getAttribute("userId");
			UserDTO userDTO = userDao.userSelectView(userId);


			request.setAttribute("userDTO", userDTO);
			request.getRequestDispatcher("/view/member/mypage.jsp").forward(request, response);

		} else if("/selfDelete.do".equals(action)) {
			//회원 탈퇴
			String userId = (String) request.getSession().getAttribute("userId");
			int result = userDao.userSelfDelete(userId);
			if (result == 1) {
				PrintWriter out = response.getWriter();
				out.print("<script>"
						+ "  alert('회원이 정성적으로 탈퇴 되었습니다.');"   // 알림창
						+ " location.href='" + request.getContextPath() + "/member/main.do';"
						+ "</script>");
				session = request.getSession(false);
				session.removeAttribute("userId"); // 세션에서 userId 속성 제거
				session.invalidate(); // 세션 무효화
				return;
			} else {
				PrintWriter out = response.getWriter();
				out.print("<script>"
						+ "  alert('삭제되지 않았습니다');"   // 알림창
						+ " location.href='" + request.getContextPath() + "/member/main.do';"
						+ "</script>");
				return;

			}
		}else if (action.equals("/logout.do")) {
			//로그아웃
			session = request.getSession(false); // 세션 객체 생성하지 않고 기존 세션을 가져옴
			if (session != null) {
				session.removeAttribute("userId"); // 세션에서 userId 속성 제거
				session.invalidate(); // 세션 무효화
			}
			nextPage = "/view/member/login.jsp";
		} else {
			nextPage = "/view/member/login.jsp";
		}

		RequestDispatcher dis = request.getRequestDispatcher(nextPage);
		dis.forward(request, response);
	}
}

