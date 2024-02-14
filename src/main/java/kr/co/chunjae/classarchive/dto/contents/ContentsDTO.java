package kr.co.chunjae.classarchive.dto.contents;

import jakarta.annotation.Nullable;
import kr.co.chunjae.classarchive.dto.thumbnail.ThumbnailDTO;
import lombok.*;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

/**
 * 콘텐츠 관리 DTO
 */

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PRIVATE)
public class ContentsDTO {
    private Long id;                    // ID
    private String cateId;              // 카테고리 ID
    private String category;              // 카테고리
    private Long writerId;              // 작성자
    private Long typeId;                // 유형
    private String title;               // 제목
    private Timestamp regDate;          // 생성일
    private String keyword;             // 키워드
    private String ofileName;        // 원본 파일명
    private String s3FileName;              // 업로드 파일명
    private String filePath;            // 파일 경로
    private boolean showFlag;           // 노출 여부
    private boolean freeFlag;           // 유무료 여부
    @Nullable
    private boolean deleteFlag;         // 삭제 여부
    private String reference;           // 출처
    private String referenceUrl;        // 출처 - url
    private String referenceEtc;        // 출처 - 기타
    private Long modifierId;            // 수정자
    private Timestamp modifyDate;       // 수정일

    private MultipartFile contentsFile; // 원본 파일
    private List<MultipartFile> thumbnailFiles; // 썸네일 파일 리스트
    private String typeName; //컨텐츠 타입명

    private ThumbnailDTO thumbnailDTO; //썸네일 join용
    private String presignedURL;

}
