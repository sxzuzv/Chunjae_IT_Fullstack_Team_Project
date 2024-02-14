package kr.co.chunjae.classarchive.dto.icon;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

/**
 * 아이콘 꾸러미 상세 DTO
 */

@Data
@Builder
@AllArgsConstructor(access = AccessLevel.PRIVATE)
public class IconPackageDetailDTO {
    private Long id;            // ID
    private Long packId;        // 꾸러미 ID
    private Long conId;         // 아이콘 콘텐츠 ID
}
