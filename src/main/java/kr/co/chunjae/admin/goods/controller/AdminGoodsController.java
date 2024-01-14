package kr.co.chunjae.admin.goods.controller;

import kr.co.chunjae.goods.vo.GoodsVO;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.Map;

public interface AdminGoodsController {
	public String adminGoodsMain(@RequestParam Map<String, String> dateMap, HttpServletRequest request, HttpServletResponse response, Model model)  throws Exception;
	public String addNewGoods(@Valid @ModelAttribute GoodsVO goodsVO, BindingResult bindingResult,
							  MultipartHttpServletRequest multipartRequest, HttpServletResponse response)  throws Exception;
	public ResponseEntity modifyGoodsInfo(@RequestParam("goods_id") String goods_id,
                                          @RequestParam("mod_type") String mod_type,
                                          @RequestParam("value") String value,
                                          HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public void  removeGoodsImage(@RequestParam("goods_id") int goods_id,
                                  @RequestParam("image_id") int image_id,
                                  @RequestParam("imageFileName") String imageFileName,
                                  HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public void  addNewGoodsImage(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)  throws Exception;
	public void modifyGoodsImageInfo(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)  throws Exception;
}
