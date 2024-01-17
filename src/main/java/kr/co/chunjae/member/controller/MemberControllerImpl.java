package kr.co.chunjae.member.controller;

import kr.co.chunjae.common.base.BaseController;
import kr.co.chunjae.member.service.MemberService;
import kr.co.chunjae.member.vo.MemberVO;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.Map;
import java.util.Random;


@Controller("memberController")
@RequestMapping(value="/member")
@RequiredArgsConstructor
@Slf4j
public class MemberControllerImpl extends BaseController implements MemberController{

	private final MemberService memberService;

	private final JavaMailSender mailSender;

	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwencoder;


	@Override
	@RequestMapping(value="/loginForm.do" ,method = RequestMethod.GET)
	public String loginForm(HttpServletRequest request, String error, String logout, Model model) throws Exception{
		String viewName=(String)request.getAttribute("viewName");
		String memberId = "";
//		Cookie[] cookies = request.getCookies();
//		for(Cookie cookie : cookies) {
//			if (cookie.getName().equals("rememberId")) {
//				memberId = cookie.getValue();
//			}
//		}
		if (error != null) {
			model.addAttribute("error", "아이디나 비밀번호를 확인해 주세요");
		}

		if (logout != null) {
			model.addAttribute("logout", "Logout!!");
		}
		request.setAttribute("rememberId", memberId);
		return viewName;
	}

//	@Override
//	@RequestMapping(value="/login.do" ,method = RequestMethod.POST)
//	public String login(@RequestParam Map<String, String> loginMap,
//						@RequestParam(value="rememberId", required = false) String rememberId,
//			                  HttpServletRequest request,HttpServletResponse response, Model model) throws Exception {
//		String viewname = "";
//		MemberVO memberVO=memberService.login(loginMap);
//
//		if(memberVO!= null && memberVO.getMemberId()!=null){
//			HttpSession session=request.getSession();
//			session=request.getSession();
//			session.setAttribute("isLogOn", true);
//			session.setAttribute("memberInfo",memberVO);
//
//			//쿠키생성
//			Cookie cookie = new Cookie("rememberId" , memberVO.getMemberId());
//			if(rememberId != null) {
//				cookie.setMaxAge((60*60*2));
//			}else{
//				cookie.setMaxAge(0);
//			}
//			response.addCookie(cookie);
//
//
//
//			String action=(String)session.getAttribute("action");
//			//action을 통해서 로그인되었을 경우 넘어갈수 있게함 로그인이 안되었을경우 튕기게함
//			if(action!=null && action.equals("/order/orderEachGoods.do")){
//				viewname = "forward:"+action;
//			}else{
//				viewname = "redirect:/main/main.do";
//			}
//
//
//
//		}else{
//			String message="아이디나  비밀번호가 틀립니다. 다시 로그인해주세요";
//			model.addAttribute("message", message);
//			viewname = "/member/loginForm";
//		}
//		if (memberVO != null) {
//			// 세션에 저장된 MemberVO 객체가 null이 아닌 경우
//			// MemberVO 객체에 저장된 정보 출력 또는 로깅
//			System.out.println("Member ID: " + memberVO.getMemberId());
//			// 필요한 다른 정보들도 출력 또는 로깅
//		} else {
//			// 세션에 MemberInfo 객체가 없는 경우 또는 null인 경우
//			System.out.println("No member info found in the session.");
//		}
//		return viewname;
//	}
	
//	@Override
//	@RequestMapping(value="/logout.do" ,method = RequestMethod.GET)
//	public String logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		HttpSession session=request.getSession();
//		session.setAttribute("isLogOn", false);
//		session.removeAttribute("memberInfo");
//		return "redirect:/main/main.do";
//	}
	
	@Override
	@RequestMapping(value="/addMember.do" ,method = RequestMethod.POST)
	public ResponseEntity addMember(@Validated @ModelAttribute("memberVO") MemberVO memberVO,
									HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();

		//암호화
		String pw = memberVO.getMemberPw();
		memberVO.setMemberId(pwencoder.encode(pw));

		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
		    memberService.addMember(memberVO);
		    message  = "<script>";
		    message +=" alert('회원 가입을 마쳤습니다.로그인창으로 이동합니다.');";
		    message += " location.href='"+request.getContextPath()+"/member/loginForm.do';";
		    message += " </script>";

		}catch(Exception e) {
			message  = "<script>";
		    message +=" alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요');";
		    message += " location.href='"+request.getContextPath()+"/member/memberForm.do';";
		    message += " </script>";
			e.printStackTrace();
		}
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
	@Override
	@RequestMapping(value="/overlapped.do" ,method = RequestMethod.POST)
	public ResponseEntity overlapped(@RequestParam("id") String id,HttpServletRequest request, HttpServletResponse response) throws Exception{
		ResponseEntity resEntity = null;
		String result = memberService.overlapped(id);
		resEntity =new ResponseEntity(result, HttpStatus.OK);
		return resEntity;
	}


	@Override
	@RequestMapping(value="/pwFindForm.do", method = RequestMethod.GET)
	public String passwordFind(HttpServletRequest request){
		String viewName=(String)request.getAttribute("viewName");
		return viewName;
	}

	@Override
	@RequestMapping(value="/pwFind.do", method = RequestMethod.POST)
	public String pwAuth(@RequestParam Map<String, String> authMap, HttpSession session, HttpServletRequest request, HttpServletResponse response,Model model) throws Exception{

		//아이디, 이름, 이메일로 비교
		MemberVO memberVO = memberService.authPwMember(authMap);
		System.out.println(memberVO);

		if (memberVO != null) {//폼에서 받은 정보가 db와 일치할때
			//인증번호 생성
			Random r = new Random();
			int num = r.nextInt(999999);
			session.setAttribute("memberId", memberVO.getMemberId());
			//메일내용
			String setfrom = "jaehyuck1996@naver.com"; // naver
			String tomail = memberVO.getMemberEmail1() + "@" + memberVO.getMemberEmail2();
			String title = "[북토피아] 비밀번호변경 인증 이메일 입니다.";
			String content = System.getProperty("line.separator") + "안녕하세요 회원님" + System.getProperty("line.separator")
					+ "비밀번호찾기(변경) 인증번호는 " + num + " 입니다." + System.getProperty("line.separator"); //
			try {//메일보내기
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "utf-8");

				messageHelper.setFrom(setfrom);
				messageHelper.setTo(tomail);
				messageHelper.setSubject(title);
				messageHelper.setText(content);

				mailSender.send(message);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			model.addAttribute("num", num);
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('이메일로 인증번호를 전송했습니다.');</script>");
            out.flush();
			return "/member/pwAuthForm";
		} else {//일치하는 정보가 없을때
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('일치하는 정보가 없습니다. 정보를 다시입력해 주세요.');</script>");
            out.flush();
			return "/member/pwFindForm";
		}
	}

	@RequestMapping(value="/pwAuth.do", method = RequestMethod.POST)
	public String pwAuth(@RequestParam("emailAuth") String emailAuth,
						 @RequestParam("num") String num, Model model, HttpServletResponse response) throws Exception {
		if(emailAuth.equals(num)) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('인증번호가 일치합니다. 비밀번호 변경화면으로 이동합니다');</script>");
			out.flush();
			return "/member/pwChangeForm";

		}else{
			model.addAttribute("num", num);
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('인증번호가 다릅니다. 다시 입력해주세요.');</script>");
			out.flush();
			return "/member/pwAuthForm";

		}

	}

	@RequestMapping(value="/pwChange.do", method=RequestMethod.POST)
	public String pwChange(@ModelAttribute MemberVO memberVO, HttpSession session, HttpServletResponse response, Model model) throws Exception{
		System.out.println("session id: "+session.getAttribute("memberId"));
		int result = memberService.pwChange(memberVO);

		if (result == 1) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('비밀번호가 재설정 되었습니다.');</script>");
			out.flush();

			return "/member/loginForm";

		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('비밀번호가 다릅니다. 다시 입력해주세요.');</script>");
			out.flush();

			return "/member/pwChangeForm";
		}

	}

	@Override
	@RequestMapping(value="/idFindForm.do", method = RequestMethod.GET)
	public String idFindForm(HttpServletRequest request){
		String viewName=(String)request.getAttribute("viewName");
		return viewName;
	}

	@Override
	@RequestMapping(value="/idFind.do", method = RequestMethod.POST)
	public String idFind(@RequestParam Map<String, String> authMap,HttpServletResponse response, Model model) throws Exception {
		MemberVO memberVO = memberService.idFind(authMap);
        if(memberVO != null){
            model.addAttribute("memberId", memberVO.getMemberId());
            return "/member/idFindComplete";
        }else{
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('정보와 일치하는 아이디가 없습니다.');</script>");
            out.flush();
            return "/member/idFindForm";
        }

	}


	@GetMapping("/accessError")
	public String accessDenied(Authentication auth, Model model){
		log.info("access Denied : " + auth);
		model.addAttribute("msg", "잘못된 접근입니다.");
		return "/member/accessError";
	}

}

