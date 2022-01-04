package com.kh.ex01.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.ex01.Dao.ProductDao;
import com.kh.ex01.vo.AskProductVo;
import com.kh.ex01.vo.ProductVo;

@Service
public class ProductService {
	@Inject
	ProductDao productDao;
	
	public List<ProductVo> selectAll() {
		List<ProductVo> list = productDao.selectAll();
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
