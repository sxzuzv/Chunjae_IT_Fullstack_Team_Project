package kr.co.chunjae.classarchive.mapper.recommend;

import kr.co.chunjae.classarchive.dto.contents.ContentsDTO;
import kr.co.chunjae.classarchive.dto.main.*;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface RecommendMapper {
    public List<KeywordListDTO> getAll();

    public void addKeyword(KeywordListDTO keywordListDTO);

//  public void addKeyword(Map<String ,Object> keyDetailMap);

//    public Long getGroupId();
//
//    public boolean addFlag(boolean showFlag);

    public void deleteKeyword(Long id);

    public List<ContentsListDTO> getAllContent();

    public void recContentsAdd(ContentsAddDTO contentsAddDTO);

    public void recContentsKeyAdd(ContentsAddDTO contentsAddDTO);

    public List<ContentsDTO> searchContents(String keyword);

    public Integer getKeywordOrder();

    public void deleteAllKeyword();

    public List<ContentsDTO> searchAllContents();

    public void recContentsIdAdd(ContentsAddDTO contentsAddDTO);

    public ContentsAddDTO detail(Long id);

    public Integer getContentsOrder();

    public void deleteDetail(Long id);

    public void updateConGroup(ContentsAddDTO contentsAddDTO);

    public void updateConKeyword(ContentsAddDTO contentsAddDTO);

    public void recConDelete(Long id);
}
