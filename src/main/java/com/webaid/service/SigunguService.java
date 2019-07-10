package com.webaid.service;

import java.util.List;

import com.webaid.domain.SigunguVO;

public interface SigunguService {
	public List<SigunguVO> selectAll();
	public List<SigunguVO> selectBySido(int sido_no);
}
