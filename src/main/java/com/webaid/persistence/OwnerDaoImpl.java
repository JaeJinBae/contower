package com.webaid.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.webaid.domain.OwnerVO;

@Repository
public class OwnerDaoImpl implements OwnerDao {

	private static final String namespace = "com.webaid.mappers.OwnerMapper";

	@Autowired
	private SqlSession session;

	@Override
	public List<OwnerVO> selectAll() {
		return session.selectList(namespace + ".selectAll");
	}

	@Override
	public OwnerVO selectOne(int ono) {
		return session.selectOne(namespace + ".selectOne", ono);
	}

	@Override
	public OwnerVO selectExistChk(OwnerVO vo) {
		return session.selectOne(namespace + ".selectExistChk", vo);
	}

	@Override
	public OwnerVO selectById(String id) {
		return session.selectOne(namespace + ".selectById", id);
	}

	@Override
	public void register(OwnerVO vo) {
		session.insert(namespace + ".register", vo);
	}

	@Override
	public void update(OwnerVO vo) {
		session.update(namespace + ".update", vo);
	}

	@Override
	public void delete(int ono) {
		session.delete(namespace + ".delete", ono);
	}

}
