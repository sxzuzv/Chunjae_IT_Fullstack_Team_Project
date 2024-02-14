package kr.co.chunjae.classarchive.service.recommend;

import kr.co.chunjae.classarchive.dto.contents.ContentsDTO;
import kr.co.chunjae.classarchive.dto.main.ContentsAddDTO;
import kr.co.chunjae.classarchive.dto.main.ContentsListDTO;
import kr.co.chunjae.classarchive.mapper.recommend.RecommendMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class RecContentService {
    private final RecommendMapper recommendMapper;

    public List<ContentsListDTO> getAllContent() {
        return recommendMapper.getAllContent();
    }

    public void recContentsAdd(ContentsAddDTO contentsAddDTO) {
        recommendMapper.recContentsAdd(contentsAddDTO);
    }

    public void recContentsKeyAdd(ContentsAddDTO contentsAddDTO) {
        recommendMapper.recContentsKeyAdd(contentsAddDTO);
    }

    public void recContentsIdAdd(ContentsAddDTO contentsAddDTO) {recommendMapper.recContentsIdAdd(contentsAddDTO);
    }

    public List<ContentsDTO> searchContents(String keyword) {return recommendMapper.searchContents(keyword);
    }

    public List<ContentsDTO> searchAllContents() {return recommendMapper.searchAllContents();
    }


    public ContentsAddDTO detail(Long id) {return recommendMapper.detail(id);
    }

    public Integer getContentsOrder() {return recommendMapper.getContentsOrder();
    }

    public void deleteDetail(Long id) {recommendMapper.deleteDetail(id);
    }

    public void updateConGroup(ContentsAddDTO contentsAddDTO) {recommendMapper.updateConGroup(contentsAddDTO);}

    public void updateConKeyword(ContentsAddDTO contentsAddDTO) {recommendMapper.updateConKeyword(contentsAddDTO);}

    public void recConDelete(Long id) {recommendMapper.recConDelete(id);
    }
}

