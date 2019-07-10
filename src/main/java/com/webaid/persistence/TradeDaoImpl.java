package com.webaid.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.webaid.domain.SearchCriteria3;
import com.webaid.domain.TradeVO;

@Repository
public class TradeDaoImpl implements TradeDao {

	private static final String namespace = "com.webaid.mappers.TradeMapper";
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<TradeVO> selectAll() {
		return session.selectList(namespace+".selectAll");
	}

	@Override
	public TradeVO selectOne(int no) {
		return session.selectOne(namespace+".selectOne", no);
	}

	@Override
	public List<TradeVO> listSearch(SearchCriteria3 cri) {
		return session.selectList(namespace+".listSearch", cri);
	}

	@Override
	public int listSearchCount(SearchCriteria3 cri) {
		return session.selectOne(namespace+".listSearchCount", cri);
	}

	@Override
	public void register(TradeVO vo) {
		session.insert(namespace+".register", vo);
	}

	@Override
	public void update(TradeVO vo) {
		session.update(namespace+".update", vo);
	}

	@Override
	public void delete(int no) {
		session.delete(namespace+".delete", no);
	}

}
