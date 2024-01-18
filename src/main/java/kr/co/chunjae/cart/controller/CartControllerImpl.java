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
		// memberinfo라고 하는 회원 정보를 세션에서 가져옴
		MemberVO memberVO=(MemberVO)session.getAttribute("memberInfo");
		String memberId=memberVO.getMemberId();
		// memberid를 cartVO에 설정
		cartVO.setMemberId(memberId);
		// memberId에 따른 카트리스트를 Map형태로 조회
		Map<String ,List> cartMap=cartService.myCartList(cartVO);
//		model.addAttribute("cartMap", cartMap);
		session.setAttribute("cartMap", cartMap);//장바구니 목록 화면에서 상품 주문 시 사용하기 위해서 장바구니 목록을 세션에 저장한다.
		return viewName;
	}
	// 카트에 상품 추가
	@RequestMapping(value="/addGoodsInCart.do" ,method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public @ResponseBody String addGoodsInCart(@RequestParam("goods_id") int goodsId, @RequestParam("cartGoodsQty") int cartGoodsQty,
											   HttpServletRequest request, HttpServletResponse response)  throws Exception {
		// 세션에서 회원 정보 가져오기
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		String memberId = memberVO.getMemberId();
		// 카트에 추가할 상품 정보 설정
		cartVO.setMemberId(memberId);
		cartVO.setGoodsId(goodsId);
		cartVO.setCartGoodsQty(cartGoodsQty);
		// 이미 카트에 존재하는 상품인지 확인
		boolean isAlreadyExisted = cartService.findCartGoods(cartVO);
		System.out.println("isAlreadyExisted:" + isAlreadyExisted);
		if (isAlreadyExisted) {
			return "already_existed";
		} else {
			// 카트에 상품 추가
			cartService.addGoodsInCart(cartVO);
			return "add_success";
		}
	}

	@RequestMapping(value="/modifyCartQty.do" ,method = RequestMethod.POST)
	public @ResponseBody String  modifyCartQty(@RequestParam("goods_id") int goodsId,
											   @RequestParam("cart_goods_qty") int cartGoodsQty,
											   HttpServletRequest request, HttpServletResponse response)  throws Exception{
		// 세션값 불러옴
		HttpSession session=request.getSession();
		// memberInfo 속성 값 불러와서 memberVO에 저장
		MemberVO memberVO=(MemberVO)session.getAttribute("memberInfo");
		//회원 ID를 불러와서
		String memberId=memberVO.getMemberId();
		// 값을 설정
		cartVO.setGoodsId(goodsId);
		cartVO.setMemberId(memberId);
		cartVO.setCartGoodsQty(cartGoodsQty);
		//결과 반환
		boolean result=cartService.modifyCartQty(cartVO);

		// 성공 시 modify_success 반환
		if(result==true){
			return "modify_success";
		}else{
			return "modify_failed";
		}
	}

	// 카트에서 상품 삭제
	@RequestMapping(value="/removeCartGoods.do" ,method = RequestMethod.POST)
	public String removeCartGoods(@RequestParam("cart_id") int cartId,
								  HttpServletRequest request, Model model)  throws Exception {
		// 모델에 cart_id 추가
		model.addAttribute("cart_id", cartId);
		// 카트에서 상품 삭제
		cartService.removeCartGoods(cartId);
		// 장바구니 목록 조회 페이지로 리다이렉트
		return "redirect:/cart/myCartList.do";
	}
}
