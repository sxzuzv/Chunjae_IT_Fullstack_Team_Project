package kr.co.chunjae.admin.member.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.chunjae.member.vo.MemberVO;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

public interface AdminMemberController {
	public String adminGoodsMain(@RequestParam Map<String, String> dateMap, HttpServletRequest request, HttpServletResponse response, Model model)  throws Exception;
	public String memberDetail(HttpServletRequest request, HttpServletResponse response, Model model)  throws Exception;
//	public void modifyMemberInfo(HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public String modifyMemberInfo(@ModelAttribute("memberVO") MemberVO memberVO, RedirectAttributes ra, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String deleteMember(HttpServletRequest request)  throws Exception;
}
