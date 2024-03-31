package kr.co.chunjae.classarchive.controller.board;

import jakarta.servlet.http.HttpSession;
import kr.co.chunjae.classarchive.dto.board.NoticeDTO;
import kr.co.chunjae.classarchive.service.board.NoticeService;
import kr.co.chunjae.classarchive.util.page.PageDTO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

@Slf4j
@Controller
@RequestMapping(value = "/board")
@RequiredArgsConstructor
public class NoticeController {

    private final NoticeService noticeService;

    // 전체 목록 출력 (페이징 x)
//    @GetMapping(value = "/")
//    public String list(Model model) {
//        List<NoticeDTO> list = noticeService.listAll();
//        log.info("Service returned list with size: " + list.size());
//
//        model.addAttribute("list", list);
//        log.info("============================= NoticeController.list" + list);
//
//        return "board/main";
//    }

    // 전체 목록 출력 (페이징 o)
    @GetMapping(value = "/list")
    public String pagingNoticeList(@RequestParam Map<String, String> param,
                                   Model model, HttpSession session) {

        String searchOption = param.getOrDefault("searchOption", "byTitle");  // 검색 옵션 (제목/게시자명)
        String searchWord = param.getOrDefault("searchWord", "");  // 검색어 (텍스트 입력)
        int page = Integer.parseInt(param.getOrDefault("page", "1")); //하단에서 누른 페이지 숫자

        LocalDate startDate = LocalDate.parse(param.getOrDefault("startDate","2023-12-01")
                , DateTimeFormatter.ofPattern("yyyy-MM-dd"));

        LocalDate endDate = LocalDate.parse(param.getOrDefault("endDate", String.valueOf(LocalDate.now()))
                , DateTimeFormatter.ofPattern("yyyy-MM-dd"));

        // 검색 필터 값을 세션에 저장
        session.setAttribute("searchOption", searchOption);
        session.setAttribute("searchWord", searchWord);
        session.setAttribute("startDate", startDate);
        session.setAttribute("endDate", endDate);

        // 검색 필터 추가
        List<NoticeDTO> noticeList = noticeService.searchAndPaging(searchOption, searchWord, page, startDate, endDate);
        PageDTO pageNum = noticeService.searchPagingParam(page, searchOption, searchWord, startDate, endDate);
        int noticeCount = noticeService.searchNoticeCount(searchOption, searchWord, startDate, endDate);

        model.addAttribute("list", noticeList);
        model.addAttribute("paging", pageNum);
        model.addAttribute("noticeCount", noticeCount);

        return "board/list";
    }

    // 상세 조회 출력
    @GetMapping("/detail")
    public @ResponseBody NoticeDTO detail(@RequestParam("id") Long id, Model model) {
        log.info(String.valueOf(id));

        NoticeDTO noticeDTO = noticeService.detail(id);
        log.info(String.valueOf(noticeDTO));
        model.addAttribute("notice", noticeDTO);
        return noticeDTO;
    }

    /**
     * 글 작성
     */
    // 폼 출력
    @GetMapping("/write")
    public String writeForm() {
        return "board/write";
    }

    // 작성한 내용 저장
    @PostMapping("/write")
    public String noticeWrite(@ModelAttribute NoticeDTO noticeDTO) throws Exception {
        noticeService.noticeWrite(noticeDTO);

        log.info("============================== NoticeController.noticeWrite" + noticeDTO);
        return "redirect:/board/list";
    }

    /**
     * 글 수정
     */
    // 폼 출력 : 기존 게시글 내용을 출력한다.
    @GetMapping("/update")
    public String updateForm(@RequestParam("id") Long id, Model model) {

        NoticeDTO noticeDTO = noticeService.detail(id);
        model.addAttribute("detail", noticeDTO);
        return "board/update";
    }

    // 사용자가 수정한 내용을 저장하고, 전체 게시글 목록으로 돌아간다.
    @PostMapping("/update")
    public String update(@ModelAttribute NoticeDTO noticeDTO, Model model) {
        // 사용자가 수정한 내용을 DataBase에 반영한다.
        noticeService.updateNotice(noticeDTO);

        Long id = noticeDTO.getId();
        log.info("======================= id : " + id);

        NoticeDTO updateNotice = noticeService.detail(id);

//        model.addAttribute("detail", updateNotice);

        return "redirect:/board/list";
    }

    /** 글 삭제 (논리) */
    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id) {
        noticeService.delete(id);

        return "redirect:/board/list";
    }
}
