package kr.co.chunjae.cart.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.chunjae.member.vo.MemberVO;
import kr.co.chunjae.order.vo.OrderVO;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.chunjae.cart.service.CartService;
import kr.co.chunjae.cart.vo.CartVO;
import kr.co.chunjae.common.base.BaseController;

@Controller("cartController")
@RequestMapping(value="/cart")
@RequiredArgsConstructor
public class CartControllerImpl extends BaseController implements CartController{

	private final CartService cartService;

	private final CartVO cartVO;

	@RequestMapping(value="/myCartList.do" ,method = RequestMethod.GET)
	public String myCartMain(HttpServletRequest request, Model model)  throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		HttpSession session=request.getSession();
		MemberVO memberVO=(MemberVO)session.getAttribute("memberInfo");
		String memberId=memberVO.getMemberId();
		cartVO.setMemberId(memberId);
		Map<String ,List> cartMap=cartService.myCartList(cartVO);
//		model.addAttribute("cartMap", cartMap);
		session.setAttribute("cartMap", cartMap);//장바구니 목록 화면에서 상품 주문 시 사용하기 위해서 장바구니 목록을 세션에 저장한다.
		return viewName;
	}
	@RequestMapping(value="/addGoodsInCart.do" ,method = RequestMethod.POST,produces = "application/text; charset=utf8")
	public  @ResponseBody String addGoodsInCart(@RequestParam("goods_id") int goodsId, @RequestParam("cartGoodsQty") int cartGoodsQty,
												HttpServletRequest request, HttpServletResponse response)  throws Exception{
		HttpSession session=request.getSession();
		MemberVO memberVO=(MemberVO)session.getAttribute("memberInfo");
		String memberId=memberVO.getMemberId();

		cartVO.setMemberId(memberId);
		//카트 등록전에 이미 등록된 제품인지 판별한다.
		cartVO.setGoodsId(goodsId);
		cartVO.setMemberId(memberId);
		cartVO.setCartGoodsQty(cartGoodsQty);

		boolean isAreadyExisted=cartService.findCartGoods(cartVO);
		System.out.println("isAreadyExisted:"+isAreadyExisted);
		if(isAreadyExisted==true){
			return "already_existed";
		}else{
			cartService.addGoodsInCart(cartVO);
			return "add_success";
		}
	}

	@RequestMapping(value="/modifyCartQty.do" ,method = RequestMethod.POST)
	public @ResponseBody String  modifyCartQty(@RequestParam("goods_id") int goodsId,
											   @RequestParam("cart_goods_qty") int cartGoodsQty,
											   HttpServletRequest request, HttpServletResponse response)  throws Exception{
		HttpSession session=request.getSession();
		MemberVO memberVO=(MemberVO)session.getAttribute("memberInfo");
		String memberId=memberVO.getMemberId();
		cartVO.setGoodsId(goodsId);
		cartVO.setMemberId(memberId);
		cartVO.setCartGoodsQty(cartGoodsQty);
		boolean result=cartService.modifyCartQty(cartVO);

		if(result==true){
			return "modify_success";
		}else{
			return "modify_failed";
		}

	}

	@RequestMapping(value="/removeCartGoods.do" ,method = RequestMethod.POST)
	public String removeCartGoods(@RequestParam("cart_id") int cartId,
										HttpServletRequest request, Model model)  throws Exception{

		model.addAttribute("cart_id", cartId);
		cartService.removeCartGoods(cartId);
		return "redirect:/cart/myCartList.do";
	}
}
