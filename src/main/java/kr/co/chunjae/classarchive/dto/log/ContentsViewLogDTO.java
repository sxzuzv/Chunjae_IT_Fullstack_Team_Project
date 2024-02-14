package kr.co.chunjae.classarchive.dto.log;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

import java.sql.Timestamp;

/**
 * 콘텐츠 조회 DTO
 */

@Data
@Builder
@AllArgsConstructor(access = AccessLevel.PRIVATE)
public class ContentsViewLogDTO {
    private Long id;                // 로그 ID
    private Long memberId;          // 회원 ID
    private Long conId;             // 콘텐츠 ID
    private Timestamp viewDate;     // 조회 일자
}
