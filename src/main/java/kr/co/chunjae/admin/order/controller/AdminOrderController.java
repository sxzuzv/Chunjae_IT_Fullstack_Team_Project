package kr.co.chunjae.admin.order.controller;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.chunjae.order.vo.OrderVO;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface AdminOrderController {
	public String adminOrderMain(@RequestParam Map<String, String> dateMap,
                                       HttpServletRequest request, HttpServletResponse response, Model model)  throws Exception;
//	public String detailOrder(@RequestParam Map<String, String> dateMap, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception;
//	public String detailOrder(@RequestParam("searchType") String searchType, @RequestParam("searchWord") String searchWord, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception;
	public String detailOrder(@RequestBody String requestData, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception;
	public ResponseEntity modifyDeliveryState(@RequestParam Map<String, String> deliveryMap,
                                              HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public String orderDetail(@RequestParam("order_id") int order_id,
                                    HttpServletRequest request, HttpServletResponse response, Model model)  throws Exception;
	
	
}
