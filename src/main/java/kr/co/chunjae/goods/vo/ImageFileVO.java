package kr.co.chunjae.goods.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class ImageFileVO {
	private int goodsId;		// 상품 번호
	private int imageId; 		// 이미지 번호
	private String fileName; 	// 이미지 파일명
	private String fileType; 	// 이미지 파일 종류
	private String regId; 		// 등록자 아이디
}
