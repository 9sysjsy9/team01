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
}
