package com.webaid.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.webaid.domain.MemoVO;

@Repository
public class MemoDaoImpl implements MemoDao {

	private static final String namespace = "com.webaid.mappers.MemoMapper";

	@Autowired
	private SqlSession session;
	
	@Override
	public List<MemoVO> selectAll() {
		return session.selectList(namespace+".selectAll");
	}

	@Override
	public MemoVO selectOne(int no) {
		return session.selectOne(namespace+".selectOne", no);
	}

	@Override
	public List<MemoVO> selectByMnoDate(MemoVO vo) {
		return session.selectList(namespace+".selectByMnoDate", vo);
	}

	@Override
	public void register(MemoVO vo) {
		session.insert(namespace+".register", vo);
	}

	@Override
	public void update(MemoVO vo) {
		session.update(namespace+".update", vo);
	}

	@Override
	public void delete(int no) {
		session.delete(namespace+".delete", no);
	}

}
