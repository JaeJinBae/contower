package com.webaid.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.webaid.domain.RoomVO;

@Repository
public class RoomDaoImpl implements RoomDao {

	private static final String namespace = "com.webaid.mappers.RoomMapper";

	@Autowired
	private SqlSession session;

	@Override
	public List<RoomVO> selectAll() {
		return session.selectList(namespace + ".selectAll");
	}

	@Override
	public RoomVO selectOne(int no) {
		return session.selectOne(namespace + ".selectOne", no);
	}

	@Override
	public List<RoomVO> selectByBno(int bno) {
		return session.selectList(namespace + ".selectByBno", bno);
	}

	@Override
	public List<RoomVO> selectByBnoState(RoomVO vo) {
		return session.selectList(namespace + ".selectByBnoState", vo);
	}

	@Override
	public List<RoomVO> selectByDate(RoomVO vo) {
		return session.selectList(namespace + ".selectByDate", vo);
	}

	@Override
	public List<RoomVO> selectByChkIn(RoomVO vo) {
		return session.selectList(namespace + ".selectByChkIn", vo);
	}

	@Override
	public List<RoomVO> selectByChkOut(RoomVO vo) {
		return session.selectList(namespace + ".selectByChkOut", vo);
	}

	@Override
	public void register(RoomVO vo) {
		session.insert(namespace + ".register", vo);
	}

	@Override
	public void update(RoomVO vo) {
		session.update(namespace + ".update", vo);
	}

	@Override
	public void updateRepair(RoomVO vo) {
		session.update(namespace + ".updateRepair", vo);
	}

	@Override
	public void delete(int no) {
		session.delete(namespace + ".delete", no);
	}

}
