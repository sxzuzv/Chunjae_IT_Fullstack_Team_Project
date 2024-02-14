package kr.co.chunjae.classarchive.service.category;

import kr.co.chunjae.classarchive.dto.board.NoticeDTO;
import kr.co.chunjae.classarchive.dto.category.CategoryDTO;
import kr.co.chunjae.classarchive.mapper.category.CategoryMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

@Slf4j
@RequiredArgsConstructor
@Service
public class CategoryService {

    private final CategoryMapper categoryMapper;


    public List<CategoryDTO> getAllCategories() {
        return categoryMapper.listAll();
    }

    public List<CategoryDTO> getAllTreeList(int cateId) {
        List<CategoryDTO> categoryDTOList = categoryMapper.getAllTreeList(cateId);

        for (CategoryDTO categoryDTO : categoryDTOList) {
            List<CategoryDTO> subcategories = categoryMapper.findByParentId(categoryDTO.getParentId());
            categoryDTO.setSubcategories(subcategories);
        }

        return categoryDTOList;
    }

    @Transactional
    public List<CategoryDTO> getTopics() {
        return categoryMapper.getTopics();
    }

    @Transactional
    public List<CategoryDTO> getSubCategoriesByParentId(int parentId) {
        return categoryMapper.getSubCategoriesByParentId(parentId);
    }

    @Transactional
    public void categoryInsert(CategoryDTO categoryDTO) {
        try {
            categoryMapper.categoryInsert(categoryDTO);
        } catch (Exception e) {
            log.error("분류 추가 중 오류 발생: {}", e.getMessage());
            throw new RuntimeException("분류 추가 중 오류가 발생했습니다.");
        }
    }

    public int getLastCateIdInRange(int start, int end) {
        return categoryMapper.getLastCateIdInRange(start, end);
    }

    public int getMaxSeqByParentId(int parentId) {
        return categoryMapper.getMaxSeqByParentId(parentId);
    }

    public CategoryDTO detail(Long id) {
        return categoryMapper.detail(id);
    }

    public void categoryUpdate(CategoryDTO categoryDTO) {
        categoryMapper.categoryUpdate(categoryDTO);
    }

}
