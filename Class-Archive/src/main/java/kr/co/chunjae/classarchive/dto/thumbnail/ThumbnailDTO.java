package kr.co.chunjae.classarchive.dto.thumbnail;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

import java.net.URL;

/**
 * 썸네일 이미지 관리 DTO
 */

@Data
@Builder
@AllArgsConstructor(access = AccessLevel.PRIVATE)
public class ThumbnailDTO {
    private Long id;                    // 이미지 ID
    private Long conId;                 // 콘텐츠 ID
    private String ofileName;        // 원본 파일명
    private String s3FileName;              // 업로드 파일명
    private boolean deleteFlag;         // 삭제 여부
    private String filePath;            // 파일 경로
    private String presignedURL;         //s3 presigned URL
}
