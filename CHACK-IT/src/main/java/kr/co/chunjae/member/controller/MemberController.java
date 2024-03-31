package kr.co.chunjae.member.controller;

import kr.co.chunjae.member.vo.MemberVO;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.Map;

public interface MemberController {

	public String loginForm(HttpServletRequest request, String error, String logout, Model model) throws Exception;

	public String  addMember(@Valid @ModelAttribute("memberVO") MemberVO member, BindingResult result,
                                     HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity   overlapped(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String passwordFind(HttpServletRequest request) throws Exception;
	public String pwAuth(@RequestParam Map<String, String> loginMap, HttpSession session, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception;
	public String idFindForm(HttpServletRequest request) throws Exception;

	public String idFind(@RequestParam Map<String, String> authMap,HttpServletResponse response, Model model) throws Exception;

	public String accessDenied(Authentication auth, Model model);

	public String memberForm(@ModelAttribute MemberVO memberVO, HttpServletRequest request, HttpServletResponse response)  throws Exception;
}
