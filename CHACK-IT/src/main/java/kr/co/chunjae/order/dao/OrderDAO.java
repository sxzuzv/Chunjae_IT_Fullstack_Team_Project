package kr.co.chunjae.order.dao;

import java.util.List;
import java.util.Map;

import kr.co.chunjae.goods.vo.GoodsVO;
import org.springframework.dao.DataAccessException;

import kr.co.chunjae.order.vo.OrderVO;

public interface OrderDAO {
    public List<OrderVO> listMyOrderGoods(OrderVO orderBean) throws DataAccessException;

    public void insertNewOrder(List<OrderVO> myOrderList) throws DataAccessException;

    public OrderVO findMyOrder(String order_id) throws DataAccessException;

    public void removeGoodsFromCart(List<OrderVO> myOrderList) throws DataAccessException;

    public List<GoodsVO> goodsDeliveryPrice(List<OrderVO> myOrderList) throws DataAccessException;
}
