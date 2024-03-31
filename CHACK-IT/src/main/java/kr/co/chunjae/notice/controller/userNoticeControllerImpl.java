package kr.co.chunjae.notice.controller;

import kr.co.chunjae.admin.notice.vo.NoticeVO;
import kr.co.chunjae.notice.service.userNoticeService;
import kr.co.chunjae.page.pageVO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
public class userNoticeControllerImpl {
    private final userNoticeService noticeService;

    // 게시글 번호를 클릭할 시, 상세 내용을 출력한다.
    // 조회수 계산 기능을 적용하며, '목록보기' 시 직전에 보고 있던 페이지 번호로 돌아간다.
    @GetMapping("/notice/noticeDetail.do")
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

    // 전체 게시글 리스트를 출력한다. (페이징 적용 O)
    // 페이징 : 전체 게시글 리스트 보기 시, 페이징을 적용한다.
    // 초기 리스트 출력 시, 1 페이지를 보여준다.
    // paging() : /admin/notice/paging?page='페이지 번호'에 대한 요청을 처리한다.
    @GetMapping("/notice/noticeList.do")
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
}
