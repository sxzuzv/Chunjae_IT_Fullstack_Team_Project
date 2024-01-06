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
	private int goodsId;
	private int imageId;
	private String fileName;
	private String fileType;
	private String regId;
}
