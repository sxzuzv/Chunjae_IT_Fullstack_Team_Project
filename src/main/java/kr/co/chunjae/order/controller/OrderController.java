package kr.co.chunjae.order.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.chunjae.order.vo.OrderVO;

public interface OrderController {
	public String orderEachGoods(@ModelAttribute("orderVO") OrderVO _orderVO, HttpServletRequest request)  throws Exception;
	public String orderAllCartGoods(@RequestParam String[] cart_goods_qty, HttpServletRequest request)  throws Exception;
	public String payToOrderGoods(@RequestParam Map<String, String> orderMap, HttpServletRequest request, Model model)  throws Exception;

}
