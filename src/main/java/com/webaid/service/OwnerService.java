package com.webaid.service;

import java.util.List;

import com.webaid.domain.OwnerVO;

public interface OwnerService {
	public List<OwnerVO> selectAll();
	public OwnerVO selectOne(int ono);
	public OwnerVO selectExistChk(OwnerVO vo);
	public OwnerVO selectById(String id);
	public void register(OwnerVO vo);
	public void update(OwnerVO vo);
	public void delete(int ono);
}
