package com.kh.ex01.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.ex01.Dao.AskProductDao;
import com.kh.ex01.vo.AskProductVo;

@Service
public class AskProductService {
	@Inject
	AskProductDao askProductDao;
	
	public List<AskProductVo> selectAll() {
		List<AskProductVo> list = askProductDao.selectAll();
		return list;
	}
	
	public AskProductVo getContent(int ano) {
		AskProductVo askProductVo = askProductDao.getContent(ano);
		return askProductVo;
	}
	public void modifyContent(AskProductVo askProductVo) {
		askProductDao.modifyContent(askProductVo);
	}
	
	
}
