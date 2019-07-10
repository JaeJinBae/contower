package com.webaid.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.webaid.domain.MonthlyRentRecordVO;

@Repository
public class MonthlyRentRecordDaoImpl implements MonthlyRentRecordDao {

	private static final String namespace="com.webaid.mappers.MonthlyRentRecordMapper";
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<MonthlyRentRecordVO> selectAll() {
		return session.selectList(namespace+".selectAll");
	}

	@Override
	public MonthlyRentRecordVO selectOne(int no) {
		return session.selectOne(namespace+".selectOne", no);
	}

	@Override
	public List<MonthlyRentRecordVO> selectByBnoYear(MonthlyRentRecordVO vo) {
		return session.selectList(namespace+".selectByBnoYear", vo);
	}

	@Override
	public void register(MonthlyRentRecordVO vo) {
		session.insert(namespace+".register", vo);
	}

	@Override
	public void update1(MonthlyRentRecordVO vo) {
		session.update(namespace+".update1", vo);
	}

	@Override
	public void update2(MonthlyRentRecordVO vo) {
		session.update(namespace+".update2", vo);
	}

	@Override
	public void update3(MonthlyRentRecordVO vo) {
		session.update(namespace+".update3", vo);
	}

	@Override
	public void update4(MonthlyRentRecordVO vo) {
		session.update(namespace+".update4", vo);
	}

	@Override
	public void update5(MonthlyRentRecordVO vo) {
		session.update(namespace+".update5", vo);
	}

	@Override
	public void update6(MonthlyRentRecordVO vo) {
		session.update(namespace+".update6", vo);
	}

	@Override
	public void update7(MonthlyRentRecordVO vo) {
		session.update(namespace+".update7", vo);
	}

	@Override
	public void update8(MonthlyRentRecordVO vo) {
		session.update(namespace+".update8", vo);
	}

	@Override
	public void update9(MonthlyRentRecordVO vo) {
		session.update(namespace+".update9", vo);
	}

	@Override
	public void update10(MonthlyRentRecordVO vo) {
		session.update(namespace+".update10", vo);
	}

	@Override
	public void update11(MonthlyRentRecordVO vo) {
		session.update(namespace+".update11", vo);
	}

	@Override
	public void update12(MonthlyRentRecordVO vo) {
		session.update(namespace+".update12", vo);
	}

	@Override
	public void delete(MonthlyRentRecordVO vo) {
		session.delete(namespace+".delete", vo);
	}

	

}
