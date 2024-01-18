package kr.co.chunjae.admin.notice.controller;

import com.fasterxml.jackson.annotation.JsonCreator;
import kr.co.chunjae.admin.notice.service.NoticeService;
import kr.co.chunjae.admin.notice.vo.NoticeVO;
import kr.co.chunjae.member.vo.MemberVO;
import kr.co.chunjae.page.pageVO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin/notice")
public class NoticeControllerImpl {
    private final NoticeService noticeService;

    // 게시글 작성 화면을 출력한다.
    @GetMapping("/noticeWrite.do")
    public String writeForm(HttpServletRequest request) {
        String viewName=(String)request.getAttribute("viewName");

        return viewName;
    }

    // 사용자가 입력한 데이터를 저장한다.
    @PostMapping("/noticeWrite.do")
    public String noticeWrite(@ModelAttribute NoticeVO noticeVO, HttpServletRequest request) {
        noticeService.noticeWrite(noticeVO);

        return "redirect:/admin/notice/noticeList.do";
    }

    // 게시글 번호를 클릭할 시, 상세 내용을 출력한다.
    // 조회수 계산 기능을 적용하며, '목록보기' 시 직전에 보고 있던 페이지 번호로 돌아간다.
    @GetMapping("/noticeDetail.do")
    public String noticeDetail(@RequestParam("brd_id") Long brdId, @RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request, Model model) {
        String viewName=(String)request.getAttribute("viewName");

        // 조회수(view_cnt) 기능을 적용한다.
        noticeService.updateViewCnt(brdId);

        // 선택된 게시글 번호에 대한 상세 내용을 추출하여 저장한다.
        NoticeVO noticeVO = noticeService.noticeDetail(brdId);

        model.addAttribute("noticeDetail", noticeVO);
        // '목록보기' 시 활용할 직전 페이지 번호를 모델에 저장한다.
        model.addAttribute("page", page);

        return viewName;
    }

    // 게시글 수정 페이지 진입 시, 기존 게시글 내용을 출력한다.
    @GetMapping("/noticeUpdate.do")
    public String noticeUpdateForm(@RequestParam("brd_id") Long brdId, HttpServletRequest request, Model model) {
        String viewName=(String)request.getAttribute("viewName");

        NoticeVO noticeVO = noticeService.noticeDetail(brdId);

        model.addAttribute("noticeDetail", noticeVO);

        return viewName;
    }

    // 사용자가 수정한 내용을 저장하고, 전체 게시글 목록으로 돌아간다.
    @PostMapping("/noticeUpdate.do")
    public String noticeUpdate(@ModelAttribute NoticeVO noticeVO, Model model) {
        // 사용자가 수정한 내용을 DataBase에 반영한다.
        noticeService.updateNotice(noticeVO);

        Long brdId = noticeVO.getBrdId();
        System.out.println(brdId);
        NoticeVO updateNotice = noticeService.noticeDetail(brdId);

//        model.addAttribute("noticeDetail", updateNotice);

        return "redirect:/admin/notice/noticeList.do";
    }


    // 전체 게시글 리스트를 출력한다. (페이징 적용 O)
    // 페이징 : 전체 게시글 리스트 보기 시, 페이징을 적용한다.
    // 초기 리스트 출력 시, 1 페이지를 보여준다.
    // paging() : /admin/notice/paging?page='페이지 번호'에 대한 요청을 처리한다.
    @GetMapping("/noticeList.do")
    public String pagingNoticeList(@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request, Model model) {
        String viewName=(String)request.getAttribute("viewName");

        // 파라미터로 받아온 페이지(번호)에 보여줄 데이터를 추출하여 저장한다.
        List<NoticeVO> noticeList = noticeService.paging(page);

        System.out.println(noticeList);

        // 페이지 하단에 출력할 숫자를 VO에 지정한다.
        // 파라미터로 받아온 페이지 번호에 해당하는 리스트만 출력하고, 다른 페이지 숫자는 단순 출력만 한다. (링크 설정 X)
        pageVO pageVO = noticeService.pagingParam(page);

        model.addAttribute("noticeList", noticeList);
        model.addAttribute("paging", pageVO);
        
        return viewName;
    }

    // 특정 번호의 게시글을 삭제한다.
    @GetMapping("/noticeDelete.do")
    public String deleteNotice(@RequestParam("brd_id") Long brdId) {
        noticeService.deleteNotice(brdId);

        return "redirect:/admin/notice/noticeList.do";
    }


}
