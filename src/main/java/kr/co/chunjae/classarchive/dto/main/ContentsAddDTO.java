package kr.co.chunjae.classarchive.dto.main;

import lombok.*;

import java.sql.Timestamp;
import java.util.List;

@Data
@Builder
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@NoArgsConstructor
public class ContentsAddDTO {
    private Long id;                        // ID
    private Long writerId;                  // 생성자
    private String title;                   // 제목
    private Timestamp regDate;              // 게시일
    private int groupOrder;                 // 노출 순서
    private boolean showFlag;               // 노출 여부
    private boolean deleteFlag;             // 삭제 여부
    private Long modifierId;                // 수정자
    private Timestamp modifyDate;           // 수정일

    private String keywords;                 //키워드

    private List<Long> conId;

    private String conIds;
}
