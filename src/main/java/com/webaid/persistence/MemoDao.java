package com.webaid.persistence;

import java.util.List;

import com.webaid.domain.MemoVO;

public interface MemoDao {
	public List<MemoVO> selectAll();
	public MemoVO selectOne(int no);
	public List<MemoVO> selectByMnoDate(MemoVO vo);
	public void register(MemoVO vo);
	public void update(MemoVO vo);
	public void delete(int no);
}
