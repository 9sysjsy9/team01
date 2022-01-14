package com.kh.ex01.Dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.ex01.vo.AskProductVo;
import com.kh.ex01.vo.UserJobVo;
import com.kh.ex01.vo.UserVo;



@Repository
public class UserDao {
		
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.kh.ex01.mappers.user.";
	
	public UserVo loginRun(UserVo userVo2) {
		UserVo userVo = sqlSession.selectOne(NAMESPACE+"loginRun",userVo2);
		return userVo;
	}
	

	public List<UserJobVo> userjob() {
		List<UserJobVo> list = sqlSession.selectList(NAMESPACE+"userjob");
		return list;
	} 
	
	public UserVo checkOrderNum(String order_code) {
		System.out.println("order_code : " + order_code);
		UserVo userVo = sqlSession.selectOne(NAMESPACE + "checkOrderNum",order_code);
		return userVo;
	}
	
	public void userRegistRun(UserVo userVo) {
		sqlSession.insert(NAMESPACE + "userRegistRun", userVo);
	}
	
	public void askRegistRun(AskProductVo askProductVo) {
		sqlSession.insert(NAMESPACE + "askRegistRun", askProductVo);
	}
	
}