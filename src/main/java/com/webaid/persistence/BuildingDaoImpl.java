package com.webaid.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.webaid.domain.BuildingVO;

@Repository
public class BuildingDaoImpl implements BuildingDao {

	private static final String namespace = "com.webaid.mappers.BuildingMapper";

	@Autowired
	private SqlSession session;

	@Override
	public List<BuildingVO> selectAll() {
		return session.selectList(namespace + ".selectAll");
	}

	@Override
	public BuildingVO selectOne(int bno) {
		return session.selectOne(namespace + ".selectOne", bno);
	}

	@Override
	public List<BuildingVO> selectByMno(int mno) {
		return session.selectList(namespace + ".selectByMno", mno);
	}

	@Override
	public List<BuildingVO> selectByOno(int ono) {
		return session.selectList(namespace + ".selectByOno", ono);
	}

	@Override
	public void register(BuildingVO vo) {
		session.insert(namespace + ".register", vo);
	}

	@Override
	public void update(BuildingVO vo) {
		session.update(namespace + ".update", vo);
	}

	@Override
	public void updateCnt(BuildingVO vo) {
		session.update(namespace + ".updateCnt", vo);
	}

	@Override
	public void updateMphone(BuildingVO vo) {
		session.update(namespace + ".updateMphone", vo);
	}

	@Override
	public void updateOwnerInfo(BuildingVO vo) {
		session.update(namespace + ".updateOwnerInfo", vo);
	}

	@Override
	public void delete(int bno) {
		session.delete(namespace + ".delete", bno);
	}

}
