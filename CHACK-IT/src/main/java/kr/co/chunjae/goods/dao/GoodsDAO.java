package kr.co.chunjae.goods.dao;

import kr.co.chunjae.goods.vo.CommentVO;
import kr.co.chunjae.goods.vo.GoodsVO;
import kr.co.chunjae.goods.vo.ImageFileVO;
import org.springframework.dao.DataAccessException;

import java.util.List;

public interface GoodsDAO {
	public List<GoodsVO> selectGoodsList(String goodsStatus) throws DataAccessException;
	public List<String> selectKeywordSearch(String keyword) throws DataAccessException;
	public GoodsVO selectGoodsDetail(String goodsId) throws DataAccessException;
	public List<ImageFileVO> selectGoodsDetailImage(String goodsId) throws DataAccessException;
	public List<GoodsVO> selectGoodsBySearchWord(String searchWord) throws DataAccessException;
	public int insertWriteComment(CommentVO commentVO) throws DataAccessException;
	public List selectCommentList(int brdId) throws DataAccessException;
	public List selectGoodsByCateMain(String cateMain) throws DataAccessException;
}
