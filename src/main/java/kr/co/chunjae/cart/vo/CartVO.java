package kr.co.chunjae.cart.vo;

import lombok.*;
import org.springframework.stereotype.Component;

@Getter
@Setter
@ToString
@Component("cartVO")
public class CartVO {
	private int cartId;
	private int goodsId;
	private String memberId;
	private int cartGoodsQty;
	private String creDate;

}
