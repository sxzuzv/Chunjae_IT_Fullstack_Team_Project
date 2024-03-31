package kr.co.chunjae.classarchive.dto.main;

import lombok.*;

import java.sql.Timestamp;

@Data
@Builder
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@NoArgsConstructor
public class ContentsListDTO {
    private Long id;                        // ID
    private Long writerId;                  // 생성자
    private String memberId;                //멤버아이디
    private String title;                   // 제목
    private Timestamp regDate;              // 게시일
    private int groupOrder;                 // 노출 순서
    private boolean showFlag;               // 노출 여부
    private boolean deleteFlag;             // 삭제 여부
    private Long modifierId;                // 수정자
    private Timestamp modifyDate;           // 수정일

}
