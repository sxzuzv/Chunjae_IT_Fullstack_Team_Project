package kr.co.chunjae.classarchive.mapper.icon;

import kr.co.chunjae.classarchive.dto.contents.ContentsDTO;
import kr.co.chunjae.classarchive.dto.icon.IconPackageDTO;
import org.apache.ibatis.annotations.Mapper;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

@Mapper
public interface IconMapper {
    void saveIcon(IconPackageDTO iconPackageDTO);

    void saveIconsDetail(IconPackageDTO iconPackageDTO);

    List<IconPackageDTO> listAll();

    IconPackageDTO detailIcon(Long packId);

    void updateIcon(IconPackageDTO iconPackageDTO);

    void deleteIcon(Long id);

    List<ContentsDTO> searchIcon(String keyword);

    int countIconList();

    List<ContentsDTO> searchIconAll();

    ContentsDTO selectContentsInfo(Long id);

    List<Long> conIdList(Long packId);

    void deleteIconsDetail(Long id);

    String getIconPackThumbKeyName(Long id);

    String detailIconIds(Long packId);

    List<IconPackageDTO> searchAndPaging(String searchOption, String searchWord, Map<String, Integer> pagingParams, LocalDate startDate, LocalDate endDate);

    int searchIconCount(String searchOption, String searchWord, LocalDate startDate, LocalDate endDate);
}
