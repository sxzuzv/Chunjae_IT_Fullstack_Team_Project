package kr.co.chunjae.classarchive.mapper.thumbnail;

import kr.co.chunjae.classarchive.dto.icon.IconPackageDTO;
import kr.co.chunjae.classarchive.dto.thumbnail.PackThumbnailDTO;
import kr.co.chunjae.classarchive.dto.thumbnail.ThumbnailDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ThumbnailMapper {

    public void insert(ThumbnailDTO thumbnailDTO);

   public String getThumbnailKeyName(Long id);

    public void delete(Long id);

    void iconPackThumb(PackThumbnailDTO packThumbnailDTO);



    void updateIconPackThumb(PackThumbnailDTO packThumbnailDTO);

    PackThumbnailDTO getThumbById(Long iconId);
}
