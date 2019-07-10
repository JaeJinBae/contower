package com.webaid.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.webaid.domain.SigunguVO;

@Repository
public class SigunguDaoImpl implements SigunguDao {
	
	private static final String namespace = "com.webaid.mappers.SigunguMapper";
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<SigunguVO> selectAll() {
		return session.selectList(namespace+".selectAll");
	}

	@Override
	public List<SigunguVO> selectBySido(int sido_no) {
		return session.selectList(namespace+".selectBySido", sido_no);
	}

}
