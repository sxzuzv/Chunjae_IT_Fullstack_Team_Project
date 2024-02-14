package kr.co.chunjae.classarchive.service.icon;

import jakarta.servlet.http.HttpSession;
import kr.co.chunjae.classarchive.dto.contents.ContentsDTO;
import kr.co.chunjae.classarchive.dto.icon.IconPackageDTO;
import kr.co.chunjae.classarchive.dto.icon.IconPackageDetailDTO;
import kr.co.chunjae.classarchive.dto.thumbnail.PackThumbnailDTO;
import kr.co.chunjae.classarchive.mapper.contents.ContentsMapper;
import kr.co.chunjae.classarchive.mapper.icon.IconMapper;
import kr.co.chunjae.classarchive.mapper.thumbnail.ThumbnailMapper;
import kr.co.chunjae.classarchive.service.S3Util;
import kr.co.chunjae.classarchive.util.page.PageCalc;
import kr.co.chunjae.classarchive.util.page.PageDTO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.*;

@Service
@RequiredArgsConstructor
@Slf4j
public class IconService {
    private final S3Util s3Util;
    private final PageCalc pageCalc;

    private final IconMapper iconMapper;
    private final ContentsMapper contentsMapper;
    private final ThumbnailMapper thumbnailMapper;

    String filePath = "thumbnail/contents/iconPackage/";


    public void saveIcon(IconPackageDTO iconPackageDTO) {
        iconMapper.saveIcon(iconPackageDTO);
    }


    public List<IconPackageDTO> searchAndPaging(String searchOption, String searchWord, int page, LocalDate startDate, LocalDate endDate) {
        Map<String, Integer> pagingParams = pageCalc.pagingList(page);
        return iconMapper.searchAndPaging(searchOption, searchWord, pagingParams, startDate, endDate);
    }

    public PageDTO searchPagingParam(int page, String searchOption, String searchWord, LocalDate startDate, LocalDate endDate) {
        int noticeCount;
        noticeCount = iconMapper.searchIconCount(searchOption, searchWord, startDate, endDate);
        return pageCalc.pagingParam(page, noticeCount);
    }

    public int searchNoticeCount(String searchOption, String searchWord, LocalDate startDate, LocalDate endDate) {
        return iconMapper.searchIconCount(searchOption, searchWord, startDate, endDate);
    }

    public IconPackageDTO detailIcon(Long packId) {
        return iconMapper.detailIcon(packId);
    }

    public void deleteIcon(Long id) {
        iconMapper.deleteIcon(id);
    }


    // 팝업창 내에서의 키워드 검색 데이터를 받아온다.
    public List<ContentsDTO> searchIcon(String keyword) {
        return iconMapper.searchIcon(keyword);
    }

    // 팝업창 내에서의 선택 가능한 아이콘에 대한 데이터를 받아온다.
    public List<ContentsDTO> searchIconAll() {
        return iconMapper.searchIconAll();
    }

    public int countIconList() {
        return iconMapper.countIconList();
    }

    public ContentsDTO showPreview(Long id) throws IOException {
        // 매개변수로 받아온 Contents ID로 콘텐츠 정보를 조회한다.
        ContentsDTO contentsDTO = contentsMapper.selectContentsById(id);

        // S3Util START //
        // presignedURL을 발급 받아 contentsDTO에 저장한다.
        String keyName =  contentsDTO.getFilePath() + contentsDTO.getS3FileName();
        String presignedURL = s3Util.createSignedUrlForStringPut(keyName);
        contentsDTO.setPresignedURL(presignedURL);

        // presignedURL 발급 받아 thumbnailDTO에 저장한다.
        String thumKeyName =  contentsDTO.getThumbnailDTO().getFilePath() + contentsDTO.getThumbnailDTO().getS3FileName();
        String thumPresignedURL = s3Util.createSignedUrlForStringPut(thumKeyName);
        contentsDTO.getThumbnailDTO().setPresignedURL(thumPresignedURL);

        return contentsDTO;
    }

    public void saveIconsDetail(IconPackageDTO iconPackageDTO) {
        iconMapper.saveIconsDetail(iconPackageDTO);
    }

    public List<Long> conIdList(Long packId) {
        /** 기존에 선택됐던 아이콘('[ID] 아이콘명' 형태로 표기) 및
            미리보기 이미지 출력을 위해 데이터를 불러온다. **/
        // 아래 구문 실행 시, 아이콘 ID, 아이콘명, file_path, s3_file이 불러와진다.
        List<Long> conIdList = iconMapper.conIdList(packId);

        // 미리보기 이미지 출력을 위해 각 아이콘에 대한 presignedURL을 생성한다.
//        for(ContentsDTO contentsDTO : conIdList) {
//            String keyName =  contentsDTO.getFilePath() + contentsDTO.getS3FileName();
//            String presignedURL = s3Util.createSignedUrlForStringPut(keyName);
//            contentsDTO.setPresignedURL(presignedURL);
//        }

        System.out.println(conIdList);

        return conIdList;
    }

    public void deleteIconsDetail(Long id) {
        iconMapper.deleteIconsDetail(id);
    }

    public void upload(MultipartFile thumbnailFile, Long id) throws IOException {
        // S3Util START //
        String fileName = s3Util.upload(thumbnailFile, filePath);
        // S3Util END //

        PackThumbnailDTO packThumbnailDTO = PackThumbnailDTO.builder()
                .packId(id)
                .originalFile(thumbnailFile.getOriginalFilename())
                .s3File(fileName)
                .filePath(filePath)
                .build();

        thumbnailMapper.iconPackThumb(packThumbnailDTO);
    }

    public void updateIcon(IconPackageDTO iconPackageDTO) {
        iconMapper.updateIcon(iconPackageDTO);
    }

    public void updateIconPackThumb(IconPackageDTO iconPackageDTO) throws IOException {
        Long iconId = iconPackageDTO.getId();

        // 꾸러미 ID에 매칭되는 꾸러미 썸네일 이미지 관리 테이블의 데이터를 가져온다.
        PackThumbnailDTO packThumbnailDTO = thumbnailMapper.getThumbById(iconId);

        if(iconPackageDTO.getThumbnailFile() != null && !iconPackageDTO.getThumbnailFile().isEmpty()) {
            // S3Util START //
            String fileName = s3Util.upload(iconPackageDTO.getThumbnailFile(), filePath);
            // S3Util END //

            // S3에 저장된 기존 썸네일 파일의 경로 및 파일명을 조회한다.
            String keyName = iconMapper.getIconPackThumbKeyName(iconPackageDTO.getId());

            // S3에 업로드 된 기존 데이터를 삭제한다.
            s3Util.delete(keyName);

            packThumbnailDTO.setPackId(iconId);
            packThumbnailDTO.setOriginalFile(iconPackageDTO.getThumbnailFile().getOriginalFilename());
            packThumbnailDTO.setFilePath(filePath);
            packThumbnailDTO.setS3File(fileName);

//            iconPackageDTO.getPackThumbnailDTO().setOriginalFile(iconPackageDTO.getThumbnailFile().getOriginalFilename());
//            iconPackageDTO.getPackThumbnailDTO().setFilePath(filePath);
//            iconPackageDTO.getPackThumbnailDTO().setS3File(fileName);
        }
        thumbnailMapper.updateIconPackThumb(packThumbnailDTO);
    }


    public String detailIconIds(Long packId) {
        String ids = iconMapper.detailIconIds(packId);

        return ids;
    }
}
