package com.webaid.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.webaid.domain.ManagerVO;

@Repository
public class ManagerDaoImpl implements ManagerDao {
	private static final String namespace = "com.webaid.mappers.ManagerMapper";

	@Autowired
	private SqlSession session;

	@Override
	public List<ManagerVO> selectAll() {
		return session.selectList(namespace + ".selectAll");
	}

	@Override
	public ManagerVO selectOne(int mno) {
		return session.selectOne(namespace + ".selectOne", mno);
	}

	@Override
	public ManagerVO selectById(String id) {
		return session.selectOne(namespace + ".selectById", id);
	}

	@Override
	public void register(ManagerVO vo) {
		session.insert(namespace + ".register", vo);
	}

	@Override
	public void update(ManagerVO vo) {
		session.update(namespace + ".update", vo);
	}

	@Override
	public void delete(int mno) {
		session.delete(namespace + ".delete", mno);
	}

}
