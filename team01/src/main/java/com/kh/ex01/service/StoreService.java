package com.kh.ex01.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.ex01.Dao.StoreDao;
import com.kh.ex01.vo.FranApplyVo;

@Service
public class StoreService {
	
	@Inject
	private StoreDao storeDao;
	
	public void applyRegistRun(FranApplyVo franApplyVo) {
		storeDao.applyRegistRun(franApplyVo);
	}
	
	public FranApplyVo applyInquir(String email) {
		FranApplyVo franApplyVo = storeDao.applyInquir(email);
		return franApplyVo;
	}
}
