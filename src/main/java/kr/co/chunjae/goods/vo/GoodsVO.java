package kr.co.chunjae.goods.vo;

import lombok.*;


import java.sql.Date;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class GoodsVO {
	private int goodsId;
	private String goodsTitle;
	private String goodsWriter;
	private int    goodsPrice;
	private String goodsPublisher;
	private int    goodsSalesPrice;
	private Date    goodsPublishedDate;
	private int    goodsTotalPage;
	private String goodsIsbn;
	private String goodsDeliveryPrice;
	private Date goodsDeliveryDate;
	private String goodsFileName;
	private String goodsStatus;
	private String goodsWriterIntro;
	private String goodsContentsOrder;
	private String goodsIntro;
	private String goodsPublisherComment;
	private String goodsRecommendation;
	private Date   goodsEnteredDate;





}
