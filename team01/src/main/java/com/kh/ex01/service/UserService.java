package com.kh.ex01.service;


import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.ex01.Dao.UserDao;
import com.kh.ex01.vo.AskProductVo;
import com.kh.ex01.vo.OrderProductVo;
import com.kh.ex01.vo.UserJobVo;
import com.kh.ex01.vo.UserVo;

@Service
public class UserService {

	@Inject
	private UserDao userDao;

	public UserVo loginRun(UserVo userVo2) {
		UserVo userVo = userDao.loginRun(userVo2);
		return userVo;
	}
	
	public List<UserJobVo> userjob() {
		List<UserJobVo> list =userDao.userjob();
		return list;
	}   
	
	public UserVo checkOrderNum(String order_code) {
		UserVo userVo = userDao.checkOrderNum(order_code);
		return userVo;
	}
	
	public void userRegistRun(UserVo userVo) {
		userDao.userRegistRun(userVo);
	}
	
	public void askRegistRun(AskProductVo askProductVo) {
		userDao.askRegistRun(askProductVo);
	}
	
	// 사용자 정보 수정
	public void updateUser(UserVo userVo) {
		userDao.updateUser(userVo);
	}
}
