package kr.co.chunjae.classarchive.controller.category;


import jakarta.servlet.http.HttpServletRequest;
import kr.co.chunjae.classarchive.dto.board.NoticeDTO;
import kr.co.chunjae.classarchive.dto.category.CategoryDTO;
import kr.co.chunjae.classarchive.service.category.CategoryService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Log4j2
@RequiredArgsConstructor
@RequestMapping("category")
@Controller
public class CategoryController {
    private final CategoryService categoryService;

    @ResponseBody
    @GetMapping({"", "/"})
    public Map<Long, CategoryDTO> getAllCategories(){
        // 전체 카테고리 조회하여 List에 저장
        List<CategoryDTO> categoryDTOList = categoryService.getAllCategories();
        // List -> Map
        Map<Long, CategoryDTO> categoryMap = convertListToCategoryMap(categoryDTOList);
        return categoryMap;
    }

    @ResponseBody
    @GetMapping("getAllTreeList")
    public Map<Long, CategoryDTO> getAllTreeList(@RequestParam int cateId){
        // id에 해당하는 카테고리의 모든 자식 카테고리 조회하여 List에 저장
        List<CategoryDTO> categoryDTOList = categoryService.getAllTreeList(cateId);
        // List -> Map
        Map<Long, CategoryDTO> categoryMap = convertListToCategoryMap(categoryDTOList);

        // 하위 카테고리가 존재하지 않을 경우
        if(categoryMap == null || categoryMap.isEmpty()){
            // null을 반환하면 ajax 오류가 발생하기 때문에 0과 null을 넣어준 map을 반환한다.
            categoryMap = new HashMap<>(){{put(0L, new CategoryDTO());}};
        }

        return categoryMap;
    }

    @GetMapping("categoryManagement")
    public String findForm(Model model){
        Integer parentId;
        List<CategoryDTO> categoryDTOList;

        // categoryListForLeftNav 기본값으로 depth=2인 카테고리(parentId=999)를 조회하여 사이드바에 출력한다.
        parentId = 999;
        categoryDTOList = categoryService.getAllTreeList(parentId);
        model.addAttribute("LeftSideBarCategory", categoryDTOList);

        // categoryList 기본값으로 depth=2 orders=1을 부모로 가지는 노드들을 메인에 출력한다.
        CategoryDTO firstCategoryDTO = categoryDTOList.get(0);
        categoryDTOList = categoryService.getAllTreeList(firstCategoryDTO.getCateId());
        model.addAttribute("categoryDTOList", categoryDTOList);

        return "category/categoryManagement";
    }

    private Map<Long, CategoryDTO> convertListToCategoryMap(List<CategoryDTO> categoryDTOList){
        Map<Long, CategoryDTO> categoryMap = categoryDTOList
                .stream()
                .collect(Collectors.toMap(
                        i1 -> (long) i1.getSeq(), // int를 long으로 형변환
                        i2 -> i2)
                );
        return categoryMap;
    }

    @GetMapping("/topics")
    public ResponseEntity<List<CategoryDTO>> getTopics() {
        List<CategoryDTO> topics = categoryService.getTopics();
        return ResponseEntity.ok(topics);
    }

    @GetMapping("/subcategories")
    public ResponseEntity<List<CategoryDTO>> getSubCategories(@RequestParam int parentId) {
        List<CategoryDTO> subCategories = categoryService.getSubCategoriesByParentId(parentId);
        return ResponseEntity.ok(subCategories);
    }

    /**
     * 글 작성
     */
    // 폼 출력
    @GetMapping("/categoryWrite")
    public String writeForm() {
        return "category/categoryWrite";
    }

    @PostMapping("/categoryWrite")
    public ResponseEntity<String> categoryWrite(@ModelAttribute CategoryDTO categoryDTO) {
        try {
            // 받아온 데이터(categoryDTO)를 사용하여 새로운 분류를 추가하는 서비스 메서드 호출
            int depths = 4;
//            if (categoryDTO.getParentId() >= 1000 && categoryDTO.getParentId() <= 1900) {
//                depths = 3;
//            } else if (categoryDTO.getParentId() >= 2000 && categoryDTO.getParentId() <= 2900) {
//                depths = 4;
//            } else {
//                depths = categoryDTO.getParentId() == 999 ? 1 : 2; // 주제는 depth가 1, 하위 카테고리는 depth가 2
//            }
            // cateId 값에 따라 설정
            int cateId;
            if (categoryDTO.getParentId() >= 1000 && categoryDTO.getParentId() <= 1900) {
                cateId = categoryService.getLastCateIdInRange(1000, 1900) + 1;
            } else if (categoryDTO.getParentId() >= 2000 && categoryDTO.getParentId() <= 2900) {
                cateId = categoryService.getLastCateIdInRange(2000, 2900) + 1;
            } else {
                cateId = categoryDTO.getParentId() == 999 ? 1000 : 2000; // 주제는 cateId가 1000대, 교과는 cateId가 2000대
            }

            // 가장 큰 seq 값을 가져와 +1을 해서 설정
            int seq = categoryService.getMaxSeqByParentId(categoryDTO.getParentId()) + 1;


            categoryDTO.setCateId(cateId);
            categoryDTO.setDepths(depths);
            categoryDTO.setSeq(seq);



            categoryService.categoryInsert(categoryDTO);

            // 분류 추가가 성공했을 때의 응답
            return ResponseEntity.ok("분류가 성공적으로 추가되었습니다.");
        } catch (Exception e) {
            // 분류 추가 중 오류가 발생했을 때의 응답
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("분류 추가 중 오류가 발생했습니다.");
        }
    }

    /**
     * 글 수정
     */
    // 폼 출력 : 기존 게시글 내용을 출력한다.

    @ResponseBody
    @GetMapping("/categoryUpdateInfo")
    public ResponseEntity<CategoryDTO> getCategoryUpdateInfo(@RequestParam("id") Long id) {
        CategoryDTO categoryDTO = categoryService.detail(id);
        return ResponseEntity.ok(categoryDTO);
    }

    // 카테고리 수정 폼 출력 시, 카테고리 정보를 가져오도록 수정
    @GetMapping("/categoryUpdate")
    public String updateForm(@RequestParam("id") Long id, Model model) {
        CategoryDTO categoryDTO = categoryService.detail(id);
        model.addAttribute("category", categoryDTO);
        return "category/categoryUpdate";
    }

    // Update 버튼 클릭 시, 카테고리 정보를 업데이트하는 메서드
    // 주석 처리된 메서드를 활용하여 업데이트를 처리하는 메서드 사용
    @PostMapping("/categoryUpdate")
    public ResponseEntity<String> update(@RequestParam("id") Long id,
                                         @RequestParam("name") String name,
                                         @RequestParam("showFlag") boolean showFlag) {
        try {
            // 요청으로부터 받은 데이터를 사용하여 카테고리 정보를 업데이트하는 서비스 메서드 호출
            CategoryDTO categoryDTO = new CategoryDTO();
            categoryDTO.setId(id);
            categoryDTO.setName(name);
            categoryDTO.setShowFlag(showFlag);
            categoryService.categoryUpdate(categoryDTO);

            // 업데이트가 성공했을 때의 응답
            return ResponseEntity.ok("카테고리가 성공적으로 수정되었습니다.");
        } catch (Exception e) {
            // 업데이트 중 오류가 발생했을 때의 응답
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("카테고리 수정 중 오류가 발생했습니다.");
        }
    }
}