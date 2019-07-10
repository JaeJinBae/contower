package com.webaid.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webaid.domain.SearchCriteria3;
import com.webaid.domain.TradeVO;
import com.webaid.persistence.TradeDao;

@Service
public class TradeServiceImpl implements TradeService {

	@Autowired
	private TradeDao dao;
	
	@Override
	public List<TradeVO> selectAll() {
		return dao.selectAll();
	}

	@Override
	public TradeVO selectOne(int no) {
		return dao.selectOne(no);
	}

	@Override
	public List<TradeVO> listSearch(SearchCriteria3 cri) {
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria3 cri) {
		return dao.listSearchCount(cri);
	}

	@Override
	public void register(TradeVO vo) {
		dao.register(vo);
	}

	@Override
	public void update(TradeVO vo) {
		dao.update(vo);
	}

	@Override
	public void delete(int no) {
		dao.delete(no);
	}

}
