package com.webaid.persistence;

import java.util.List;

import com.webaid.domain.MonthlyRentRecordVO;

public interface MonthlyRentRecordDao {
	public List<MonthlyRentRecordVO> selectAll();
	public MonthlyRentRecordVO selectOne(int no);
	public List<MonthlyRentRecordVO> selectByBnoYear(MonthlyRentRecordVO vo);
	public void register(MonthlyRentRecordVO vo);
	public void update1(MonthlyRentRecordVO vo);
	public void update2(MonthlyRentRecordVO vo);
	public void update3(MonthlyRentRecordVO vo);
	public void update4(MonthlyRentRecordVO vo);
	public void update5(MonthlyRentRecordVO vo);
	public void update6(MonthlyRentRecordVO vo);
	public void update7(MonthlyRentRecordVO vo);
	public void update8(MonthlyRentRecordVO vo);
	public void update9(MonthlyRentRecordVO vo);
	public void update10(MonthlyRentRecordVO vo);
	public void update11(MonthlyRentRecordVO vo);
	public void update12(MonthlyRentRecordVO vo);
	public void delete(MonthlyRentRecordVO vo);
}
