package com.kh.ex01.service;


import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.ex01.Dao.UserDao;
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
