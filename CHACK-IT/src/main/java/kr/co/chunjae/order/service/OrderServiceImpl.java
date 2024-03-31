package kr.co.chunjae.order.service;

import java.util.List;
import java.util.Map;

import kr.co.chunjae.goods.vo.GoodsVO;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.annotation.Propagation;
import kr.co.chunjae.order.dao.OrderDAO;
import kr.co.chunjae.order.vo.OrderVO;


@Service("orderService")
@Transactional(propagation=Propagation.REQUIRED)
@RequiredArgsConstructor
public class OrderServiceImpl implements OrderService {

	private final OrderDAO orderDAO;
	
	public List<OrderVO> listMyOrderGoods(OrderVO orderVO) throws Exception{
		List<OrderVO> orderGoodsList;
		orderGoodsList=orderDAO.listMyOrderGoods(orderVO);
		return orderGoodsList;
	}
	
	public void addNewOrder(List<OrderVO> myOrderList) throws Exception{
		orderDAO.insertNewOrder(myOrderList);
		//카트에서 주문 상품 제거한다.
		orderDAO.removeGoodsFromCart(myOrderList);
	}	
	
	public OrderVO findMyOrder(String order_id) throws Exception{
		return orderDAO.findMyOrder(order_id);
	}

	public List<GoodsVO> goodsDeliveryPrice(List<OrderVO> myOrderList) throws DataAccessException {
		return orderDAO.goodsDeliveryPrice(myOrderList);
	}


}
