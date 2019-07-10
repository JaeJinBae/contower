package com.webaid.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.webaid.domain.EmptyroomVO;
import com.webaid.domain.SearchCriteria;

@Repository
public class EmptyroomDaoImpl implements EmptyroomDao {

	private static final String namespace = "com.webaid.mappers.EmptyroomMapper";

	@Autowired
	private SqlSession session;

	@Override
	public List<EmptyroomVO> selectAll() {
		return session.selectList(namespace + ".selectAll");
	}

	@Override
	public EmptyroomVO selectOne(int no) {
		return session.selectOne(namespace + ".selectOne", no);
	}

	@Override
	public List<EmptyroomVO> listSearch(SearchCriteria cri) {
		return session.selectList(namespace + ".listSearch", cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) {
		return session.selectOne(namespace + ".listSearchCount", cri);
	}

	@Override
	public void register(EmptyroomVO vo) {
		session.insert(namespace + ".register", vo);
	}

	@Override
	public void update(EmptyroomVO vo) {
		session.update(namespace + ".update", vo);
	}

	@Override
	public void updateByBuiInfo(EmptyroomVO vo) {
		session.update(namespace + ".updateByBuiInfo", vo);
	}

	@Override
	public void delete(EmptyroomVO vo) {
		session.delete(namespace + ".delete", vo);
	}

	@Override
	public void updateMphone(EmptyroomVO vo) {
		session.update(namespace+".updateMphone", vo);
	}

}
