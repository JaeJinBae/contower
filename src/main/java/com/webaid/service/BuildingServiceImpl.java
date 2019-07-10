package com.webaid.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webaid.domain.BuildingVO;
import com.webaid.persistence.BuildingDao;

@Service
public class BuildingServiceImpl implements BuildingService {

	@Autowired
	private BuildingDao dao;

	@Override
	public List<BuildingVO> selectAll() {
		return dao.selectAll();
	}

	@Override
	public BuildingVO selectOne(int bno) {
		return dao.selectOne(bno);
	}

	@Override
	public List<BuildingVO> selectByMno(int mno) {
		return dao.selectByMno(mno);
	}

	@Override
	public List<BuildingVO> selectByOno(int ono) {
		return dao.selectByOno(ono);
	}

	@Override
	public void register(BuildingVO vo) {
		System.out.println(vo);
		dao.register(vo);
	}

	@Override
	public void update(BuildingVO vo) {
		dao.update(vo);
	}

	@Override
	public void updateCnt(BuildingVO vo) {
		dao.updateCnt(vo);
	}

	@Override
	public void updateMphone(BuildingVO vo) {
		dao.updateMphone(vo);
	}

	@Override
	public void updateOwnerInfo(BuildingVO vo) {
		dao.updateOwnerInfo(vo);
	}

	@Override
	public void delete(int bno) {
		dao.delete(bno);
	}

}
