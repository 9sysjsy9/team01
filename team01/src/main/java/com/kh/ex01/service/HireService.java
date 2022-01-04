package com.kh.ex01.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.ex01.Dao.HireDao;
import com.kh.ex01.vo.HireBoardVo;
import com.kh.ex01.vo.HireVo;
import com.kh.ex01.vo.PagingDto;

@Service
public class HireService {
	
	@Inject
	HireDao hireDao;
	
	public List<HireBoardVo> listAll(PagingDto pagingDto) {
		List<HireBoardVo> list = hireDao.listAll(pagingDto);
		return list;
	}
	
	public List<HireBoardVo> listNew() {
		List<HireBoardVo> list = hireDao.listNew();
		return list;
	}
	
	public List<HireBoardVo> listExperience() {
		List<HireBoardVo> list = hireDao.listExperience();
		return list;
	}
	
	public List<HireBoardVo> listIntern() {
		List<HireBoardVo> list = hireDao.listIntern();
		return list;
	}
	
	public int getCount() {
		int count = hireDao.getCount();
		return count;
	}
	
	public List<HireVo> registList() {
		List<HireVo> list = hireDao.registList();
		return list;
	}
	
	public void registRun(HireVo hireVo) {
		hireDao.registRun(hireVo);
	}
}
