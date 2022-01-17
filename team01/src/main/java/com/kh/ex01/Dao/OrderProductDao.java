package com.kh.ex01.Dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.ex01.vo.OrderProductVo;
import com.kh.ex01.vo.UserBasketVo;

@Repository
public class OrderProductDao {
	@Inject
	SqlSession sqlSession;
	
	private static final String NAMESAPCE = "com.kh.ex01.mappers.orderproduct.";
	
	public List<OrderProductVo> selectOrder(String order_shoescode) {
		List<OrderProductVo> list = sqlSession.selectList(NAMESAPCE+"selectOrder", order_shoescode);
		return list;
	}
	
	public List<UserBasketVo> selectBasket(String order_shoescode) {
		List<UserBasketVo> list = sqlSession.selectList(NAMESAPCE+"selectBasket", order_shoescode);
		return list;
	}
	
	public void insertOrderProduct(OrderProductVo orderProductVo) {
		sqlSession.insert(NAMESAPCE+"insertOrderProduct", orderProductVo);
	}
	
}
