package kr.co.chunjae.order.service;

import java.util.List;
import java.util.Map;

import kr.co.chunjae.goods.vo.GoodsVO;
import kr.co.chunjae.order.vo.OrderVO;
import org.springframework.dao.DataAccessException;

public interface OrderService {
	public List<OrderVO> listMyOrderGoods(OrderVO orderVO) throws Exception;
	public void addNewOrder(List<OrderVO> myOrderList) throws Exception;
	public OrderVO findMyOrder(String order_id) throws Exception;


	public List<GoodsVO> goodsDeliveryPrice(List<OrderVO> myOrderList) throws DataAccessException;
}
