package com.kh.ex01.Dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
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
	
}