package kr.co.chunjae.classarchive.controller.icon;

import jakarta.servlet.http.HttpSession;
import kr.co.chunjae.classarchive.controller.error.exceptionhandler.ExceptionHandler;
import kr.co.chunjae.classarchive.dto.contents.ContentsDTO;
import kr.co.chunjae.classarchive.dto.icon.IconPackageDTO;
import kr.co.chunjae.classarchive.service.icon.IconService;
import kr.co.chunjae.classarchive.util.page.PageDTO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

@Slf4j
@Controller
@RequiredArgsConstructor
//@ControllerAdvice
@RequestMapping("icon")
public class IconController {
    private final IconService iconService;


    // 아이콘 꾸러미 등록 폼을 출력한다.
    @GetMapping("/save")
    public String saveForm(@ModelAttribute IconPackageDTO iconPackageDTO) {
        return "/icon/save";
    }


    // 아이콘 꾸러미를 등록하고, 목록 페이지로 이동한다.
    @PostMapping("/save")
    public String saveIcon(@ModelAttribute IconPackageDTO iconPackageDTO) throws IOException {
        iconPackageDTO.setWriterId(1L);

        // '아이콘 꾸러미 관리' 테이블에 정보를 저장한다.
        iconService.saveIcon(iconPackageDTO);

        // 업로드된 썸네일 파일 정보를 AWS S3, '꾸러미 썸네일 이미지 관리' 테이블에 저장한다.
        iconService.upload(iconPackageDTO.getThumbnailFile(), iconPackageDTO.getId());

        // '아이콘 꾸러미 상세' 테이블에 정보를 저장한다.
        iconService.saveIconsDetail(iconPackageDTO);

        return "redirect:/icon/list";
    }


    // 아이콘 꾸러미 등록 : 아이콘 검색 팝업창 내에서 검색어에 따른 선택 가능한 아이콘 리스트를 출력한다.
    @PostMapping("/search")
    @ResponseBody
    public List<ContentsDTO> searchIcon(@RequestParam("keyword") String keyword) {
        List<ContentsDTO> searchIconList = iconService.searchIcon(keyword);

        return searchIconList;
    }


    // 아이콘 꾸러미 등록 : 아이콘 검색 팝업창 내에서 선택 가능한 아이콘 리스트를 출력한다.
    @GetMapping("/searchAll")
    @ResponseBody
    public List<ContentsDTO> searchIconAll() {
        List<ContentsDTO> searchIconAll = iconService.searchIconAll();

        return searchIconAll;
    }


    // 아이콘 꾸러미 등록 : 아이콘 검색 팝업창에서 선택한 아이콘의 미리보기(이미지)를 출력한다.
    @GetMapping("/showPreview")
    @ResponseBody
    public ContentsDTO showPreview(@RequestParam("id") Long id) throws IOException {
        ContentsDTO previewImage = iconService.showPreview(id);

        return previewImage;
    }


    @GetMapping("/list")
    public String listAll(@RequestParam Map<String, String> param, Model model,
                          HttpSession session) {
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
        List<IconPackageDTO> iconList = iconService.searchAndPaging(searchOption, searchWord, page, startDate, endDate);
        PageDTO pageNum = iconService.searchPagingParam(page, searchOption, searchWord, startDate, endDate);
        int countIconList = iconService.searchNoticeCount(searchOption, searchWord, startDate, endDate);

//        List<IconPackageDTO> iconList = iconService.listAll();
//        int countIconList = iconService.countIconList();

        model.addAttribute("iconList", iconList);
        model.addAttribute("paging", pageNum);
        model.addAttribute("countIconList", countIconList);

        return "/icon/list";
    }


    // 아이콘 꾸러미 수정 폼을 출력한다. (선택한 아이콘 꾸러미의 상세 정보를 함께 출력한다.)
    @GetMapping("/update")
    public String updateForm(@RequestParam("packId") Long packId, Model model,
                             @ModelAttribute IconPackageDTO iconPackageDTO) throws IOException {
        // 꾸러미 ID로 기존 아이콘 꾸러미 데이터를 불러온다.
        IconPackageDTO detailIcon = iconService.detailIcon(packId);

        model.addAttribute("detailIcon", detailIcon);

        return "/icon/update";
    }


    // 선택한 아이콘 꾸러미의 상세 정보를 수정하고, 목록 페이지로 돌아간다.
    @PostMapping("/update")
    public String updateIcon(@ModelAttribute IconPackageDTO iconPackageDTO, Model model) throws IOException {
        // '아이콘 꾸러미 관리' 테이블에 수정된 정보를 저장한다.
        iconService.updateIcon(iconPackageDTO);
        iconService.updateIconPackThumb(iconPackageDTO);

        Long id = iconPackageDTO.getId();

        // '아이콘 꾸러미 상세' 테이블에 수정된 정보를 저장한다.
        iconService.deleteIconsDetail(id);
        iconService.saveIconsDetail(iconPackageDTO);

        return "redirect:/icon/list";
    }


    // 선택한 아이콘 꾸러미를 (논리)삭제하고, 목록 페이지로 돌아간다.
    @GetMapping("/delete")
    public String deleteIcon(@RequestParam("id") Long id) {
        iconService.deleteIcon(id);

        return "redirect:/icon/list";
    }


    //    @GetMapping({"/", ""})
//    public String menu() {
//        return "/icon/menu";
//    }


    // 등록된 아이콘 꾸러미의 전체 목록을 출력한다.
//    @GetMapping("/list")
//    public String listAll(Model model) {
//        List<IconPackageDTO> iconList = iconService.listAll();
//        int countIconList = iconService.countIconList();
//
//        model.addAttribute("iconList", iconList);
//        model.addAttribute("countIconList", countIconList);
//
//        return "/icon/list";
//    }

    // 선택한 아이콘 꾸러미의 상세 정보를 조회한다.
//    @GetMapping("/detail")
//    public String detailIcon(@RequestParam("id") Long id, Model model, @ModelAttribute IconPackageDTO iconPackageDTO) {
//        IconPackageDTO detailIcon = iconService.detailIcon(id);
//
//        model.addAttribute("detailIcon", detailIcon);
//
//        return "/icon/detail";
//    }

}
