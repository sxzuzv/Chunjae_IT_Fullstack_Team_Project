package servlet;

import dao.UserDAO;
import dto.UserDTO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
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

@WebServlet("/member/*")
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

		String nextPage = null;
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session;

		String action = request.getPathInfo();

		if (action == null) {
			nextPage = "/view/member/login.jsp";

		}else if(action.equals("/find.do")){
			nextPage = "/view/member/find.jsp";

		}
		else if ("/main.do".equals(action)) {
			nextPage = "/view/member/login.jsp";


		} else if ("/idFind.do".equals(action)) {
			//아이디찾기
			String userName = request.getParameter("userName");
			String userEmail = request.getParameter("userEmail");
			String userId = userDao.authenticateFind(userName,userEmail);
			request.setAttribute("userId", userId);
			if(userId == null){
				//아이디가 일치하지 않을때
				PrintWriter out = response.getWriter();
				out.print("<script>"
						+ "  alert('일치하는 정보가 없습니다.');"   // 알림창
						+ " location.href='" + request.getContextPath() + "/view/member/find.jsp';"  // 로그인 페이지로 이동
						+ "</script>");

			}else {


				nextPage = "/view/member/findcomplete.jsp";
			}

		}else if ("/passFind.do".equals(action)) {
			//비밀번호변경으로 넘어가기
			String userId = request.getParameter("userId");
			String userEmail = request.getParameter("userEmail");
			String userCp= request.getParameter("userCp");

			boolean authenticateId = userDao.authenticateFindPass(userId, userEmail, userCp);
			if(authenticateId){
				request.getSession().setAttribute("userId", userId);
				nextPage = "/view/member/passChange.jsp";

			}else{
				PrintWriter out = response.getWriter();
				out.print("<script>"
						+ "  alert('일치하는 정보가 없습니다.');"   // 알림창
						+ " location.href='" + request.getContextPath() + "/view/member/find.jsp';"  // 로그인 페이지로 이동
						+ "</script>");



			}
		} else if ("/passChange.do".equals(action)) {
			UserDTO userDTO = new UserDTO();
			userDTO.setUserId((String)request.getSession().getAttribute("userId"));
			userDTO.setUserPwd(request.getParameter("userPW"));
			int result = userDao.updatePass(userDTO);

			if (result == 1) {
				request.getSession().removeAttribute("userId");
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


			} else if (action.equals("/save.do")) {//회원가입
			// 정보 세팅
			UserDTO userDTO = new UserDTO();
			userDTO.setUserId(request.getParameter("userID"));
			userDTO.setUserPwd(request.getParameter("userPW"));
			userDTO.setUserName(request.getParameter("name"));
			userDTO.setUser_nick(request.getParameter("nickname"));
			userDTO.setUserCp(request.getParameter("tel"));
			userDTO.setUserEmail(request.getParameter("email"));
			userDTO.setUserAddr(request.getParameter("addr"));
			userDTO.setUserDaddr(request.getParameter("addr2"));
			userDTO.setUserSchool(request.getParameter("userschool"));


			// 저장
			userDao.createUser(userDTO);

			nextPage = "/member/main.do";

//		} else if (action.equals("/update.do")) {
//			// 회원정보수정
//			String userPW = request.getParameter("userPW");
//			String name = request.getParameter("name");
//			String tel = request.getParameter("tel");
//			String email = request.getParameter("email");
//			String addr = request.getParameter("addr");
//			String addr2 = request.getParameter("addr2");
//
//
//			UserDTO user = new UserDTO();
//
//			user.setUserId((String)	request.getSession().getAttribute("userId"));
//
//			if(userPW == null)
//			{
//				UserDTO user2=userDao.selectById(user.getUserId());
//				user.setUserPwd(user2.getUserPwd());
//			} else {
//				String hashedPassword = sha256Hash(userPW);
//				user.setUserPwd(hashedPassword);
//			}
//
//			user.setUserEmail(email);
//			user.setUserName(name);
//			user.setUserAddr(addr);
//			user.setUserDaddr(addr2);
//			user.setUserCp(tel);
//
//			userDao.update(user);


//			nextPage = "/main/main.do";
		} else if (action.equals("/join.do")) {
			nextPage = "/view/member/join.jsp";
		} else if ("/login.do".equals(action)) {
			String userID = request.getParameter("userID");
			String userPW = request.getParameter("userPW");

			//password 암호화
			//String hashedPassword = sha256Hash(userPW);

			// 로그인 처리
			boolean isAuthenticated = userDao.authenticateUser(userID, userPW);
			String isStatus = userDao.authenticateStatus(userID);
			String isAdmin = userDao.authenticateAdmin(userID);
			if (isAuthenticated) {
				if (isStatus.equals("pass")&&isAdmin.equals("E")) {
					// 로그인 성공 가입승인된사람
					request.getSession().setAttribute("userId", userID);
					//로그인 성공시 접속날짜 업데이트. sql에서 SYSDATE() 또는 now() 함수를 써도됨
					Date utilDate = new Date();
					java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
					//	userDao.joinDateUpdate(userID, sqlDate);

					nextPage = "/main/main.do";
				} else if (isStatus.equals("pass")&&isAdmin.equals("A")) {
					//로그인 성공 관리자
					request.getSession().setAttribute("userId", userID);
					PrintWriter out = response.getWriter();
					out.print("<script>"
							+ "  alert('관리자로 로그인 합니다.');"   // 알림창

							+ " location.href='" + request.getContextPath() + "/view/admin/admin_list.jsp';"  // 로그인 페이지로 이동

							+ "</script>");

				} else {// 로그인 실패
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
		} //회원가입시 중복 아이디 체크
		else if ("/checkId.do".equals(action)) {
			PrintWriter out = response.getWriter();

			String userId = request.getParameter("userID");

			boolean checkID = userDao.idCheck(userId);
			if (checkID)
				out.print("fail");
			else
				out.print("success");

			return;
//		}else if (action.equals("/updatefrom.do")) {
//
//			session = request.getSession();
//			String userId = (String) session.getAttribute("userId");
//
//			UserDTO user= userDao.selectById(userId);
//			request.setAttribute("user", user);
//			nextPage = "/view/member/update.jsp";

			//로그아웃
		}else if (action.equals("/logout.do")) {
			session = request.getSession(false); // 세션 객체 생성하지 않고 기존 세션을 가져옴
			if (session != null) {
				session.removeAttribute("userId"); // 세션에서 userId 속성 제거
				session.invalidate(); // 세션 무효화
			}
			nextPage = "/view/member/login.jsp";
		}else {
			nextPage = "/view/member/login.jsp";
		}

		RequestDispatcher dis = request.getRequestDispatcher(nextPage);
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}


	public static String sha256Hash(String input) {
		try {
			MessageDigest digest = MessageDigest.getInstance("SHA-256");
			byte[] hash = digest.digest(input.getBytes(StandardCharsets.UTF_8));

			// 해시 값을 16진수 문자열로 변환
			StringBuilder hexString = new StringBuilder();
			for (byte b : hash) {
				String hex = Integer.toHexString(0xff & b);
				if (hex.length() == 1) {
					hexString.append('0');
				}
				hexString.append(hex);
			}

			return hexString.toString();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			return null;
		}
	}
}

