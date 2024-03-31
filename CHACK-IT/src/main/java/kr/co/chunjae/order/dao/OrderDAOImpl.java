package kr.co.chunjae.order.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import kr.co.chunjae.cart.vo.CartVO;
import kr.co.chunjae.goods.vo.GoodsVO;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import kr.co.chunjae.order.vo.OrderVO;

@Repository("orderDAO")
@RequiredArgsConstructor
public class OrderDAOImpl implements OrderDAO {

	private final SqlSession sqlSession;
	
	public List<OrderVO> listMyOrderGoods(OrderVO orderVO) throws DataAccessException{
		List<OrderVO> orderGoodsList=new ArrayList<OrderVO>();
		orderGoodsList=(ArrayList)sqlSession.selectList("mapper.order.selectMyOrderList",orderVO);
		return orderGoodsList;
	}
	
	public void insertNewOrder(List<OrderVO> myOrderList) throws DataAccessException{
		int orderId = selectOrderID();
		for(int i=0; i<myOrderList.size();i++){
			OrderVO orderVO =(OrderVO)myOrderList.get(i);
			orderVO.setOrderId(orderId);
			sqlSession.insert("mapper.order.insertNewOrder",orderVO);
		}
		
	}	
	
	public OrderVO findMyOrder(String order_id) throws DataAccessException{
		OrderVO orderVO=(OrderVO)sqlSession.selectOne("mapper.order.selectMyOrder",order_id);		
		return orderVO;
	}
	
	public void removeGoodsFromCart(OrderVO orderVO)throws DataAccessException{
		sqlSession.delete("mapper.order.deleteGoodsFromCart",orderVO);
	}
	
	public void removeGoodsFromCart(List<OrderVO> myOrderList)throws DataAccessException{
		for(int i=0; i<myOrderList.size();i++){
			OrderVO orderVO =(OrderVO)myOrderList.get(i);
			sqlSession.delete("mapper.order.deleteGoodsFromCart",orderVO);		
		}
	}

	private int selectOrderID() throws DataAccessException{
		return sqlSession.selectOne("mapper.order.selectOrderID");

	}

	// 상품 배송료
	public List<GoodsVO> goodsDeliveryPrice(List<OrderVO> myOrderList) throws DataAccessException {

		List<GoodsVO> goodsDeliveryPrice;
		goodsDeliveryPrice = sqlSession.selectList("mapper.order.selectGoodsDeliveryPrice",myOrderList);

		return goodsDeliveryPrice;
	}
}

