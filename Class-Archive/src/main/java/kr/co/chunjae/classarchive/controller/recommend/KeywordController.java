package kr.co.chunjae.classarchive.controller.recommend;

import kr.co.chunjae.classarchive.dto.main.KeywordListDTO;
import kr.co.chunjae.classarchive.service.recommend.KeywordService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("/keyword")
@Slf4j
public class KeywordController {

    private final KeywordService keywordService;

    /**
     * 키워드 관리 리스트 출력
     */
    @GetMapping("/list")
    public String keywordList(Model model) {
        List<KeywordListDTO> keywordList = keywordService.getAll();
        model.addAttribute("keywordList", keywordList);
        return "/recommend/keywordList";
    }


    /**
     * 키워드 관리 폼
     */
    @GetMapping("/addForm")
    public String registerForm(@ModelAttribute KeywordListDTO keywordListDTO) {
        return "/recommend/keywordAdd";
    }


    /**
     * 키워드 관리 키워드 추가
     */
    @PostMapping("/add")
    public String addKeyword(@ModelAttribute("keywordListDTO") KeywordListDTO keywordListDTO) {
        String keywords = keywordListDTO.getKeywords();
        String[] keywordArray = keywords.split(",");

        Integer order = keywordService.getKeywordOrder();//키워드 노출 순서를 가져옴
        if (order == null) {//테이블에 컬럼이 하나도 없을때
            order = 1;
        }

        for(String keyword : keywordArray) {//받아온 키워드 개수만큼 for문실행
            keyword = keyword.trim();
            if (!keyword.isEmpty()) {
                KeywordListDTO addKeywordListDTO = KeywordListDTO.builder()
                        .writerId(1L)
                        .showFlag(keywordListDTO.isShowFlag())
                        .keywords(keyword)
                        .keywordOrder(order++)
                        .build();
                keywordService.addKeyword(addKeywordListDTO);


            }
        }
        return "redirect:list";
    }
    /**
     * 키워드 관리 키워드 삭제
     */
    @GetMapping("/delete")
    public String deleteKeyword(@RequestParam Long id) throws Exception {

        keywordService.deleteKeyword(id);

        return "redirect:list";


    }

    /**
     * 키워드 관리 키워드 전체 삭제
     */
    @GetMapping("/deleteAll")
    public String deleteKeyword() throws Exception {

        keywordService.deleteAllKeyword();

        return "redirect:list";


    }




    //    @GetMapping("/list")
//    public String keywordList(Model model) {
//        List<KeywordListDTO> keywordList = keywordService.getAll();
//        if (!keywordList.isEmpty()) {
//            model.addAttribute("keywordList", keywordList);
//            return "/recommend/keywordList";
//        } else {
//            return "/recommend/keywordList";
//
//        }
//    }
//    @PostMapping("/add")
//    public String addKeyword(@ModelAttribute("keywordListDTO") KeywordListDTO keywordListDTO) {
//        boolean addShowFlag = keywordService.addFlag(keywordListDTO.isShowFlag());
//
//        Long groupId = keywordService.getGroupId();//부모테이블의 Id가져오기
//        Map<String, Object> keyDetailMap = new HashMap<>();//groupId, keyword 담을 map생성
//
//        String keywords = keywordListDTO.getKeywords();//키워드 가져옴
//        String[] keywordArray = keywords.split(",");//,를 단위로 잘라서 저장
//
//        for (String keyword : keywordArray) {//반복문을 통해서 keyword에 저장
//            keyword = keyword.trim();//공백제거
//            if (!keyword.isEmpty()) {
//                keyDetailMap.put("groupId", groupId);//groupid와 keyword map으로 넣어주기
//                keyDetailMap.put("keyword", keyword);
//                keywordService.addKeyword(keyDetailMap);
//            }
//        }
//
//        return "redirect:list";
//    }


}

