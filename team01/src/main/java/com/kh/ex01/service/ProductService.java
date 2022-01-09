package com.kh.ex01.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.ex01.Dao.ProductDao;
import com.kh.ex01.vo.PagingDto;
import com.kh.ex01.vo.ProductVo;
import com.kh.ex01.vo.ShoesCategoryVo;
import com.kh.ex01.vo.ShoesColorVo;
import com.kh.ex01.vo.ShoesSizeVo;
import com.kh.ex01.vo.ShoesStateVo;
import com.kh.ex01.vo.ShoesStyleVo;

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
	
	public List<ShoesSizeVo> selectAllShoesSize() {
		List<ShoesSizeVo> list = productDao.selectAllShoesSize();
		return list;
	}
	public List<ShoesStyleVo> selectAllShoesStyle() {
		List<ShoesStyleVo> list = productDao.selectAllShoesStyle();
		return list;
	}
	public List<ShoesStateVo> selectAllShoesState() {
		List<ShoesStateVo> list = productDao.selectAllShoesState();
		return list;
	}
	public List<ShoesColorVo> selectAllShoesColor() {
		List<ShoesColorVo> list = productDao.selectAllShoesColor();
		return list;
	}
	public List<ShoesCategoryVo> selectAllShoesCategory() {
		List<ShoesCategoryVo> list = productDao.selectAllShoesCategory();
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
	public void insertProduct(ProductVo productVo) {
		productDao.insertProduct(productVo);
	}
}
