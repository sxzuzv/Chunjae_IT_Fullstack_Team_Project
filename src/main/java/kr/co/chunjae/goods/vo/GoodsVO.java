package kr.co.chunjae.goods.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.Range;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.sql.Date;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class GoodsVO {

    private int goodsId;                    // 상품 번호
    @NotBlank(message = "상품 제목은 필수 입력값입니다")
    @Size(max = 100, message = "100자 이하로 입력하세요")
    private String goodsTitle;                // 상품 제목

    @NotBlank(message = "저자명은 필수 입력값입니다")
    @Size(max = 100, message = "50자 이하로 입력하세요")
    private String goodsWriter;                // 저자명

    @Range(min = 0, max = 1000000000, message = "10자리 이하 양수 값을 입력하세요")
    private int goodsPrice;                // 상품 정가

    @NotBlank(message = "출판사는 필수 입력값입니다")
    @Size(max = 50, message = "50자 이하로 입력하세요")
    private String goodsPublisher;            // 출판사

    private int goodsSalesPrice;            // 상품 판매가

    private Date goodsPublishedDate;        // 상품 출판일

    @Range(min = 0, max = 1000000000, message = "10자리 이하 양수 값을 입력하세요")
    private int goodsTotalPage;            // 상품 총 페이지 수

    @NotBlank(message = "ISBN은 필수 입력값입니다")
    @Pattern(regexp = "ISBN[1-9]+", message = "ISBN345(1~9자)형식으로 입력해주세요")
    private String goodsIsbn;                // ISBN

    @Range(min = 0, max = 1000000000, message = "10자리 이하 양수 값을 입력하세요")
    private int goodsDeliveryPrice;        // 배송비

    private Date goodsDeliveryDate;            // 상품 배송일
    private String goodsFileName;            // 이미지 파일명
    private String goodsStatus;                // 상품 분류

    @Size(max = 50, message = "2000자 이하로 입력하세요")
    private String goodsWriterIntro;        // 저자 소개

    @Size(max = 50, message = "2000자 이하로 입력하세요")
    private String goodsContentsOrder;        // 목차

    @Size(max = 50, message = "2000자 이하로 입력하세요")
    private String goodsIntro;                // 상품 소개

    @Size(max = 50, message = "2000자 이하로 입력하세요")
    private String goodsPublisherComment;    // 출판사평

    @Size(max = 50, message = "2000자 이하로 입력하세요")
    private String goodsRecommendation;        // 상품 추천사
    private Date goodsEnteredDate;        // 상품 입고일
    private int goodsCateMain;  // 상품 중분류



}
