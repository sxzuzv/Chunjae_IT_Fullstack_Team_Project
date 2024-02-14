package kr.co.chunjae.classarchive.dto.thumbnail;

import lombok.*;
import org.springframework.lang.Nullable;

/**
 * 꾸러미 썸네일 이미지 관리 DTO
 */

@Data
@Builder
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@NoArgsConstructor
public class PackThumbnailDTO {
    private Long id;                    // 이미지 ID
    private Long packId;                // 꾸러미 ID
    private String originalFile;        // 원본 파일명
    private String s3File;              // 업로드 파일명
    private String type;                // 구분 타입
    @Nullable
    private boolean deleteFlag;         // 삭제 여부
    private String filePath;            // 파일 경로
//
//    public void updateIcon(String originalFile, String s3File, String filePath) {
//        this.originalFile = originalFile;
//        this.s3File = s3File;
//        this.filePath = filePath;
//    }
}
