package kr.co.chunjae.mypage.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.chunjae.member.vo.MemberVO;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;


public interface MyPageController {
	public String myPageMain(@RequestParam(required = false, value = "message") String message, HttpServletRequest request, HttpServletResponse response, Model model)  throws Exception ;
	public String myOrderDetail(@RequestParam("order_id") String order_id, HttpServletRequest request, HttpServletResponse response, Model model)  throws Exception;
	public String cancelMyOrder(@RequestParam("order_id") String order_id, HttpServletRequest request, HttpServletResponse response, Model model)  throws Exception;
	public String listMyOrderHistory(@RequestParam Map<String, String> dateMap, HttpServletRequest request, HttpServletResponse response, Model model)  throws Exception;
	public String myDetailInfo(HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public String modifyMyInfo(//@RequestParam("attribute") String attribute,
									   //@RequestParam("value") String value,
									   @ModelAttribute MemberVO memberVO, HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public String myCancelOrder(@RequestParam Map<String, String> dateMap,
									  HttpServletRequest request, HttpServletResponse response, Model model)  throws Exception;

}
