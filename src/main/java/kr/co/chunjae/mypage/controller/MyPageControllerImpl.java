package kr.co.chunjae.mypage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import lombok.extern.log4j.Log4j;
import lombok.extern.log4j.Log4j2;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.chunjae.common.base.BaseController;
import kr.co.chunjae.member.vo.MemberVO;
import kr.co.chunjae.mypage.service.MyPageService;
import kr.co.chunjae.order.vo.OrderVO;

@Controller("myPageController")
@RequestMapping(value="/mypage")
public class MyPageControllerImpl extends BaseController  implements MyPageController{
	@Autowired
	MyPageService myPageService;
	@Autowired
	MemberVO memberVO;
	
	@Override
	@RequestMapping(value="/myPageMain.do" ,method = RequestMethod.GET)
	public String myPageMain(@RequestParam(required = false,value="message")  String message,
							 HttpServletRequest request, HttpServletResponse response, Model model)  throws Exception {
		HttpSession session=request.getSession();
		session=request.getSession();
		session.setAttribute("side_menu", "my_page"); //마이페이지 사이드 메뉴로 설정한다.
		
		String viewName=(String)request.getAttribute("viewName");
		memberVO=(MemberVO)session.getAttribute("memberInfo");
		String member_id=memberVO.getMemberId();
		
		List<OrderVO> myOrderList=myPageService.listMyOrderGoods(member_id);
		
		model.addAttribute("message", message);
		model.addAttribute("myOrderList", myOrderList);

		return viewName;
	}
	
	@Override
	@RequestMapping(value="/myOrderDetail.do" ,method = RequestMethod.GET)
	public String myOrderDetail(@RequestParam("order_id")  String order_id,HttpServletRequest request, HttpServletResponse response, Model model)  throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		HttpSession session=request.getSession();
		MemberVO orderer=(MemberVO)session.getAttribute("memberInfo");
		
		List<OrderVO> myOrderList=myPageService.findMyOrderInfo(order_id);
		model.addAttribute("orderer", orderer);
		model.addAttribute("myOrderList",myOrderList);
		return viewName;
	}
	
	@Override
	@RequestMapping(value="/listMyOrderHistory.do" ,method = RequestMethod.GET)
	public String listMyOrderHistory(@RequestParam Map<String, String> dateMap,
			                               HttpServletRequest request, HttpServletResponse response, Model model)  throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		HttpSession session=request.getSession();
		memberVO=(MemberVO)session.getAttribute("memberInfo");
		String  member_id=memberVO.getMemberId();
		
		String fixedSearchPeriod = dateMap.get("fixedSearchPeriod");
		String beginDate=null,endDate=null;
		
		String [] tempDate=calcSearchPeriod(fixedSearchPeriod).split(",");
		beginDate=tempDate[0];
		endDate=tempDate[1];
		dateMap.put("beginDate", beginDate);
		dateMap.put("endDate", endDate);
		dateMap.put("memberId", member_id);
		List<OrderVO> myOrderHistList=myPageService.listMyOrderHistory(dateMap);
		
		String beginDate1[]=beginDate.split("-"); //검색일자를 년,월,일로 분리해서 화면에 전달합니다.
		String endDate1[]=endDate.split("-");
		model.addAttribute("beginYear",beginDate1[0]);
		model.addAttribute("beginMonth",beginDate1[1]);
		model.addAttribute("beginDay",beginDate1[2]);
		model.addAttribute("endYear",endDate1[0]);
		model.addAttribute("endMonth",endDate1[1]);
		model.addAttribute("endDay",endDate1[2]);
		model.addAttribute("myOrderHistList", myOrderHistList);
		return viewName;
	}	
	
	@Override
	@RequestMapping(value="/cancelMyOrder.do" ,method = RequestMethod.POST)
	public String cancelMyOrder(@RequestParam("order_id")  String order_id,
			                         HttpServletRequest request, HttpServletResponse response, Model model)  throws Exception {
		String viewName="";
		myPageService.cancelOrder(order_id);
		model.addAttribute("message", "cancel_order");
		viewName = "redirect:/mypage/myPageMain.do";
		return viewName;
	}
	
	@Override
	@RequestMapping(value="/myDetailInfo.do" ,method = RequestMethod.GET)
	public String myDetailInfo(HttpServletRequest request, HttpServletResponse response)  throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		return viewName;
	}	
	
	@Override
	@RequestMapping(value="/modifyMyInfo.do" ,method = RequestMethod.POST)
	public ResponseEntity modifyMyInfo(@RequestParam("attribute")  String attribute,
			                 @RequestParam("value")  String value,
			               HttpServletRequest request, HttpServletResponse response)  throws Exception {
		Map<String,String> memberMap=new HashMap<String,String>();
		String val[]=null;
		HttpSession session=request.getSession();
		memberVO=(MemberVO)session.getAttribute("memberInfo");
		String memberId=memberVO.getMemberId();
		if(attribute.equals("memberBirth")){
			val=value.split(",");
			memberMap.put("memberBirthY",val[0]);
			memberMap.put("memberBirthM",val[1]);
			memberMap.put("memberBirthD",val[2]);
			memberMap.put("memberBirthGn",val[3]);
		}else if(attribute.equals("memberHp")){
			val=value.split(",");
			memberMap.put("memberHp1",val[0]);
			memberMap.put("memberHp2",val[1]);
			memberMap.put("memberHp3",val[2]);
			memberMap.put("smsstsYn", val[3]);
		}else if(attribute.equals("memberEmail")){
			val=value.split(",");
			memberMap.put("memberEmail1",val[0]);
			memberMap.put("memberEmail2",val[1]);
			memberMap.put("emailstsYn", val[2]);
		}else if(attribute.equals("memberAddress")){
			val=value.split(",");
			memberMap.put("zipcode",val[0]);
			memberMap.put("roadAddress",val[1]);
			memberMap.put("jibunAddress", val[2]);
			memberMap.put("namujiAddress", val[3]);
		}else {
			memberMap.put(attribute,value);	
		}
		
		memberMap.put("memberId", memberId);
		
		//수정된 회원 정보를 다시 세션에 저장한다.
		memberVO=(MemberVO)myPageService.modifyMyInfo(memberMap);
		session.removeAttribute("memberInfo");
		session.setAttribute("memberInfo", memberVO);


		
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		message  = "mod_success";
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}

	@Override
	@RequestMapping(value="/cancelOrderHistory.do" ,method = RequestMethod.GET)
	public String myCancelOrder(@RequestParam Map<String, String> dateMap,
										   HttpServletRequest request, HttpServletResponse response, Model model)  throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		HttpSession session=request.getSession();
		memberVO=(MemberVO)session.getAttribute("memberInfo");
		String member_id=memberVO.getMemberId();


		String fixedSearchPeriod = dateMap.get("fixedSearchPeriod");
		String beginDate=null,endDate=null;

		String [] tempDate=calcSearchPeriod(fixedSearchPeriod).split(",");
		beginDate=tempDate[0];
		endDate=tempDate[1];
		dateMap.put("beginDate", beginDate);
		dateMap.put("endDate", endDate);
		dateMap.put("memberId", member_id);
		List<OrderVO> myCancelList=myPageService.cancelOrderHistory(dateMap);

		String beginDate1[]=beginDate.split("-"); //검색일자를 년,월,일로 분리해서 화면에 전달합니다.
		String endDate1[]=endDate.split("-");
		model.addAttribute("beginYear",beginDate1[0]);
		model.addAttribute("beginMonth",beginDate1[1]);
		model.addAttribute("beginDay",beginDate1[2]);
		model.addAttribute("endYear",endDate1[0]);
		model.addAttribute("endMonth",endDate1[1]);
		model.addAttribute("endDay",endDate1[2]);
		model.addAttribute("myCancelList", myCancelList);
		return viewName;
	}



}
