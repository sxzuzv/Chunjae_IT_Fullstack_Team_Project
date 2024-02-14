package kr.co.chunjae.classarchive.controller.recommend;

import jakarta.servlet.http.HttpSession;
import kr.co.chunjae.classarchive.dto.contents.ContentsDTO;
import kr.co.chunjae.classarchive.dto.main.ContentsAddDTO;
import kr.co.chunjae.classarchive.dto.main.ContentsListDTO;
import kr.co.chunjae.classarchive.service.recommend.RecContentService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/recContents")
@Slf4j
public class RecContentController {

    private final RecContentService recContentService;

    @GetMapping("/list")
    public String recContentList(Model model) {
        List<ContentsListDTO> contentsList = recContentService.getAllContent();


        if (!contentsList.isEmpty()) {
            model.addAttribute("contentsList", contentsList);
            return "recommend/contentList";
        } else {
            return "recommend/contentList";

        }
    }

    @GetMapping("/addForm")
    public String regContentAddForm(@ModelAttribute ContentsAddDTO contentsAddDTO) {
        return "recommend/contentAdd";
    }

    @PostMapping("/save")
    public String regContentAdd(@ModelAttribute ContentsAddDTO contentsAddDTO) {
        Integer order = recContentService.getContentsOrder();//컨텐츠 순서를 가져옴
        if (order == null) {//테이블에 컬럼이 하나도 없을때
            order = 1;
        }
        contentsAddDTO.setGroupOrder(order++);
        contentsAddDTO.setWriterId(1L);

        recContentService.recContentsAdd(contentsAddDTO);//메인 콘텐츠 그룹에 추가
        recContentService.recContentsKeyAdd(contentsAddDTO);//메인 추천 콘텐츠 전체보기 관리에 키워드 추가
        recContentService.recContentsIdAdd(contentsAddDTO);



        return "redirect:list";
    }

    @PostMapping("/search")
    @ResponseBody
    public List<ContentsDTO> searchContents(@RequestParam("keyword") String keyword) {
        List<ContentsDTO> searchContentsList = recContentService.searchContents(keyword);

        return searchContentsList;
    }

    @GetMapping("/searchAll")
    @ResponseBody
    public List<ContentsDTO> searchAllContents() {
        List<ContentsDTO> searchAllContents = recContentService.searchAllContents();

        return searchAllContents;
    }

    @GetMapping("/updateForm")
    public String recContentsDetaill(@RequestParam Long id, Model model){
        ContentsAddDTO contentsAddDTO = recContentService.detail(id);
        log.info(String.valueOf(contentsAddDTO));
        model.addAttribute("contentsAddDTO", contentsAddDTO);
        return "recommend/contentUpdate";

    }

    @PostMapping("/update")
    public String recConDetailUpdate(@ModelAttribute ContentsAddDTO contentsAddDTO){
        recContentService.deleteDetail(contentsAddDTO.getId());//원래 detail에서 id = group_id인 conId 삭제
        recContentService.updateConGroup(contentsAddDTO);//contents_group 업데이트 show_flag title
        recContentService.updateConKeyword(contentsAddDTO);//congroup_all 의 keyword 업데이트
        recContentService.recContentsIdAdd(contentsAddDTO);//id = group_id 인 것들에 수정시 받은 conId insert

        return "redirect:list";
    }

    @GetMapping("/delete")
    public String recConDelete(@RequestParam Long id) {
        recContentService.recConDelete(id);

        return "redirect:list";
    }

}
