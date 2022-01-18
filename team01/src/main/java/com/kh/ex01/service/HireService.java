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
	
	public List<HireBoardVo> listNew(PagingDto pagingDto) {
		List<HireBoardVo> list = hireDao.listNew(pagingDto);
		return list;
	}
	
	public List<HireBoardVo> listExperience(PagingDto pagingDto) {
		List<HireBoardVo> list = hireDao.listExperience(pagingDto);
		return list;
	}
	
	public List<HireBoardVo> listIntern(PagingDto pagingDto) {
		List<HireBoardVo> list = hireDao.listIntern(pagingDto);
		return list;
	}
	
	public HireBoardVo getHireBoard(int bno) {
		HireBoardVo hireBoardVo = hireDao.getHireBoard(bno);
		return hireBoardVo;
	}
	
	public int getCount() {
		int count = hireDao.getCount();
		return count;
	}
	
	public void deleteHireBoard(int bno) {
		hireDao.deleteHireBoard(bno);
	}
	
	public int getN_Count() {
		int count = hireDao.getN_Count();
		return count;
	}
	
	public int getI_Count() {
		int count = hireDao.getI_Count();
		return count;
	}
	
	public int getE_Count() {
		int count = hireDao.getE_Count();
		return count;
	}
	
	public List<HireVo> registList() {
		List<HireVo> list = hireDao.registList();
		return list;
	}
	
	public void registRun(HireVo hireVo) {
		hireDao.registRun(hireVo);
	}
	
	public HireVo getBoard(int hno) {
		HireVo hireVo = hireDao.getBoard(hno);
		return hireVo;
	}
	
	public void deleteBoard(int hno) {
		hireDao.deleteBoard(hno);
	}
	
	public void modifySuccess(int hno) {
		hireDao.modifySuccess(hno);
	}
	
	public void modifyFail(int hno) {
		hireDao.modifyFail(hno);
	}
	
	public HireVo searchSuccess(String name, String email) {
		HireVo hireVo = hireDao.searchSuccess(name, email);
		return hireVo;
	}
	
}
