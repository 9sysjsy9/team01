package com.kh.ex01.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.ex01.Dao.CustomerDao;
import com.kh.ex01.vo.AskProductVo;
import com.kh.ex01.vo.CsCheckVo;
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
	public List<QnaVo> qnaList(String keyword) {
		System.out.println("CustomerService, qnaList, keyword: " + keyword);
		List<QnaVo> list = customerDao.qnaList(keyword);
		return list;
	}
	public List<CsreceiveVo> csreceiveList() {
		List<CsreceiveVo> list = customerDao.csreceiveList();
		return list;
	}
	public List<CsreceiveVo> csList() {
		List<CsreceiveVo> list = customerDao.csList();
		return list;
	}
	public List<CsreceiveVo> csCheck() {
		List<CsreceiveVo> list = customerDao.csCheck();
		return list;
	}
	
	public void csUpdate(int ano, String ask_reply) {
		customerDao.csUpdate(ano, ask_reply);
	}
	
	public void askRegistRun(AskProductVo askProductVo) {
		customerDao.askRegistRun(askProductVo);
	}
	
	public int checkOrderCode(String order_code) {
		int count = customerDao.checkOrderCode(order_code);
		return count;
	}
	
	public void insertCsReceive(CsreceiveVo csreceiveVo) {
		customerDao.insertCsReceive(csreceiveVo);
	}
}
