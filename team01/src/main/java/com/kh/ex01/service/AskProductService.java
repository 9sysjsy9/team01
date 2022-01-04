package com.kh.ex01.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.ex01.Dao.AskProductDao;
import com.kh.ex01.vo.AskProductVo;
import com.kh.ex01.vo.PagingDto;

@Service
public class AskProductService {
	@Inject
	AskProductDao askProductDao;
	
	public List<AskProductVo> selectAll(PagingDto pt) {
		List<AskProductVo> list = askProductDao.selectAll(pt);
		return list;
	}
	
	public AskProductVo getContent(int ano) {
		AskProductVo askProductVo = askProductDao.getContent(ano);
		return askProductVo;
	}
	public void modifyContent(AskProductVo askProductVo) {
		askProductDao.modifyContent(askProductVo);
	}
	public void insertContent(AskProductVo askProductVo) {
		askProductDao.insertContent(askProductVo);
	}
	public void deleteContent(int ano) {
		askProductDao.deleteContent(ano);
	}
	public int getCount() {
		int count = askProductDao.getCount();
		return count;
	}
	
}
