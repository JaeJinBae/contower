package com.webaid.service;

import java.util.List;

import com.webaid.domain.ManagerVO;

public interface ManagerService {
	public List<ManagerVO> selectAll();
	public ManagerVO selectOne(int mno);
	public ManagerVO selectById(String id);
	public void register(ManagerVO vo);
	public void update(ManagerVO vo);
	public void delete(int mno);
}
