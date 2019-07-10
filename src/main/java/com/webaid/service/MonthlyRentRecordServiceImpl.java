package com.webaid.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webaid.domain.MonthlyRentRecordVO;
import com.webaid.persistence.MonthlyRentRecordDao;

@Service
public class MonthlyRentRecordServiceImpl implements MonthlyRentRecordService {

	@Autowired
	private MonthlyRentRecordDao dao;
	
	@Override
	public List<MonthlyRentRecordVO> selectAll() {
		return dao.selectAll();
	}

	@Override
	public MonthlyRentRecordVO selectOne(int no) {
		return dao.selectOne(no);
	}

	@Override
	public List<MonthlyRentRecordVO> selectByBnoYear(MonthlyRentRecordVO vo) {
		return dao.selectByBnoYear(vo);
	}

	@Override
	public void register(MonthlyRentRecordVO vo) {
		dao.register(vo);
	}

	@Override
	public void update1(MonthlyRentRecordVO vo) {
		dao.update1(vo);
	}

	@Override
	public void update2(MonthlyRentRecordVO vo) {
		dao.update2(vo);
	}

	@Override
	public void update3(MonthlyRentRecordVO vo) {
		dao.update3(vo);
	}

	@Override
	public void update4(MonthlyRentRecordVO vo) {
		dao.update4(vo);
	}

	@Override
	public void update5(MonthlyRentRecordVO vo) {
		dao.update5(vo);
	}

	@Override
	public void update6(MonthlyRentRecordVO vo) {
		dao.update6(vo);
	}

	@Override
	public void update7(MonthlyRentRecordVO vo) {
		dao.update7(vo);
	}

	@Override
	public void update8(MonthlyRentRecordVO vo) {
		dao.update8(vo);
	}

	@Override
	public void update9(MonthlyRentRecordVO vo) {
		dao.update9(vo);
	}

	@Override
	public void update10(MonthlyRentRecordVO vo) {
		dao.update10(vo);
	}

	@Override
	public void update11(MonthlyRentRecordVO vo) {
		dao.update11(vo);
	}

	@Override
	public void update12(MonthlyRentRecordVO vo) {
		dao.update12(vo);
	}

	@Override
	public void delete(MonthlyRentRecordVO vo) {
		dao.delete(vo);
	}

	

}
