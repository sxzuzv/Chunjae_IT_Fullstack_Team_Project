package kr.co.chunjae.classarchive.dto.icon;

import kr.co.chunjae.classarchive.dto.thumbnail.PackThumbnailDTO;
import lombok.*;
import org.springframework.lang.Nullable;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Timestamp;
import java.util.List;

/**
 * 아이콘 꾸러미 관리 DTO
 */

@Data
@Builder
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@NoArgsConstructor
public class IconPackageDTO {
    private Long id;                    // ID
    private Long writerId;              // 작성자
    private String title;               // 제목
    private Timestamp regDate;          // 생성일
    private String keyword;             // 아이콘 검색 키워드
    @Nullable
    private boolean showFlag;           // 노출 여부
//    private boolean freeFlag;         // 유무료 여부
    @Nullable
    private boolean deleteFlag;         // 삭제 여부
    private Long modifierId;            // 수정자
    private Timestamp modifyDate;       // 수정일
    private String memberId;            // 작성자 이름
    private List<Long> iconId;
    private String iconIds;
    private String iconTitle;

    private PackThumbnailDTO packThumbnailDTO;
    private MultipartFile thumbnailFile;
    private String originalFile;
}
