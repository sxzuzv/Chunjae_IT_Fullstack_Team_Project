package kr.co.chunjae.goods.service;

import kr.co.chunjae.goods.vo.GoodsVO;

import java.util.List;
import java.util.Map;

public interface GoodsService {
	
	public Map<String,List<GoodsVO>> listGoods() throws Exception;
	public Map goodsDetail(String _goodsId) throws Exception;
	
	public List<String> keywordSearch(String keyword) throws Exception;
	public List<GoodsVO> searchGoods(String searchWord) throws Exception;

	public List<GoodsVO> cateGoods(String cateMain);
}
