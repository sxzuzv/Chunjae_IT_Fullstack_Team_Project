package kr.co.chunjae.goods.controller;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.chunjae.common.base.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.chunjae.goods.service.GoodsService;
import kr.co.chunjae.goods.vo.GoodsVO;

import net.sf.json.JSONObject;

@Controller("goodsController")
@RequestMapping(value="/goods")
public class GoodsControllerImpl extends BaseController implements GoodsController {
	@Autowired
	GoodsService goodsService;
	
	@RequestMapping(value="/goodsDetail.do" ,method = RequestMethod.GET)
	public ModelAndView goodsDetail(@RequestParam("goods_id") String goodsId,
			                       HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		HttpSession session=request.getSession();
		Map goodsMap=goodsService.goodsDetail(goodsId);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("goodsMap", goodsMap);
		GoodsVO goodsVO=(GoodsVO)goodsMap.get("goodsVO");
		addGoodsInQuick(goodsId,goodsVO,session);
		return mav;
	}
	
	@RequestMapping(value="/keywordSearch.do",method = RequestMethod.GET,produces = "application/text; charset=utf8")
	public @ResponseBody String  keywordSearch(@RequestParam("keyword") String keyword,
			                                  HttpServletRequest request, HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		//System.out.println(keyword);
		if(keyword == null || keyword.equals(""))
		   return null ;
	
		keyword = keyword.toUpperCase();
	    List<String> keywordList =goodsService.keywordSearch(keyword);
	    
	 // 최종 완성될 JSONObject 선언(전체)
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("keyword", keywordList);
		 		
	    String jsonInfo = jsonObject.toString();
	   // System.out.println(jsonInfo);
	    return jsonInfo ;
	}
	
	@RequestMapping(value="/searchGoods.do" ,method = RequestMethod.GET)
	public ModelAndView searchGoods(@RequestParam("searchWord") String searchWord,
			                       HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName=(String)request.getAttribute("viewName");
		List<GoodsVO> goodsList=goodsService.searchGoods(searchWord);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("goodsList", goodsList);
		return mav;
		
	}
	
	private void addGoodsInQuick(String goodsId,GoodsVO goodsVO,HttpSession session){
		boolean already_existed=false;
		List<GoodsVO> quickGoodsList; //최근 본 상품 저장 LinkedList, 효율을 위해 순서가 있으나 수정 삭제시 리소스 소모가 덜한 linked list로 변경
		quickGoodsList=(LinkedList<GoodsVO>)session.getAttribute("quickGoodsList");
		
		if(quickGoodsList!=null){
			for(int i=0; i<quickGoodsList.size();i++){ //중복체크
				GoodsVO _goodsBean=(GoodsVO)quickGoodsList.get(i);
				if(goodsId.equals(_goodsBean.getGoodsId())){
					already_existed=true;
					break;
				}
			}
			if(already_existed==false) { // 중복아닌경우 add 결정로직 시작
				if (quickGoodsList.size() < 4) { //미리본 상품 리스트에 상품개수가 세개 이하인 경우
					quickGoodsList.add(0,goodsVO);

				} else { //4개인 경우
					quickGoodsList.remove(quickGoodsList.size()-1); //마지막 리스트 요소 삭제
					quickGoodsList.add(0,goodsVO); //첫번째 인덱스에 추가
				}
			}
		}else{
			quickGoodsList =new LinkedList<GoodsVO>();
			quickGoodsList.add(goodsVO);
			
		}
		session.setAttribute("quickGoodsList",quickGoodsList);
		session.setAttribute("quickGoodsListNum", quickGoodsList.size());
	}
}
