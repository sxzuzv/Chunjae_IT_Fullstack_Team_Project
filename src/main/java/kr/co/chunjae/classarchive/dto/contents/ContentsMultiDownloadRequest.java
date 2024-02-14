package kr.co.chunjae.classarchive.dto.contents;

import lombok.*;

import java.util.List;

/**
 * 콘텐츠 관리 DTO
 */

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PRIVATE)
public class ContentsMultiDownloadRequest {

    List<Long> contentsIdList;
}
