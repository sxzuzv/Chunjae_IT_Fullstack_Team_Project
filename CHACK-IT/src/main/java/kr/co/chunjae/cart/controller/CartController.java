package kr.co.chunjae.cart.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

public interface CartController {
	public String myCartMain(HttpServletRequest request, Model model)  throws Exception;
	public @ResponseBody String addGoodsInCart(@RequestParam("goods_id") int goodsId, @RequestParam("cart_goods_qty") int cartGoodsQty, HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public  @ResponseBody String modifyCartQty(@RequestParam("goods_id") int goodsId, @RequestParam("cart_goods_qty") int cartGoodsQty,
											   HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public String removeCartGoods(@RequestParam("cart_id") int cartId, HttpServletRequest request, Model model)  throws Exception;



}
