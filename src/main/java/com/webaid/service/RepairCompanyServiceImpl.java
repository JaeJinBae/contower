package com.webaid.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webaid.domain.RepairCompanyVO;
import com.webaid.domain.SearchCriteria3;
import com.webaid.persistence.RepairCompanyDao;

@Service
public class RepairCompanyServiceImpl implements RepairCompanyService {

	@Autowired
	private RepairCompanyDao dao;
	
	@Override
	public List<RepairCompanyVO> selectAll() {
		return dao.selectAll();
	}

	@Override
	public RepairCompanyVO selectOne(int no) {
		return dao.selectOne(no);
	}

	@Override
	public List<RepairCompanyVO> listSearch(SearchCriteria3 cri) {
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria3 cri) {
		return dao.listSearchCount(cri);
	}

	@Override
	public void register(RepairCompanyVO vo) {
		dao.register(vo);
	}

	@Override
	public void update(RepairCompanyVO vo) {
		dao.update(vo);
	}

	@Override
	public void delete(RepairCompanyVO vo) {
		dao.delete(vo);
	}

}
