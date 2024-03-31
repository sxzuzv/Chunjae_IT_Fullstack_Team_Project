package kr.co.chunjae.admin.member.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.chunjae.common.base.BaseController;
import kr.co.chunjae.member.vo.MemberVO;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.chunjae.admin.member.service.AdminMemberService;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller("adminMemberController")
@RequiredArgsConstructor
@RequestMapping(value="/admin/member")
public class AdminMemberControllerImpl extends BaseController implements AdminMemberController{
	private  final AdminMemberService adminMemberService;
	
	@RequestMapping(value="/adminMemberMain.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public String adminGoodsMain(@RequestParam Map<String, String> dateMap,
			                           HttpServletRequest request, HttpServletResponse response, Model model)  throws Exception{
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
		ArrayList<MemberVO> member_list=adminMemberService.listMember(condMap);
		model.addAttribute("member_list", member_list);
		
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
	@RequestMapping(value="/memberDetail.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public String memberDetail(HttpServletRequest request, HttpServletResponse response, Model model)  throws Exception{
		String viewName=(String)request.getAttribute("viewName");
		String member_id=request.getParameter("member_id");
		MemberVO member_info=adminMemberService.memberDetail(member_id);
		model.addAttribute("member_info",member_info);
		return viewName;
	}
	
//	@RequestMapping(value="/modifyMemberInfo.do" ,method={RequestMethod.POST,RequestMethod.GET})
//	public void modifyMemberInfo(HttpServletRequest request, HttpServletResponse response)  throws Exception{
//		HashMap<String,String> memberMap=new HashMap<String,String>();
//		String val[]=null;
//		PrintWriter pw=response.getWriter();
//		String member_id=request.getParameter("member_id");
//		String mod_type=request.getParameter("mod_type");
//		String value =request.getParameter("value");
//		if(mod_type.equals("member_birth")){
//			val=value.split(",");
//			memberMap.put("member_birth_y",val[0]);
//			memberMap.put("member_birth_m",val[1]);
//			memberMap.put("member_birth_d",val[2]);
//			memberMap.put("member_birth_gn",val[3]);
//		}  else if(mod_type.equals("tel")){
//			val=value.split(",");
//			memberMap.put("tel1",val[0]);
//			memberMap.put("tel2",val[1]);
//			memberMap.put("tel3",val[2]);
//
//		}else if(mod_type.equals("hp")){
//			val=value.split(",");
//			memberMap.put("hp1",val[0]);
//			memberMap.put("hp2",val[1]);
//			memberMap.put("hp3",val[2]);
//			memberMap.put("smssts_yn", val[3]);
//		}else if(mod_type.equals("email")){
//			val=value.split(",");
//			memberMap.put("email1",val[0]);
//			memberMap.put("email2",val[1]);
//			memberMap.put("emailsts_yn", val[2]);
//		}else if(mod_type.equals("address")){
//			val=value.split(",");
//			memberMap.put("zipcode",val[0]);
//			memberMap.put("roadAddress",val[1]);
//			memberMap.put("jibunAddress", val[2]);
//			memberMap.put("namujiAddress", val[3]);
//		} else {
//			memberMap.put(mod_type, value);
//		}
//
//		memberMap.put("member_id", member_id);
//
//		adminMemberService.modifyMemberInfo(memberMap);
//		pw.print("mod_success");
//		pw.close();
//
//	}

	@RequestMapping(value = "/modifyMemberInfo.do", method={RequestMethod.POST,RequestMethod.GET})
	public String modifyMemberInfo(@ModelAttribute("memberVO") MemberVO memberVO, RedirectAttributes ra, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String memberId = memberVO.getMemberId();
		int result = adminMemberService.modifyMemberInfo(memberVO);

		if (result > 0) {
			ra.addFlashAttribute("msg", "modifySuccess");
		} else {
			ra.addFlashAttribute("msg", "modifyFail");
		}

		return "redirect:/admin/member/memberDetail.do?member_id=" + memberId;
	}
	
	@RequestMapping(value="/deleteMember.do" ,method={RequestMethod.POST})
	public String deleteMember(HttpServletRequest request)  throws Exception {
		String viewName = "redirect:/admin/member/adminMemberMain.do";
		HashMap<String,String> memberMap=new HashMap<String,String>();
		String member_id=request.getParameter("member_id");
		String del_yn=request.getParameter("del_yn");
		memberMap.put("del_yn", del_yn);
		memberMap.put("member_id", member_id);
		
//		adminMemberService.modifyMemberInfo(memberMap);
		return viewName;
		
	}
		
}
