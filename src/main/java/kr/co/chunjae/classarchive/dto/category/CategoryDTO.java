package kr.co.chunjae.classarchive.dto.category;

import lombok.*;
import java.util.List;

/**
 * 카테고리 관리 DTO
 */

@Getter
@Setter
@NoArgsConstructor
@Builder
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@ToString
public class CategoryDTO {
    private Long id; // 고유번호
    private int cateId;
    private int parentId;         // 부모 카테고리 ID
    private String name;             // 카테고리 이름
    private boolean showFlag;        // 노출 여부
    private int depths; // 뎁스
    private int seq; // 같은 뎁스 내 순서

    private String parentName;
    private List<CategoryDTO> subcategories;
    /* 필수 파라미터 빌더 메서드 구현 (필요 시 사용) */
//    public static CategoryDTOBuilder builder(long categoryId, int categoryCode) {
//        // 빌더 파라미터 검증 (필수 파라미터 값의 세팅이 완료됐는지 판단한다.)
//        if (categoryId == 0 || categoryCode == 0) {
//            throw new IllegalArgumentException("필수 파라미터 누락!");
//        }
//        // 필수 파라미터를 미리 빌드해둔 빌더 객체를 반환한다. (지연 빌더 원리)
//        return new CategoryDTOBuilder().categoryId(categoryId).categoryCode(categoryCode);
//    }
}