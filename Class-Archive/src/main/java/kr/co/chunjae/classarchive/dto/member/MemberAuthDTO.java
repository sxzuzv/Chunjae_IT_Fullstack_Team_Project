package kr.co.chunjae.classarchive.dto.member;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

/**
 * 회원 권한 DTO
 */

@Data
@Builder
@AllArgsConstructor(access = AccessLevel.PRIVATE)
public class MemberAuthDTO {
    private Long id;            // 고유번호
    private Long memberId;      // 회원 ID
    private String auth;        // 접근 권한
}
