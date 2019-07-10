package com.webaid.contower;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.webaid.domain.ManagerVO;
import com.webaid.persistence.ManagerDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class ManagerDaoTest {

	@Autowired
	private ManagerDao dao;
	
	@Test
	public void selectAll(){
		List<ManagerVO> volist = dao.selectAll();
		for(int i=0; i<volist.size(); i++){
			System.out.println(volist);
		}
		
	}
	
	//@Test
	public void delete(){
		dao.delete(2);
	}
}
