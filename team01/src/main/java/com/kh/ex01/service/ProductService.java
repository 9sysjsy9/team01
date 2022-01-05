package com.kh.ex01.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.ex01.Dao.ProductDao;
import com.kh.ex01.vo.AskProductVo;
import com.kh.ex01.vo.PagingDto;
import com.kh.ex01.vo.ProductVo;

@Service
public class ProductService {
	@Inject
	ProductDao productDao;
	
	public List<ProductVo> selectAll(PagingDto pt) {
		List<ProductVo> list = productDao.selectAll(pt);
		return list;
	}
	public List<ProductVo> simpleSelectAll() {
		List<ProductVo> list = productDao.simpleSelectAll();
		return list;
	}
	
	public ProductVo getContent(String shoes_code) {
		ProductVo productVo = productDao.getContent(shoes_code);
		return productVo;
	}
	public int getCount() {
		int count = productDao.getCount();
		return count;
	}
	
}
