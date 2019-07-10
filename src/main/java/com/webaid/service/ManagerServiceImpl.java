package com.webaid.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webaid.domain.ManagerVO;
import com.webaid.persistence.ManagerDao;

@Service
public class ManagerServiceImpl implements ManagerService {

	@Autowired
	private ManagerDao dao;

	@Override
	public List<ManagerVO> selectAll() {
		return dao.selectAll();
	}

	@Override
	public ManagerVO selectOne(int mno) {
		return dao.selectOne(mno);
	}

	@Override
	public ManagerVO selectById(String id) {
		return dao.selectById(id);
	}

	@Override
	public void delete(int mno) {
		dao.delete(mno);
	}

	@Override
	public void register(ManagerVO vo) {
		dao.register(vo);
	}

	@Override
	public void update(ManagerVO vo) {
		dao.update(vo);
	}

}
