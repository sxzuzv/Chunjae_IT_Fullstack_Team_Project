package kr.co.chunjae.member.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.chunjae.common.base.BaseController;
import kr.co.chunjae.member.service.MemberService;
import kr.co.chunjae.member.vo.MemberVO;


@Controller("memberController")
@RequestMapping(value="/member")
public class MemberControllerImpl extends BaseController implements MemberController{
	@Autowired
	MemberService memberService;
	@Autowired
	MemberVO memberVO;
	
	@Override
	@RequestMapping(value="/login.do" ,method = RequestMethod.POST)
	public String login(@RequestParam Map<String, String> loginMap,
			                  HttpServletRequest request, Model model) throws Exception {
		String viewname = "";
		memberVO=memberService.login(loginMap);

		if(memberVO!= null && memberVO.getMemberId()!=null){
			HttpSession session=request.getSession();
			session=request.getSession();
			session.setAttribute("isLogOn", true);
			session.setAttribute("memberInfo",memberVO);
			
			String action=(String)session.getAttribute("action");
			//action을 통해서 로그인되었을 경우 넘어갈수 있게함 로그인이 안되었을경우 튕기게함
			if(action!=null && action.equals("/order/orderEachGoods.do")){
				viewname = "forward:"+action;
			}else{
				viewname = "redirect:/main/main.do";
			}
			
			
			
		}else{
			String message="아이디나  비밀번호가 틀립니다. 다시 로그인해주세요";
			model.addAttribute("message", message);
			viewname = "/member/loginForm";
		}
		if (memberVO != null) {
			// 세션에 저장된 MemberVO 객체가 null이 아닌 경우
			// MemberVO 객체에 저장된 정보 출력 또는 로깅
			System.out.println("Member ID: " + memberVO.getMemberId());
			// 필요한 다른 정보들도 출력 또는 로깅
		} else {
			// 세션에 MemberInfo 객체가 없는 경우 또는 null인 경우
			System.out.println("No member info found in the session.");
		}
		return viewname;
	}
	
	@Override
	@RequestMapping(value="/logout.do" ,method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession();
		session.setAttribute("isLogOn", false);
		session.removeAttribute("memberInfo");
		return "redirect:/main/main.do";
	}
	
	@Override
	@RequestMapping(value="/addMember.do" ,method = RequestMethod.POST)
	public ResponseEntity addMember(@Validated @ModelAttribute("memberVO") MemberVO _memberVO,
									HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
		    memberService.addMember(_memberVO);
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
}
