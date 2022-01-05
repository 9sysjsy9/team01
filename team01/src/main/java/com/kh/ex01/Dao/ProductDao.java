package com.kh.ex01.Dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.ex01.vo.AskProductVo;
import com.kh.ex01.vo.PagingDto;
import com.kh.ex01.vo.ProductVo;

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
	public ProductVo getContent(String shoes_code) {
		ProductVo productVo = sqlSession.selectOne(NAMESAPCE+"getProduct", shoes_code);
		return productVo;
	}
	public int getCount() {
		int count = sqlSession.selectOne(NAMESAPCE+"getCount");
		return count;
	}
	
}
