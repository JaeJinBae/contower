package com.webaid.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.webaid.domain.RepairCompanyVO;
import com.webaid.domain.SearchCriteria3;

@Repository
public class RepairCompanyDaoImpl implements RepairCompanyDao {

	private static final String namespace = "com.webaid.mappers.RepairCompanyMapper";

	@Autowired
	private SqlSession session;

	@Override
	public List<RepairCompanyVO> selectAll() {
		return session.selectList(namespace + ".selectAll");
	}

	@Override
	public RepairCompanyVO selectOne(int no) {
		return session.selectOne(namespace + ".selectOne", no);
	}

	@Override
	public List<RepairCompanyVO> listSearch(SearchCriteria3 cri) {
		return session.selectList(namespace + ".listSearch", cri);
	}

	@Override
	public int listSearchCount(SearchCriteria3 cri) {
		return session.selectOne(namespace + ".listSearchCount", cri);
	}

	@Override
	public void register(RepairCompanyVO vo) {
		session.insert(namespace + ".register", vo);
	}

	@Override
	public void update(RepairCompanyVO vo) {
		session.update(namespace + ".update", vo);
	}

	@Override
	public void delete(RepairCompanyVO vo) {
		session.delete(namespace + "delete", vo);
	}

}
