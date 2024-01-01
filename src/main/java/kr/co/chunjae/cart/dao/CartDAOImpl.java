package kr.co.chunjae.cart.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import kr.co.chunjae.cart.vo.CartVO;
import kr.co.chunjae.goods.vo.GoodsVO;

@Repository("cartDAO")
public class CartDAOImpl  implements  CartDAO{
	@Autowired
	private SqlSession sqlSession;
	
	public List<CartVO> selectCartList(CartVO cartVO) throws DataAccessException {
		List<CartVO> cartList =(List)sqlSession.selectList("mapper.cart.selectCartList",cartVO);
		return cartList;
	}

	public List<GoodsVO> selectGoodsList(List<CartVO> cartList) throws DataAccessException {
		
		List<GoodsVO> myGoodsList;
		myGoodsList = sqlSession.selectList("mapper.cart.selectGoodsList",cartList);
		return myGoodsList;
	}
	public boolean selectCountInCart(CartVO cartVO) throws DataAccessException {
		String  result =sqlSession.selectOne("mapper.cart.selectCountInCart",cartVO);
		return Boolean.parseBoolean(result);
	}

	public void insertGoodsInCart(CartVO cartVO) throws DataAccessException{
		Long cartId=selectMaxCartId();
		cartVO.setCartId(cartId);
		sqlSession.insert("mapper.cart.insertGoodsInCart",cartVO);
	}
	
	public void updateCartGoodsQty(CartVO cartVO) throws DataAccessException{
		sqlSession.insert("mapper.cart.updateCartGoodsQty",cartVO);
	}
	
	public void deleteCartGoods(Long cartId) throws DataAccessException{
		sqlSession.delete("mapper.cart.deleteCartGoods",cartId);
	}

	private Long selectMaxCartId() throws DataAccessException{
		Long cartId =sqlSession.selectOne("mapper.cart.selectMaxCartId");
		return cartId;
	}

}
