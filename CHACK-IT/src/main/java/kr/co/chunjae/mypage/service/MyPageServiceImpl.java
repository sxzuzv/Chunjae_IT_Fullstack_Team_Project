package kr.co.chunjae.mypage.service;

import java.util.List;
import java.util.Map;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.co.chunjae.member.vo.MemberVO;
import kr.co.chunjae.mypage.dao.MyPageDAO;
import kr.co.chunjae.order.vo.OrderVO;

@Service("myPageService")
@Transactional(propagation=Propagation.REQUIRED)
@RequiredArgsConstructor
public class MyPageServiceImpl  implements MyPageService{

	private final MyPageDAO myPageDAO;

	public List<OrderVO> listMyOrderGoods(String member_id) throws Exception{
		return myPageDAO.selectMyOrderGoodsList(member_id);
	}
	
	public List findMyOrderInfo(String order_id) throws Exception{
		return myPageDAO.selectMyOrderInfo(order_id);
	}
	
	public List<OrderVO> listMyOrderHistory(Map dateMap) throws Exception{
		return myPageDAO.selectMyOrderHistoryList(dateMap);
	}
	
	public MemberVO modifyMyInfo(//Map memberMap
								  MemberVO memberVO) throws Exception{
//		 String member_id=(String)memberMap.get("memberId");
//		 myPageDAO.updateMyInfo(memberMap);
		myPageDAO.updateMyInfo(memberVO);
		String member_id=memberVO.getMemberId();
		return myPageDAO.selectMyDetailInfo(member_id);

	}
	
	public void cancelOrder(String order_id) throws Exception{
		myPageDAO.updateMyOrderCancel(order_id);
	}
	public MemberVO myDetailInfo(String member_id) throws Exception{
		return myPageDAO.selectMyDetailInfo(member_id);
	}

	@Override
	public List<OrderVO> cancelOrderHistory(Map dateMap) throws Exception{
		return myPageDAO.cancelOrderHistory(dateMap);

	}

	@Override
	public int pwChange(MemberVO memberVO) {
		return myPageDAO.pwChange(memberVO);
	}
}
