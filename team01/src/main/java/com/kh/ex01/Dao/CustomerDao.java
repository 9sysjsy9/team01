package com.kh.ex01.Dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.ex01.vo.AskProductVo;
import com.kh.ex01.vo.CsCheckVo;
import com.kh.ex01.vo.CsreceiveVo;
import com.kh.ex01.vo.NoticeVo;
import com.kh.ex01.vo.QnaVo;

@Repository
public class CustomerDao {
	@Inject
	SqlSession sqlSession;
	
	private static final String NAMESAPCE = "com.kh.ex01.mappers.customer.";
	
	public List<NoticeVo> noticeList() {
		List<NoticeVo> list = sqlSession.selectList(NAMESAPCE + "noticeList" );
		return list;
	}
	public List<QnaVo> qnaList(String keyword) {
		System.out.println("CustomerDao, qnaList, keyword: " + keyword);
		Map<String, String> map = new HashMap<>();
		map.put("keyword", keyword);
		List<QnaVo> list = sqlSession.selectList(NAMESAPCE+"qnaList", map);
		return list;
	}
	
	public List<CsreceiveVo> csreceiveList() {
		List<CsreceiveVo> list = sqlSession.selectList(NAMESAPCE+"csreceiveList");
		return list;
	}
	
	public List<CsreceiveVo> csList(){
		List<CsreceiveVo> list = sqlSession.selectList(NAMESAPCE+"csList"); 
		return list;
	}
	public List<CsreceiveVo> csCheck() {
		List<CsreceiveVo> list = sqlSession.selectList(NAMESAPCE+"csCheck"); 
		return list;
	}
	public void csUpdate(int ano, String ask_reply) {
		Map<String, Object> map = new HashMap<>();
		map.put("ano", ano);
		map.put("ask_reply", ask_reply);
		sqlSession.update(NAMESAPCE+"csUpdate", map); 
	}
	
	public void askRegistRun(AskProductVo askProductVo) {
		sqlSession.insert(NAMESAPCE + "askRegistRun", askProductVo);
	}
	
	public int checkOrderCode(String order_code) {
		System.out.println("order_code : " + order_code);
		int count = sqlSession.selectOne(NAMESAPCE + "checkOrderCode",order_code);
		return count;
	}
	
	public void insertCsReceive(CsreceiveVo csreceiveVo) {
		sqlSession.insert(NAMESAPCE + "insertCsReceive", csreceiveVo);
	}
	
}
