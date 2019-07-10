package com.webaid.persistence;

import java.util.List;

import com.webaid.domain.SearchCriteria3;
import com.webaid.domain.TradeVO;

public interface TradeDao {
	public List<TradeVO> selectAll();
	public TradeVO selectOne(int no);
	public List<TradeVO> listSearch(SearchCriteria3 cri);
	public int listSearchCount(SearchCriteria3 cri);
	public void register(TradeVO vo);
	public void update(TradeVO vo);
	public void delete(int no);
}
