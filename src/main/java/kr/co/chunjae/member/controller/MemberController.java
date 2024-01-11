package kr.co.chunjae.member.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.chunjae.member.vo.MemberVO;

public interface MemberController {
	public String login(@RequestParam Map<String, String> loginMap, HttpServletRequest request, Model model) throws Exception;
	public String logout(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity  addMember(@ModelAttribute("member") MemberVO member,
                                     HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity   overlapped(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception;

}
