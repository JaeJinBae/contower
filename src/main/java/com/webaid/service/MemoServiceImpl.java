package com.webaid.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webaid.domain.MemoVO;
import com.webaid.persistence.MemoDao;

@Service
public class MemoServiceImpl implements MemoService {

	@Autowired
	private MemoDao dao;
	
	@Override
	public List<MemoVO> selectAll() {
		return dao.selectAll();
	}

	@Override
	public MemoVO selectOne(int no) {
		return dao.selectOne(no);
	}

	@Override
	public List<MemoVO> selectByMnoDate(MemoVO vo) {
		return dao.selectByMnoDate(vo);
	}

	@Override
	public void register(MemoVO vo) {
		dao.register(vo);
	}

	@Override
	public void update(MemoVO vo) {
		dao.update(vo);
	}

	@Override
	public void delete(int no) {
		dao.delete(no);
	}

}
