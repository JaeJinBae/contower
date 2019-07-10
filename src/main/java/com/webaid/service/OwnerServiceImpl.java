package com.webaid.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webaid.domain.OwnerVO;
import com.webaid.persistence.OwnerDao;

@Service
public class OwnerServiceImpl implements OwnerService {

	@Autowired
	private OwnerDao dao;

	@Override
	public List<OwnerVO> selectAll() {
		return dao.selectAll();
	}

	@Override
	public OwnerVO selectOne(int ono) {
		return dao.selectOne(ono);
	}

	@Override
	public OwnerVO selectExistChk(OwnerVO vo) {
		return dao.selectExistChk(vo);
	}

	@Override
	public OwnerVO selectById(String id) {
		return dao.selectById(id);
	}

	@Override
	public void register(OwnerVO vo) {
		dao.register(vo);
	}

	@Override
	public void update(OwnerVO vo) {
		dao.update(vo);
	}

	@Override
	public void delete(int ono) {
		dao.delete(ono);
	}

}
