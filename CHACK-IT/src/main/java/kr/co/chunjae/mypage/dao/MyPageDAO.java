package kr.co.chunjae.mypage.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import kr.co.chunjae.member.vo.MemberVO;
import kr.co.chunjae.order.vo.OrderVO;

public interface MyPageDAO {
	public List<OrderVO> selectMyOrderGoodsList(String member_id) throws DataAccessException;
	public List selectMyOrderInfo(String order_id) throws DataAccessException;
	public List<OrderVO> selectMyOrderHistoryList(Map dateMap) throws DataAccessException;
	public void updateMyInfo(//Map memberMap
							 MemberVO memberVO ) throws DataAccessException;
	public MemberVO selectMyDetailInfo(String member_id) throws DataAccessException;
	public void updateMyOrderCancel(String order_id) throws DataAccessException;

    public List<OrderVO> cancelOrderHistory(Map dateMap) throws DataAccessException;

    public int pwChange(MemberVO memberVO);
}
