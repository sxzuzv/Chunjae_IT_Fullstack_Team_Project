package kr.co.chunjae.admin.order.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lombok.RequiredArgsConstructor;
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

import kr.co.chunjae.admin.order.service.AdminOrderService;
import kr.co.chunjae.common.base.BaseController;
import kr.co.chunjae.order.vo.OrderVO;

@Controller("adminOrderController")
@RequiredArgsConstructor
@RequestMapping(value="/admin/order")
public class AdminOrderControllerImpl extends BaseController  implements AdminOrderController{
	private final AdminOrderService adminOrderService;
	
	@Override
	@RequestMapping(value="/adminOrderMain.do" ,method={RequestMethod.GET, RequestMethod.POST})
	public String adminOrderMain(@RequestParam Map<String, String> dateMap,
			                          HttpServletRequest request, HttpServletResponse response, Model model)  throws Exception {
		String viewName=(String)request.getAttribute("viewName");

		String fixedSearchPeriod = dateMap.get("fixedSearchPeriod");
		String section = dateMap.get("section");
		String pageNum = dateMap.get("pageNum");
		String beginDate=null,endDate=null;
		
		String [] tempDate=calcSearchPeriod(fixedSearchPeriod).split(",");
		beginDate=tempDate[0];
		endDate=tempDate[1];
		dateMap.put("beginDate", beginDate);
		dateMap.put("endDate", endDate);
		
		
		HashMap<String,Object> condMap=new HashMap<String,Object>();
		if(section== null) {
			section = "1";
		}
		condMap.put("section",section);
		if(pageNum== null) {
			pageNum = "1";
		}
		condMap.put("pageNum",pageNum);
		condMap.put("beginDate",beginDate);
		condMap.put("endDate", endDate);
		List<OrderVO> newOrderList=adminOrderService.listNewOrder(condMap);
		model.addAttribute("newOrderList",newOrderList);
		
		String beginDate1[]=beginDate.split("-");
		String endDate2[]=endDate.split("-");
		model.addAttribute("beginYear",beginDate1[0]);
		model.addAttribute("beginMonth",beginDate1[1]);
		model.addAttribute("beginDay",beginDate1[2]);
		model.addAttribute("endYear",endDate2[0]);
		model.addAttribute("endMonth",endDate2[1]);
		model.addAttribute("endDay",endDate2[2]);

		model.addAttribute("section", section);
		model.addAttribute("pageNum", pageNum);
		return viewName;
		
	}
	
	@Override
	@RequestMapping(value="/modifyDeliveryState.do" ,method={RequestMethod.POST})
	public ResponseEntity modifyDeliveryState(@RequestParam Map<String, String> deliveryMap, 
			                        HttpServletRequest request, HttpServletResponse response)  throws Exception {
		adminOrderService.modifyDeliveryState(deliveryMap);
		
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		message  = "mod_success";
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
		
	}
	
	@Override
	@RequestMapping(value="/orderDetail.do" ,method={RequestMethod.GET,RequestMethod.POST})
	public String orderDetail(@RequestParam("order_id") int order_id,
			                      HttpServletRequest request, HttpServletResponse response, Model model)  throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		Map orderMap =adminOrderService.orderDetail(order_id);
		model.addAttribute("orderMap", orderMap);
		return viewName;
	}
	
}
