package kr.co.chunjae.classarchive.mapper.front;

import kr.co.chunjae.classarchive.dto.contents.ContentsDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface FrontMapper {
    public List<Map<String, Object>> getContentType();
    public List<ContentsDTO> searchContents(Map<String, Object> paramMap);
    public ContentsDTO searchContentById(String id);

    public List<Map<String,Object>> selectIconPack();
    public List<Map<String,Object>> selectRecConGroup();
    public List<Map<String,Object>> selectRecKeyword();

}
