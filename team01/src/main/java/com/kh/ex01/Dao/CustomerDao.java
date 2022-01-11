package com.kh.ex01.Dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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
	public List<QnaVo> qnaList() {
		List<QnaVo> list = sqlSession.selectList(NAMESAPCE+"qnaList");
		return list;
	}
	
	public List<CsreceiveVo> csreceiveList() {
		List<CsreceiveVo> list = sqlSession.selectList(NAMESAPCE+"csreceiveList");
		return list;
	}
	
}
