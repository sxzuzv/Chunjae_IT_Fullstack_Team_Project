package kr.co.chunjae.classarchive.dto.log;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

import java.sql.Timestamp;

/**
 * 방문 로그 DTO
 */

@Data
@Builder
@AllArgsConstructor(access = AccessLevel.PRIVATE)
public class AccessLogDTO {
    private Long id;                    // 로그 ID
    private Long memberId;              // 회원 ID
    private Timestamp accessDate;       // 방문 일자
}
