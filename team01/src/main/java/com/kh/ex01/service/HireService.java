package com.kh.ex01.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.ex01.Dao.HireDao;
import com.kh.ex01.vo.HireVo;
import com.kh.ex01.vo.PagingDto;

@Service
public class HireService {
	
	@Inject
	HireDao hireDao;
	
	public List<HireVo> listAll(PagingDto pagingDto) {
		List<HireVo> list = hireDao.listAll(pagingDto);
		return list;
	}
	
	public List<HireVo> listNew() {
		List<HireVo> list = hireDao.listNew();
		return list;
	}
	
	public List<HireVo> listExperience() {
		List<HireVo> list = hireDao.listExperience();
		return list;
	}
	
	public List<HireVo> listIntern() {
		List<HireVo> list = hireDao.listIntern();
		return list;
	}
	
	public int getCount() {
		int count = hireDao.getCount();
		return count;
	}

}
