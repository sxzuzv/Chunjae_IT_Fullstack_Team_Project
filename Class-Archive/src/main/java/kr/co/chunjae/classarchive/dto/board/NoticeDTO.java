package kr.co.chunjae.classarchive.dto.board;

import lombok.*;

import java.sql.Timestamp;

/**
 * 공지사항 DTO
 */

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PRIVATE)
public class NoticeDTO {
    private Long id;                    // ID
    private Long writerId;              // 작성자
    private String title;               // 제목
    private String content;             // 내용
    private Timestamp regDate;          // 작성일
    private String originalFile;        // 첨부 파일명
    private String s3File;              // 업로드 파일명
    private Boolean deleteFlag;         // 삭제 여부
    private Boolean fixFlag;            // 고정 여부
    private Long modifierId;            // 수정자
    private Timestamp modifyDate;       // 수정일
}
