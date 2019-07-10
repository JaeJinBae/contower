package com.webaid.service;

import java.util.List;

import com.webaid.domain.BuildingVO;

public interface BuildingService {
	public List<BuildingVO> selectAll();
	public BuildingVO selectOne(int bno);
	public List<BuildingVO> selectByMno(int mno);
	public List<BuildingVO> selectByOno(int ono);
	public void register(BuildingVO vo);
	public void update(BuildingVO vo);
	public void updateCnt(BuildingVO vo);
	public void updateMphone(BuildingVO vo);
	public void updateOwnerInfo(BuildingVO vo);
	public void delete(int bno);
}
