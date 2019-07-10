package com.webaid.service;

import java.util.List;

import com.webaid.domain.EmptyroomVO;
import com.webaid.domain.SearchCriteria;

public interface EmptyroomService {
	public List<EmptyroomVO> selectAll();
	public EmptyroomVO selectOne(int no);
	public List<EmptyroomVO> listSearch(SearchCriteria cri);
	public int listSearchCount(SearchCriteria cri);
	public void register(EmptyroomVO vo);
	public void update(EmptyroomVO vo);
	public void updateByBuiInfo(EmptyroomVO vo);
	public void updateMphone(EmptyroomVO vo);
	public void delete(EmptyroomVO vo);
}
