package com.webaid.persistence;

import java.util.List;

import com.webaid.domain.RepairCompanyVO;
import com.webaid.domain.SearchCriteria3;

public interface RepairCompanyDao {
	public List<RepairCompanyVO> selectAll();
	public RepairCompanyVO selectOne(int no);
	public List<RepairCompanyVO> listSearch(SearchCriteria3 cri);
	public int listSearchCount(SearchCriteria3 cri);
	public void register(RepairCompanyVO vo);
	public void update(RepairCompanyVO vo);
	public void delete(RepairCompanyVO vo);
}
