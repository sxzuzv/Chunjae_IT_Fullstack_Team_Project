package kr.co.chunjae.mypage.service;

import java.util.List;
import java.util.Map;

import kr.co.chunjae.member.vo.MemberVO;
import kr.co.chunjae.order.vo.OrderVO;

public interface MyPageService{
	public List<OrderVO> listMyOrderGoods(String member_id) throws Exception;
	public List findMyOrderInfo(String order_id) throws Exception;
	public List<OrderVO> listMyOrderHistory(Map dateMap) throws Exception;
	public MemberVO  modifyMyInfo(//Map
								  MemberVO memberVO) throws Exception;
	public void cancelOrder(String order_id) throws Exception;
	public MemberVO myDetailInfo(String member_id) throws Exception;
	public List<OrderVO> cancelOrderHistory(Map dateMap) throws Exception;

    public int pwChange(MemberVO memberVO);
}
