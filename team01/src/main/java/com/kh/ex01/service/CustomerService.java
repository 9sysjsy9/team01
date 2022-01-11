package com.kh.ex01.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.ex01.Dao.CustomerDao;
import com.kh.ex01.vo.CsreceiveVo;
import com.kh.ex01.vo.NoticeVo;
import com.kh.ex01.vo.QnaVo;

@Service
public class CustomerService {
	@Inject
	CustomerDao customerDao;
	
	public List<NoticeVo> noticeList() {
		List<NoticeVo> list = customerDao.noticeList();
		return list;
	}
	public List<QnaVo> qnaList() {
		List<QnaVo> list = customerDao.qnaList();
		return list;
	}
	public List<CsreceiveVo> csreceiveList() {
		List<CsreceiveVo> list = customerDao.csreceiveList();
		return list;
	}
	
}
