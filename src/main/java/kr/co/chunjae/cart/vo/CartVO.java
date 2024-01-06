package kr.co.chunjae.cart.vo;

import lombok.*;
import org.springframework.stereotype.Component;

import java.util.Date;

@Getter
@Setter
@ToString
@Component("cartVO")
public class CartVO {
	private int cartId;
	private int goodsId;
	private String memberId;
	private int cartGoodsQty;
	private Date creDate;

}
