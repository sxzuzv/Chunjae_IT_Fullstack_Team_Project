package kr.co.chunjae.member.controller;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.chunjae.member.vo.MemberVO;

public interface MemberController {

	public String loginForm(HttpServletRequest request) throws Exception;
	public String login(@RequestParam Map<String, String> loginMap,
						@RequestParam("rememberId") String rememberId,
						HttpServletRequest request,HttpServletResponse response, Model model) throws Exception;
	public String logout(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity  addMember(@ModelAttribute("member") MemberVO member,
                                     HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity   overlapped(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String passwordFind(HttpServletRequest request) throws Exception;
	public String pwAuth(@RequestParam Map<String, String> loginMap, HttpSession session, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception;
	public String idFindForm(HttpServletRequest request) throws Exception;

	public String idFind(@RequestParam Map<String, String> authMap,HttpServletResponse response, Model model) throws Exception;
}
