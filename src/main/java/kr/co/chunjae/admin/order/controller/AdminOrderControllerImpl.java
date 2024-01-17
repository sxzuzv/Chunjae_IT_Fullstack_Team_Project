package kr.co.chunjae.admin.order.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import net.sf.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
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
		String section = null;
		String pageNum = null;
		String beginDate = null;
		String endDate = null;

		String fixedSearchPeriod = dateMap.get("fixedSearchPeriod");
//		String section = dateMap.get("section");
//		String pageNum = dateMap.get("pageNum");
		section = dateMap.get("section");
		pageNum = dateMap.get("pageNum");
//		String beginDate=null,endDate=null;
		
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

//	@Override
//	@RequestMapping(value = "/detailOrder.do", method = RequestMethod.POST)
//	public String detailOrder(@RequestParam Map<String, String> dateMap, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
//		String viewName=(String)request.getAttribute("viewName");
//
////		String fixedSearchPeriod = dateMap.get("fixedSearchPeriod");
////		String section = dateMap.get("section");
////		String pageNum = dateMap.get("pageNum");
////		String beginDate=null,endDate=null;
//
////		String beginDate = dateMap.get("beginDate");
////		String endDate = dateMap.get("endDate");
//		String searchType = dateMap.get("search_type");
//		String searchWord = dateMap.get("search_word");
//
//		System.out.println("===========================================");
//		System.out.println(searchType);
//		System.out.println("===========================================");
//
//		System.out.println("===========================================");
//		System.out.println(searchWord);
//		System.out.println("===========================================");
//
////		String [] tempDate=calcSearchPeriod(fixedSearchPeriod).split(",");
////		beginDate=tempDate[0];
////		endDate=tempDate[1];
//		dateMap.put("beginDate", beginDate);
//		dateMap.put("endDate", endDate);
//
//		System.out.println("===========================================");
//		System.out.println(beginDate);
//		System.out.println("===========================================");
//		System.out.println("===========================================");
//		System.out.println(endDate);
//		System.out.println("===========================================");
//
//
//		HashMap<String,Object> condMap=new HashMap<String,Object>();
//		if(section== null) {
//			section = "1";
//		}
//		condMap.put("section",section);
//		if(pageNum== null) {
//			pageNum = "1";
//		}
//
//		condMap.put("searchType", searchType);
//		condMap.put("searchWord", searchWord);
//
//		condMap.put("pageNum",pageNum);
//		condMap.put("beginDate",beginDate);
//		condMap.put("endDate", endDate);
//		List<OrderVO> newOrderList=adminOrderService.listNewOrder(condMap);
//		model.addAttribute("newOrderList",newOrderList);
//
//		String beginDate1[]=beginDate.split("-");
//		String endDate2[]=endDate.split("-");
//		model.addAttribute("beginYear",beginDate1[0]);
//		model.addAttribute("beginMonth",beginDate1[1]);
//		model.addAttribute("beginDay",beginDate1[2]);
//		model.addAttribute("endYear",endDate2[0]);
//		model.addAttribute("endMonth",endDate2[1]);
//		model.addAttribute("endDay",endDate2[2]);
//
////		model.addAttribute("s_search_type", searchType);
////		model.addAttribute("s_search_word", searchWord);
//
//		model.addAttribute("section", section);
//		model.addAttribute("pageNum", pageNum);
////
//		return viewName;
//	}

//	@Override
//	@RequestMapping(value = "/detailOrder.do", method = RequestMethod.POST)
//	public String detailOrder(@RequestParam Map<String, String> dateMap, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
//		String viewName = (String)request.getAttribute("viewName");
//
//		String searchType = dateMap.get("s_search_type");
//		String searchWord = dateMap.get("s_search_word");
//		String dCurYear = dateMap.get("d_curYear");
//		String dCurMonth = dateMap.get("d_curMonth");
//		String dCurDay = dateMap.get("d_curDay");
//		String dEndYear = dateMap.get("d_endYear");
//		String dEndMonth = dateMap.get("d_endMonth");
//		String dEndDay = dateMap.get("d_endDay");
//
//		String beginDate = dCurYear + "-" + dCurMonth + "-" + dCurDay;
//		String endDate = dEndYear + "-" + dEndMonth + "-" + dEndDay;
//
//		HashMap<String, Object> condMap = new HashMap<String, Object>();
//
//		condMap.put("beginDate", beginDate);
//		condMap.put("endDate", endDate);
//		condMap.put("section", 1);
//		condMap.put("pageNum", 1);
//		condMap.put("searchType", searchType);
//		condMap.put("searchWord", searchWord);
//
//		List<OrderVO> newOrderList = adminOrderService.detailOrder(condMap);
//		model.addAttribute("newOrderList", newOrderList);
//		ObjectMapper mapper = new ObjectMapper();
//		HashMap<String, Object> hashMap = new HashMap<String, Object>();

//		//Null check
//		//로그인 화면에서 로그인성공 시 getBoardList.do 호출 할 때 searchKeyword, searchCondition 값의 null 방지
//		if(vo.getSearchCondition() == null) {
//			vo.setSearchCondition("TITLE");
//		}
//		if(vo.getSearchKeyword() == null) {
//			vo.setSearchKeyword("");
//		}
//
//		List<BoardVO> boardList = boardService.getBoardList(vo);
//		hashMap.put("boardList", boardList);
//
//		String json = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(hashMap);
//		System.out.println("json String =============================================" + json);
//
//		return json;
//
//
//		return viewName;
//	}

//	@Override
//	@RequestMapping(value = "/detailOrder.do", method = RequestMethod.POST)
//	public String detailOrder(@RequestParam("searchType") String searchType, @RequestParam("searchWord") String searchWord, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
//		String viewName = (String)request.getAttribute("viewName");
//
//		System.out.println("==============================");
//		System.out.println(searchType);
//		System.out.println(searchWord);
//		System.out.println("==============================");
//
////		String [] tempDate=calcSearchPeriod(fixedSearchPeriod).split(",");
////		beginDate=tempDate[0];
////		endDate=tempDate[1];
////		dateMap.put("beginDate", beginDate);
////		dateMap.put("endDate", endDate);
//
//		return viewName;
//	}

	@Override
	@RequestMapping(value = "/detailOrder.do", method = RequestMethod.POST, produces = "application/json")
	public String detailOrder(@RequestBody String requestData, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		String section = null;
		String pageNum = null;

		String jsonString = requestData;

		ObjectMapper objectMapper = new ObjectMapper();

		try {
			JsonNode jsonNode = objectMapper.readTree(jsonString);

			String searchType = jsonNode.get("searchType").asText();
			String searchWord = jsonNode.get("searchWord").asText();


			HashMap<String,Object> condMap=new HashMap<String,Object>();
			if(section== null) {
				section = "1";
			}
			condMap.put("section",section);
			if(pageNum== null) {
				pageNum = "1";
			}

			condMap.put("searchType", searchType);
			condMap.put("searchWord", searchWord);
			condMap.put("section", section);
			condMap.put("pageNum", pageNum);
			List<OrderVO> newOrderList=adminOrderService.detailOrder(condMap);

			model.addAttribute("newOrderList", newOrderList);
//			model.addAttribute("searchType", searchType);
//			model.addAttribute("searchWord", searchWord);
			model.addAttribute("pageNum", pageNum);
			model.addAttribute("section", section);

		} catch (Exception e) {
			e.printStackTrace();
		}

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
	public String orderDetail(@RequestParam("orderId") int order_id,
			                      HttpServletRequest request, HttpServletResponse response, Model model)  throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		Map orderMap =adminOrderService.orderDetail(order_id);
		model.addAttribute("orderMap", orderMap);
		return viewName;
	}
	
}
