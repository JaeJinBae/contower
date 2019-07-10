package com.webaid.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webaid.domain.EmptyroomVO;
import com.webaid.domain.SearchCriteria;
import com.webaid.persistence.EmptyroomDao;

@Service
public class EmptyroomServiceImpl implements EmptyroomService {

	@Autowired
	private EmptyroomDao dao;

	@Override
	public List<EmptyroomVO> selectAll() {
		return dao.selectAll();
	}

	@Override
	public EmptyroomVO selectOne(int no) {
		return dao.selectOne(no);
	}

	@Override
	public List<EmptyroomVO> listSearch(SearchCriteria cri) {
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) {
		return dao.listSearchCount(cri);
	}

	@Override
	public void register(EmptyroomVO vo) {
		dao.register(vo);
	}

	@Override
	public void update(EmptyroomVO vo) {
		dao.update(vo);
	}

	@Override
	public void updateByBuiInfo(EmptyroomVO vo) {
		dao.updateByBuiInfo(vo);
	}

	@Override
	public void delete(EmptyroomVO vo) {
		dao.delete(vo);
	}

	@Override
	public void updateMphone(EmptyroomVO vo) {
		dao.updateMphone(vo);
	}

}
