package com.kh.ex01.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.ex01.Dao.QnaDao;
import com.kh.ex01.vo.QnaVo;

@Service
public class QnaService {
	
	@Inject
	private QnaDao qnaDao;
	
	public List<QnaVo> selectAll() {
		List<QnaVo> list = qnaDao.selectAll();
		return list;
	}
}
