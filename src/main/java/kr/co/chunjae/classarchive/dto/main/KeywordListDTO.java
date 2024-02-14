package kr.co.chunjae.classarchive.dto.main;

import lombok.*;

import java.sql.Timestamp;
import java.util.List;

@Data
@Builder
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@NoArgsConstructor
public class KeywordListDTO {
    private Long id;
    private boolean showFlag;
    private String keywords;
    private boolean deleteFlag;
    private Timestamp regDate;
    private Long writerId;
    private int keywordOrder;
    private String keyword;
    private String memberId;
}
