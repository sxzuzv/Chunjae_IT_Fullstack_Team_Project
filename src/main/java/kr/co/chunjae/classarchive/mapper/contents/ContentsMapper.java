package kr.co.chunjae.classarchive.mapper.contents;

import kr.co.chunjae.classarchive.dto.contents.ContentsDTO;
import org.apache.ibatis.annotations.Mapper;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

@Mapper
public interface ContentsMapper {
    public List<ContentsDTO> listAll();

    public void insert(ContentsDTO contentsDTO);

    public Map<String, Object> getContentsFileById(Long id);

    public Long selectContentsId();

    public ContentsDTO selectContentsById(Long Id);

    public void update(ContentsDTO contentsDTO);
    public void updateWithFile(ContentsDTO contentsDTO);

    public String getContentsKeyName(Long Id);

    int contentsCount(); // 글 수 카운트

    List<ContentsDTO> searchAndPaging(String searchWord, Map<String, Integer> pagingParams, LocalDate startDate, LocalDate endDate);

    List<ContentsDTO> paging(Map<String, Integer> pagingParams);  // 전체 조회 (페이징)

    int searchContentsCount(LocalDate startDate, LocalDate endDate);


    String getFileName(Long conId);
}
