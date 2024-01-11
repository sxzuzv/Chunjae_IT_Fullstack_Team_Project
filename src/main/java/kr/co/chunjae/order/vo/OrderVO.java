package kr.co.chunjae.order.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.stereotype.Component;

import java.sql.Date;


@Getter
@Setter
@Component("orderVO")
@ToString
public class OrderVO {
	private int orderSeqNum;			// 주문 상품 일련 번호
	private String memberId;			// 주문자 아이디
	private int orderId;				// 주문 번호
	private int goodsId;				// 상품 번호
	private String goodsTitle;			// 상품 이름
	private int goodsSalesPrice;		// 상품 판매 가격
	private int totalGoodsPrice;		// 총 상품 가격
	private int cartGoodsQty; 			// 장바구니에 담긴 제품 수
	private int orderGoodsQty; 			// 최종 주문  제품 수
	private String ordererName;			// 주문자 이름
	private String receiverName;		// 수령자 이름
	private String receiverHp1;			// 수령자 휴대폰 번호 : 010
	private String receiverHp2;			// 수령자 휴대폰 번호 : 중간 번호 4자리
	private String receiverHp3;			// 수령자 휴대폰 번호 : 마지막 번호 4자리
	private String deliveryAddress;		// 배송 주소
	private String deliveryMessage;		// 부재 시 전달 메시지
	private String deliveryMethod;		// 배송 방법
	private String giftWrapping;		// 상품 포장 여부
	private String payMethod;			// 결제 방법
	private String cardComName;			// 결제 카드 회사명
	private String cardPayMonth;		// 할부 개월 수
	private String payOrdererHpNum; 	// 휴대폰 결제 전화번호
	private Date payOrderTime;			// 결제 시간
	private String deliveryState;  		// 상품 배송 상태
	private String finalTotalPrice;		// 총 구매 가격 (상품 가격 + 배송비)
	private int goodsQty;				// 주문 수량
	private String goodsFileName;		// 상품 이미지 파일 이름
	private String ordererHp;			// 주문자 휴대폰 번호
	private int goodsDeliveryPrice;  // 상품 배송료
}
