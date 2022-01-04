package com.kh.ex01.service;

import java.util.List;

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
	
	public FranApplyVo applyStateInquiry(String email) {
		FranApplyVo franApplyVo = storeDao.applyStateInquiry(email);
		return franApplyVo;
	}
	
	public int checkApply(String email) {
		int result = storeDao.checkApply(email);
		return result;
	}
//사내 페이지	
	public List<FranApplyVo> applyFranList(){
		List<FranApplyVo> list = storeDao.applyFranList();
		return list;
	}
	
	public FranApplyVo applyInquiry(String fno) {
		FranApplyVo franApplyVo = storeDao.applyInquiry(fno);
		return franApplyVo;
	}
	
	public void replyRegistRun(FranApplyVo franApplyVo) {
		storeDao.replyRegistRun(franApplyVo);
	}
}
