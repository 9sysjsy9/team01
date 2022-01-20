package com.kh.ex01.Dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.ex01.vo.OrderContentVo;
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
	
	public OrderContentVo getOrderContent(String shoes_code) {
		OrderContentVo orderContentVo = sqlSession.selectOne(NAMESAPCE+"getOrderContent", shoes_code);
		return orderContentVo;
	}
	
	public List<UserBasketVo> selectBasket(String order_shoescode) {
		List<UserBasketVo> list = sqlSession.selectList(NAMESAPCE+"selectBasket", order_shoescode);
		return list;
	}
	
	public UserBasketVo getBasket(String order_code) {
		UserBasketVo userBasketVo = sqlSession.selectOne(NAMESAPCE+"getBasket", order_code);
		return userBasketVo;
	}
	
	public void insertOrderProduct(OrderProductVo orderProductVo) {
		sqlSession.insert(NAMESAPCE+"insertOrderProduct", orderProductVo);
	}
	
	public void changeBasketCount(UserBasketVo userBasketVo) {
		sqlSession.update(NAMESAPCE+"changeBasketCount", userBasketVo);
	}
	
	public void changeBasketChecked(UserBasketVo userBasketVo) {
		sqlSession.update(NAMESAPCE+"changeBasketChecked", userBasketVo);
	}
	
	public int getBasketCount(String order_code) {
		int order_count = sqlSession.selectOne(NAMESAPCE+"getBasketCount", order_code);
		return order_count;
	}
	
	public int getUserBasketCount(String user_id) {
		int cart_count = sqlSession.selectOne(NAMESAPCE+"getUserBasketCount", user_id);
		return cart_count;
	}
	
	public int getBasketShoeseCodeCount(String user_id) {
		int shoescode_count = sqlSession.selectOne(NAMESAPCE+"getBasketShoeseCodeCount", user_id);
		return shoescode_count;
	}
	
	public void plusBasketOrdercount(String shoes_count) {
		sqlSession.update(NAMESAPCE+"plusBasketOrdercount", shoes_count);
	}
	
	public void insertBasket(UserBasketVo userBasketVo) {
		sqlSession.insert(NAMESAPCE+"insertBasket", userBasketVo);
	}
	
	public void deleteBasket(String shoes_code) {
		sqlSession.delete(NAMESAPCE+"deleteBasket", shoes_code);
	}
	
}
