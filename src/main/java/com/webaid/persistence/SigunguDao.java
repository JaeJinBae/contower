package com.webaid.persistence;

import java.util.List;

import com.webaid.domain.SigunguVO;

public interface SigunguDao {
	public List<SigunguVO> selectAll();
	public List<SigunguVO> selectBySido(int sido_no);
}
