package com.webaid.persistence;

import java.util.List;

import com.webaid.domain.RoomVO;

public interface RoomDao {
	public List<RoomVO> selectAll();
	public RoomVO selectOne(int no);
	public List<RoomVO> selectByBno(int bno);
	public List<RoomVO> selectByBnoState(RoomVO vo);
	public List<RoomVO> selectByDate(RoomVO vo);
	public List<RoomVO> selectByChkIn(RoomVO vo);
	public List<RoomVO> selectByChkOut(RoomVO vo);
	public void register(RoomVO vo);
	public void update(RoomVO vo);
	public void delete(int no);
}
