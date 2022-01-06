package com.kh.ex01.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.ex01.Dao.NoticeDao;
import com.kh.ex01.vo.customer.NoticeVo;

@Service
public class NoticeService {
	@Inject
	NoticeDao noticeDao;
	
	public List<NoticeVo> selectAll() {
		List<NoticeVo> list = noticeDao.selectAll();
		return list;
	}
	
}
