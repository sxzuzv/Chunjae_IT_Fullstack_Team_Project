package kr.co.chunjae.classarchive.service.recommend;

import kr.co.chunjae.classarchive.dto.main.KeywordListDTO;
import kr.co.chunjae.classarchive.mapper.recommend.RecommendMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
@Slf4j
public class KeywordService {

    private final RecommendMapper recommendMapper;

    public List<KeywordListDTO> getAll() {

        return recommendMapper.getAll();

    }

    public void addKeyword(KeywordListDTO keywordListDTO){
        recommendMapper.addKeyword(keywordListDTO);
    }

//    public void addKeyword(Map<String, Object> keyDetailMap) {
//        recommendMapper.addKeyword(keyDetailMap);
//    }

//    public Long getGroupId() {
//        return recommendMapper.getGroupId();
//    }
//
//    public boolean addFlag(boolean showFlag) {
//        return recommendMapper.addFlag(showFlag);
//    }

    public void deleteKeyword(Long id) {
        recommendMapper.deleteKeyword(id);
    }


    public Integer getKeywordOrder() {
        return recommendMapper.getKeywordOrder();
    }

    public void deleteAllKeyword() { recommendMapper.deleteAllKeyword();
    }
}
