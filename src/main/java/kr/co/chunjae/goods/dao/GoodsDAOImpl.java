package kr.co.chunjae.goods.dao;

import kr.co.chunjae.goods.vo.CommentVO;
import kr.co.chunjae.goods.vo.GoodsVO;
import kr.co.chunjae.goods.vo.ImageFileVO;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository("goodsDAO")
@RequiredArgsConstructor
public class GoodsDAOImpl  implements GoodsDAO{

	private final SqlSession sqlSession;

	@Override
	public List<GoodsVO> selectGoodsList(String goodsStatus) throws DataAccessException {
		List<GoodsVO> goodsList=(ArrayList)sqlSession.selectList("mapper.goods.selectGoodsList",goodsStatus);
	   return goodsList;	
     
	}
	@Override
	public List<String> selectKeywordSearch(String keyword) throws DataAccessException {
	   List<String> list=(ArrayList)sqlSession.selectList("mapper.goods.selectKeywordSearch",keyword);
	   return list;
	}
	
	@Override
	public ArrayList selectGoodsBySearchWord(String searchWord) throws DataAccessException{
		ArrayList list=(ArrayList)sqlSession.selectList("mapper.goods.selectGoodsBySearchWord",searchWord);
		 return list;
	}

	@Override
	public GoodsVO selectGoodsDetail(String goodsId) throws DataAccessException{
		GoodsVO goodsVO=(GoodsVO)sqlSession.selectOne("mapper.goods.selectGoodsDetail",goodsId);
		return goodsVO;
	}
	
	@Override
	public List<ImageFileVO> selectGoodsDetailImage(String goodsId) throws DataAccessException{
		List<ImageFileVO> imageList=(ArrayList)sqlSession.selectList("mapper.goods.selectGoodsDetailImage",goodsId);
		return imageList;
	}

	@Override
	public int insertWriteComment(CommentVO commentVO) throws DataAccessException {
		return sqlSession.insert("mapper.comment.insertWriteComment",commentVO);
	}

	@Override
	public List selectCommentList(int brdId) throws DataAccessException {
		List<CommentVO> commentList= sqlSession.selectList("mapper.comment.selectCommentList", brdId);
		return commentList;
	}

	@Override
	public List selectGoodsByCateMain(String cateMain) throws DataAccessException {
		ArrayList list=(ArrayList)sqlSession.selectList("mapper.goods.selectGoodsByCateMain",cateMain);
		return list;
	}

}
