package kr.co.chunjae.classarchive.service.contents;

import jakarta.servlet.http.HttpServletResponse;
import kr.co.chunjae.classarchive.dto.board.NoticeDTO;
import kr.co.chunjae.classarchive.dto.contents.ContentsDTO;
import kr.co.chunjae.classarchive.dto.contents.ContentsMultiDownloadRequest;
import kr.co.chunjae.classarchive.dto.thumbnail.ThumbnailDTO;
import kr.co.chunjae.classarchive.mapper.contents.ContentsMapper;
import kr.co.chunjae.classarchive.mapper.thumbnail.ThumbnailMapper;
import kr.co.chunjae.classarchive.service.S3Util;
import kr.co.chunjae.classarchive.util.page.PageCalc;
import kr.co.chunjae.classarchive.util.page.PageDTO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.jasper.tagplugins.jstl.core.Url;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;
import java.net.URL;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
@Slf4j
public class ContentsService {

    private final S3Util s3Util;
    private final ContentsMapper contentsMapper;
    private final ThumbnailMapper thumbnailMapper;
    private final PageCalc pageCalc;



    public List<ContentsDTO> listAll() throws IOException {
        List<ContentsDTO> Contentslist =contentsMapper.listAll();

        for (ContentsDTO item: Contentslist) {
            String keyName =  item.getThumbnailDTO().getFilePath() + item.getThumbnailDTO().getS3FileName();
            String presignedURL = s3Util.createSignedUrlForStringPut(keyName);
            item.getThumbnailDTO().setPresignedURL(presignedURL);
        }

        return Contentslist;
    }

    @Transactional
    public void multiDownload(ContentsMultiDownloadRequest request, HttpServletResponse response) throws Exception {
        List<Long> idList = request.getContentsIdList();
        List<String> filePathList = new ArrayList<>();
        List<String> fileNameList = new ArrayList<>();
        for (Long id : idList) {
            Map<String, Object> map = contentsMapper.getContentsFileById(id);
            String filePath = String.valueOf(map.get("file_path"));
            String fileKey = filePath+String.valueOf(map.get("s3_file"));
            String fileOrgName = String.valueOf(map.get("original_file"));
            filePathList.add(fileKey);
            fileNameList.add(fileOrgName);
        }
        try {
            //S3Util START//
            s3Util.multiDownload(fileNameList, filePathList, response);
            // S3Util END//
        } catch (Exception e) {
            log.error(e.getMessage());
        }

//        request.setUserId(SessionUtil.getLoginedUserId());
//        request.setScrapId(null);
//        request.setScrapDownYn('N');
//        //Insert Log
//        int insert = contentMapper.addContentMultiDownloadLog(request);
//        if (insert < 1) {
//            throw new Exception("로그 저장에 실패했습니다.");
//        }
    }

    public String deleteFileFromS3() throws IOException {

        s3Util.delete("2568d972-0ccb-4eb4-a5af-249c8b718f94_logosize.png");
        return "index";
    }



    @Transactional
    public void upload(ContentsDTO contentsDTO) throws IOException {
        //파일 경로설정
        String filePath = "contents/";

        if (contentsDTO.getTypeId().equals(1L)) {
            filePath = filePath+"image/";
        }else if(contentsDTO.getTypeId().equals(2L)){
            filePath = filePath+"icon/";
        }else if(contentsDTO.getTypeId().equals(3L)){
            filePath = filePath+"character/";
        } else if (contentsDTO.getTypeId().equals(4L)) {
            filePath = filePath+"video/";
        } else{

        }

        filePath = filePath;

        //S3Util START//
       String fileName = s3Util.upload(contentsDTO.getContentsFile(), filePath);
       List<String> thumbNames = s3Util.multiUpload(contentsDTO.getThumbnailFiles(), "thumbnail/"+filePath);
        // S3Util END//

       contentsDTO.setOfileName(contentsDTO.getContentsFile().getOriginalFilename());
       contentsDTO.setFilePath(filePath);
       contentsDTO.setS3FileName(fileName);

        contentsMapper.insert(contentsDTO);
        Long conId = contentsMapper.selectContentsId();


        for (int i = 0; i < thumbNames.size() ; i++) {
            ThumbnailDTO thumbnailDTO = ThumbnailDTO.builder()
                    .conId(conId)
                    .ofileName(contentsDTO.getThumbnailFiles().get(i).getOriginalFilename())
                    .s3FileName(thumbNames.get(i))
                    .filePath("thumbnail/"+filePath)
                    .build();

            thumbnailMapper.insert(thumbnailDTO);
        }

    }

    public void download(Long conId, HttpServletResponse response) throws IOException {
        String fileName = contentsMapper.getFileName(conId);
        String filePath = contentsMapper.getContentsKeyName(conId);

        //S3Util START//
        s3Util.download(fileName, filePath, response);
        // S3Util END//
    }

    public ContentsDTO detail(Long id) throws IOException {
        //contents Id로 조회
        ContentsDTO contentsDTO = contentsMapper.selectContentsById(id);

        //S3Util START//
        //presignedURL 발급받아 contentsDTO에 넣기
        String keyName =  contentsDTO.getFilePath() + contentsDTO.getS3FileName();
        String presignedURL = s3Util.createSignedUrlForStringPut(keyName);
        contentsDTO.setPresignedURL(presignedURL);

        //presignedURL 발급받아 thumbnailDTO 넣기
        String thumKeyName =  contentsDTO.getThumbnailDTO().getFilePath() + contentsDTO.getThumbnailDTO().getS3FileName();
        String thumPresignedURL = s3Util.createSignedUrlForStringPut(thumKeyName);
        contentsDTO.getThumbnailDTO().setPresignedURL(thumPresignedURL);
        // S3Util END//

        return contentsDTO;
    }

    public void update(ContentsDTO contentsDTO) {

        //파일 경로설정
        String filePath = "contents/";

        if (contentsDTO.getTypeId().equals(1L)) {
            filePath = filePath+"image/";
        }else if(contentsDTO.getTypeId().equals(2L)){
            filePath = filePath+"icon/";
        }else if(contentsDTO.getTypeId().equals(3L)){
            filePath = filePath+"character/";
        } else if (contentsDTO.getTypeId().equals(4L)) {
            filePath = filePath+"video/";
        } else{

        }

        filePath = filePath;

        //넘어온 파일객체가 있을때만 관련 수정, 기존파일 삭제 실행
        if(!contentsDTO.getContentsFile().getOriginalFilename().equals("")) {

            //S3Util START//
            String fileName = s3Util.upload(contentsDTO.getContentsFile(), filePath);
            // S3Util END//

            // 경로+파일명 조회
            String keyName= contentsMapper.getContentsKeyName(contentsDTO.getId());
            // 기존 객체 삭제
            //S3Util START//
            s3Util.delete(keyName);
            // S3Util END//

            contentsDTO.setOfileName(contentsDTO.getContentsFile().getOriginalFilename());
            contentsDTO.setFilePath(filePath);
            contentsDTO.setS3FileName(fileName);

            // 전체 내용 수정
            contentsMapper.updateWithFile(contentsDTO);
        }
        contentsMapper.update(contentsDTO);

        //넘어온 추가 썸네일 파일객체가 있을때만 관련 생성 실행


        if(!contentsDTO.getThumbnailFiles().get(0).getOriginalFilename().equals("")) {

            Long conId = contentsMapper.selectContentsId();

            //S3Util START//
            List<String> thumbNames = s3Util.multiUpload(contentsDTO.getThumbnailFiles(), "thumbnail/" + filePath);
            // S3Util END//

            for (int i = 0; i < thumbNames.size(); i++) {
                ThumbnailDTO thumbnailDTO = ThumbnailDTO.builder()
                        .conId(conId)
                        .ofileName(contentsDTO.getThumbnailFiles().get(i).getOriginalFilename())
                        .s3FileName(thumbNames.get(i))
                        .filePath("thumbnail/" + filePath)
                        .build();

                // 경로+파일명 조회
                String keyName= thumbnailMapper.getThumbnailKeyName(contentsDTO.getId());

                //S3Util START//
                // 기존 객체 삭제
                s3Util.delete(keyName);
                // S3Util END//

                // 기존 객체 정보 db 삭제
                thumbnailMapper.delete(contentsDTO.getId());



                // 신규 썸네일 정보 db 추가
                thumbnailMapper.insert(thumbnailDTO);
            }
        }


    }

    public List<ContentsDTO> searchAndPaging(String searchWord, int page, LocalDate startDate, LocalDate endDate) throws IOException {
        Map<String, Integer> pagingParams = pageCalc.pagingList(page);
        List<ContentsDTO> contentslist;

        contentslist = contentsMapper.searchAndPaging(searchWord, pagingParams, startDate, endDate);

        for (ContentsDTO item: contentslist) {
            String keyName =  item.getThumbnailDTO().getFilePath() + item.getThumbnailDTO().getS3FileName();
            String presignedURL = s3Util.createSignedUrlForStringPut(keyName);
            item.getThumbnailDTO().setPresignedURL(presignedURL);
        }

        return contentslist;
    }

    public PageDTO searchPagingParam(int page, LocalDate startDate, LocalDate endDate) {
        int noticeCount;

        if (startDate != null && endDate != null) {
            // 날짜 검색 조건이 있을 경우
            noticeCount = contentsMapper.searchContentsCount(startDate, endDate);

        } else {
            // 날짜 검색 조건이 없을 경우
            noticeCount = contentsMapper.contentsCount();
        }

        return pageCalc.pagingParam(page, noticeCount);
    }

    public int searchNoticeCount(LocalDate startDate, LocalDate endDate) {
        if (startDate != null && endDate != null) {
            return contentsMapper.searchContentsCount(startDate, endDate);

        } else {
            return contentsMapper.contentsCount();
        }
    }
}
