package com.kh.ex01.Dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.ex01.vo.PagingDto;
import com.kh.ex01.vo.ProductVo;
import com.kh.ex01.vo.ShoesCategoryVo;
import com.kh.ex01.vo.ShoesColorVo;
import com.kh.ex01.vo.ShoesStateVo;
import com.kh.ex01.vo.ShoesStyleVo;

@Repository
public class ProductDao {
	@Inject
	SqlSession sqlSession;
	
	private static final String NAMESAPCE = "com.kh.ex01.mappers.product.";
	
	public List<ProductVo> selectAll(PagingDto pt) {
		List<ProductVo> list = sqlSession.selectList(NAMESAPCE+"selectAll",pt);
		return list;
	}
	public List<ProductVo> simpleSelectAll() {
		List<ProductVo> list = sqlSession.selectList(NAMESAPCE+"simpleSelectAll");
		return list;
	}
	
	public List<ShoesStyleVo> selectAllShoesStyle() {
		List<ShoesStyleVo> list = sqlSession.selectList(NAMESAPCE+"selectAllShoesStyle");
		return list;
	}
	public List<ShoesStateVo> selectAllShoesState() {
		List<ShoesStateVo> list = sqlSession.selectList(NAMESAPCE+"selectAllShoesState");
		return list;
	}
	public List<ShoesColorVo> selectAllShoesColor() {
		List<ShoesColorVo> list = sqlSession.selectList(NAMESAPCE+"selectAllShoesColor");
		return list;
	}
	public List<ShoesCategoryVo> selectAllShoesCategory() {
		List<ShoesCategoryVo> list = sqlSession.selectList(NAMESAPCE+"selectAllShoesCategory");
		return list;
	}
	
	public ProductVo getContent(String shoes_code) {
		ProductVo productVo = sqlSession.selectOne(NAMESAPCE+"getProduct", shoes_code);
		return productVo;
	}
	public int getCount() {
		int count = sqlSession.selectOne(NAMESAPCE+"getCount");
		return count;
	}
	
}
