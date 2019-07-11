package com.webaid.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webaid.domain.RoomVO;
import com.webaid.persistence.RoomDao;

@Service
public class RoomServiceImpl implements RoomService {

	@Autowired
	private RoomDao dao;

	@Override
	public List<RoomVO> selectAll() {
		return dao.selectAll();
	}

	@Override
	public RoomVO selectOne(int no) {
		return dao.selectOne(no);
	}

	@Override
	public List<RoomVO> selectByBno(int bno) {
		return dao.selectByBno(bno);
	}

	@Override
	public List<RoomVO> selectByBnoState(RoomVO vo) {
		return dao.selectByBnoState(vo);
	}

	@Override
	public List<RoomVO> selectByDate(RoomVO vo) {
		return dao.selectByDate(vo);
	}

	@Override
	public List<RoomVO> selectByChkIn(RoomVO vo) {
		return dao.selectByChkIn(vo);
	}

	@Override
	public List<RoomVO> selectByChkOut(RoomVO vo) {
		return dao.selectByChkOut(vo);
	}

	@Override
	public void register(RoomVO vo) {
		dao.register(vo);
	}

	@Override
	public void update(RoomVO vo) {
		dao.update(vo);
	}

	@Override
	public void updateRepair(RoomVO vo) {
		dao.updateRepair(vo);
	}

	@Override
	public void delete(int no) {
		dao.delete(no);
	}

}
