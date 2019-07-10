package com.webaid.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webaid.domain.SigunguVO;
import com.webaid.persistence.SigunguDao;

@Service
public class SigunguServiceImpl implements SigunguService {

	@Autowired
	private SigunguDao dao;
	
	@Override
	public List<SigunguVO> selectAll() {
		return dao.selectAll();
	}

	@Override
	public List<SigunguVO> selectBySido(int sido_no) {
		return dao.selectBySido(sido_no);
	}

}
