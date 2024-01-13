package kr.co.chunjae.main;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.chunjae.common.base.BaseController;
import kr.co.chunjae.goods.service.GoodsService;
import kr.co.chunjae.goods.vo.GoodsVO;

@Controller("mainController")
@EnableAspectJAutoProxy
@RequiredArgsConstructor
public class MainController extends BaseController {

	private final GoodsService goodsService;

	@RequestMapping({"/",""})
	public String firstPage(){
		return "redirect:/main/main.do";
	}

	@RequestMapping(value= "/main/main.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public String main(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{
		HttpSession session;
		String viewName=(String)request.getAttribute("viewName");

		session=request.getSession();
		session.setAttribute("side_menu", "user");
		Map<String,List<GoodsVO>> goodsMap=goodsService.listGoods();
		model.addAttribute("goodsMap", goodsMap);
		return viewName;
	}
}
