package kr.co.chunjae.classarchive.service.front;

import com.amazonaws.util.StringUtils;
import com.google.gson.Gson;
import kr.co.chunjae.classarchive.dto.contents.ContentsDTO;
import kr.co.chunjae.classarchive.dto.thumbnail.ThumbnailDTO;
import kr.co.chunjae.classarchive.mapper.front.FrontMapper;
import kr.co.chunjae.classarchive.service.S3Util;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.logging.log4j.util.Strings;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.*;

/**
 * MainService
 */
@Slf4j
@Service("mainService")
@RequiredArgsConstructor
public class MainService {

  private final S3Util s3util;
  private final FrontMapper frontMapper;
  public List<Map<String, Object>> getContentType() {
    return frontMapper.getContentType();
  }
  public String searchContents(Map<String, Object> params) throws IOException {
    params.put("keyword", params.get("searchKeyword"));
    if(Objects.nonNull(params.get("searchKeyword"))) {
      String afterStr ="";
      String allKeyword = objToStr(params.get("searchKeyword"));
      if(!allKeyword.isEmpty() && allKeyword.charAt(0) == ',') {
        allKeyword = allKeyword.substring(1);
      }
      if(!allKeyword.isEmpty() && allKeyword.charAt(allKeyword.length() - 1) == ',') {
        allKeyword = allKeyword.substring(0, allKeyword.length()-1);
      }
      afterStr = allKeyword.trim().replace(" ", "").replace("," , "|");
      params.put("keyword", afterStr);
    }

    List<ContentsDTO> list = frontMapper.searchContents(params);
    for(ContentsDTO dto : list) {
      ThumbnailDTO thumbDTO = dto.getThumbnailDTO();
      thumbDTO.setPresignedURL(s3util.createSignedUrlForStringPut(thumbDTO.getFilePath() + thumbDTO.getS3FileName()));
    }
    return new Gson().toJson(list);
  }

  public String getContent(String id) throws IOException {
    ContentsDTO dto = frontMapper.searchContentById(id);
    ThumbnailDTO thumbDTO = dto.getThumbnailDTO();
    thumbDTO.setPresignedURL(s3util.createSignedUrlForStringPut(thumbDTO.getFilePath() + thumbDTO.getS3FileName()));
    return new Gson().toJson(dto);
  }

  public List<Map<String, Object>> selectIconPack() throws IOException {
    List<Map<String, Object>> iconPacks = frontMapper.selectIconPack();
    for(Map<String, Object> map : iconPacks) {
      String fileKey = objToStr(map.get("file_path")) + objToStr(map.get("s3_file"));
      String preSignedURL = "";
      if(fileKey.isBlank()) {
        preSignedURL = "/resources/static/front/images/example/iconPack.png";
      } else {
        preSignedURL = s3util.createSignedUrlForStringPut(fileKey);
      }
      map.put("signedURL", preSignedURL);
    }
    return iconPacks;
  }

  public List<Map<String, Object>> selectRecConGroup() throws IOException {

    List<Map<String, Object>> recConGroup = frontMapper.selectRecConGroup();
    for(Map<String, Object> map : recConGroup) {
      List<Map<String, Object>> thumbnailList = (ArrayList) map.getOrDefault("thumbnail", new ArrayList<>());
      if(Objects.nonNull(thumbnailList)) {
        for(Map<String, Object> thumbnail : thumbnailList) {
          String fileKey = objToStr(thumbnail.get("filePath")) + objToStr(thumbnail.get("s3FileName"));
          if(fileKey.isBlank()) {
            thumbnail.put("presignedURL", "/resources/static/front/images/example/iconPack.png");
          } else {
            thumbnail.put("presignedURL", s3util.createSignedUrlForStringPut(fileKey));
          }
        }
      }
    }
    return recConGroup;
  }

  public List<Map<String, Object>> selectRecKeyword() {
    return frontMapper.selectRecKeyword();
  }

  private String objToStr(Object obj) {
    return Objects.nonNull(obj) ? String.valueOf(obj) : "";
  }
}
