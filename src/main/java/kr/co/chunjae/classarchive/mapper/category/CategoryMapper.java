package kr.co.chunjae.classarchive.mapper.category;

import kr.co.chunjae.classarchive.dto.board.NoticeDTO;
import kr.co.chunjae.classarchive.dto.category.CategoryDTO;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;

@Mapper
public interface CategoryMapper {

    public List<CategoryDTO> listAll();

    public List<CategoryDTO> getAllTreeList(int cateId);

    public List<CategoryDTO> findByParentId(int parentId);

    public List<CategoryDTO> getTopics();

    public List<CategoryDTO> getSubCategoriesByParentId(int parentId);

    public void categoryInsert(CategoryDTO categoryDTO);

    public int getLastCateIdInRange(int start, int end);

    public int getMaxSeqByParentId(int parentId);

    public CategoryDTO detail(Long id);  // 상세 조회

    public void categoryUpdate(CategoryDTO categoryDTO);  // 카테고리 이름, 사용여부 수정
}
