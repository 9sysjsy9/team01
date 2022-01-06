package com.kh.ex01.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.ex01.Dao.FaqDao;
import com.kh.ex01.vo.customer.FaqVo;

@Service
public class FaqService {
	
	@Inject
	private FaqDao faqDao;
	
	public List<FaqVo> selectAll() {
		List<FaqVo> list = faqDao.selectAll();
		return list;
	}
}
