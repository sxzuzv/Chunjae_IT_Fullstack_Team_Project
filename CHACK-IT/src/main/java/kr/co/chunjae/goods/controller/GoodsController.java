package kr.co.chunjae.goods.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.chunjae.goods.vo.CommentVO;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

public interface GoodsController  {
	public String goodsDetail(@RequestParam("goods_id") String goodsId, HttpServletRequest request, Model model) throws Exception;
	public @ResponseBody String keywordSearch(@RequestParam("keyword") String keyword, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String searchGoods(@RequestParam("searchWord") String searchWord, HttpServletRequest request, Model model) throws Exception;
}
