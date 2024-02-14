package kr.co.chunjae.classarchive.controller.contents;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.co.chunjae.classarchive.dto.board.NoticeDTO;
import kr.co.chunjae.classarchive.dto.contents.ContentsDTO;
import kr.co.chunjae.classarchive.dto.contents.ContentsMultiDownloadRequest;
import kr.co.chunjae.classarchive.dto.icon.IconPackageDTO;
import kr.co.chunjae.classarchive.service.contents.ContentsService;
import kr.co.chunjae.classarchive.service.icon.IconService;
import kr.co.chunjae.classarchive.util.page.PageDTO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.net.URL;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

@Slf4j
@Controller
@RequiredArgsConstructor
@ControllerAdvice
@RequestMapping("contents")
public class ContentsController {

    private final ContentsService contentsService;
    private final IconService iconService;

    @GetMapping("/add")
    public String addForm() {
        return "/contents/newContents";
    }

    @PostMapping("/add")
    public String addContents(@ModelAttribute ContentsDTO contentsDTO) throws IOException {
        contentsService.upload(contentsDTO);
        return "redirect:/contents/list";
    }

    @GetMapping(value = "/list")
    public String pagingContentsList(@RequestParam Map<String, String> param,
                                   Model model, HttpSession session) throws IOException {

        String searchWord = param.getOrDefault("searchWord", "");
        int page = Integer.parseInt(param.getOrDefault("page", "1")); //하단에서 누른 페이지 숫자

        LocalDate startDate = LocalDate.parse(param.getOrDefault("startDate","2023-12-01")
                , DateTimeFormatter.ofPattern("yyyy-MM-dd"));

        LocalDate endDate = LocalDate.parse(param.getOrDefault("endDate", String.valueOf(LocalDate.now()))
                , DateTimeFormatter.ofPattern("yyyy-MM-dd"));

        // 검색 필터 값을 세션에 저장
        session.setAttribute("startDate", startDate);
        session.setAttribute("endDate", endDate);


        // 날짜 검색 필터 추가
        List<ContentsDTO> contentsList = contentsService.searchAndPaging(searchWord, page, startDate, endDate);
        PageDTO pageNum = contentsService.searchPagingParam(page, startDate, endDate);
        int contentsCount = contentsService.searchNoticeCount(startDate, endDate);

        model.addAttribute("contentsList", contentsList);
        model.addAttribute("paging", pageNum);
        model.addAttribute("contentsCount", contentsCount);

        return "contents/list";
    }

//    @GetMapping("/download")
//    public String downloadFileFromS3()  {
//        return "/contents/download";
//    }
//    @GetMapping("/download/{fileId}")
//    public String downloadFileFromS3(@PathVariable String fileId) throws IOException {
//        System.getProperty("user.home");
//        contentsService.download("ce6c71a3-bce1-4de6-ad2e-a11ed794c72b_logo.png", "C://Users//cyj//Downloads//");
//        return "index";
//    }

    @ResponseBody
    @PostMapping(value = "/downloadFile")
    public void downloadFile(@ModelAttribute("conId") Long conId, HttpServletResponse response) throws Exception {
        contentsService.download(conId, response);
    }

    @GetMapping("/delete/{fileId}")
    public String deleteFileFromS3(@PathVariable String fileId) throws IOException {
        contentsService.deleteFileFromS3();
        return "index";
    }

    @GetMapping("/multiDownload")
    public String multiDownload(@ModelAttribute ContentsMultiDownloadRequest request) {
        return "contents/multiDownload";
    }

    @ResponseBody
    @PostMapping(value = "/multiDownload")
    public void multiDownload(@ModelAttribute ContentsMultiDownloadRequest request, HttpServletResponse response) throws Exception {
        contentsService.multiDownload(request, response);
    }

    @ResponseBody
    @GetMapping("/detail")
    public ContentsDTO detail(@RequestParam("id") Long id) throws IOException {
        ContentsDTO contentsDTO = contentsService.detail(id);

        return contentsDTO;
    }

    @GetMapping("/update")
    public String updateForm(@RequestParam("id") Long id, Model model) throws IOException {

        ContentsDTO contentsDTO = contentsService.detail(id);
        model.addAttribute("contents", contentsDTO);

        return "contents/update";
    }

    @PostMapping("/update")
    public String updateContents(@ModelAttribute ContentsDTO contentsDTO) {
        log.info(String.valueOf(contentsDTO));
        contentsService.update(contentsDTO);
        return "redirect:/contents/list";
    }


    @ResponseBody
    @GetMapping("/getPackage")
    public String getPackage(@RequestParam("id") Long id) throws IOException {
        String iconIds = iconService.detailIconIds(id);
        return iconIds;
    }



}