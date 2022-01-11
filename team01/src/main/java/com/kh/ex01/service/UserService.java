package com.kh.ex01.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.ex01.Dao.QnaDao;
import com.kh.ex01.Dao.UserDao;
import com.kh.ex01.vo.QnaVo;
import com.kh.ex01.vo.UserVo;

@Service
public class UserService {
	
	@Inject
	private UserDao userDao;
	
	public UserVo loginRun(UserVo userVo2) {
		UserVo userVo = userDao.loginRun(userVo2);
		return userVo;
	}
}
