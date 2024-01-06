package kr.co.chunjae.cart.vo;

import lombok.*;
import org.springframework.stereotype.Component;

import java.util.Date;

@Getter
@Setter
@ToString
@Component("cartVO")
public class CartVO {
	private int cartId;			// 장바구니 번호
	private int goodsId;		// 상품 번호
	private String memberId;	// 회원 아이디
	private int cartGoodsQty;	// 상품 개수
	private Date creDate;		// 상품 등록일

}
