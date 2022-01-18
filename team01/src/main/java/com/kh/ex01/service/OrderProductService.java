package com.kh.ex01.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.ex01.Dao.AskProductDao;
import com.kh.ex01.Dao.OrderProductDao;
import com.kh.ex01.vo.AskProductVo;
import com.kh.ex01.vo.OrderProductVo;
import com.kh.ex01.vo.PagingDto;
import com.kh.ex01.vo.UserBasketVo;

@Service
public class OrderProductService {
	@Inject
	OrderProductDao orderProductDao;
	
	public List<OrderProductVo> selectOrder(String order_shoescode) {
		List<OrderProductVo> list = orderProductDao.selectOrder(order_shoescode);
		return list;
	}
	
	public List<UserBasketVo> selectBasket(String order_shoescode) {
		List<UserBasketVo> list = orderProductDao.selectBasket(order_shoescode);
		return list;
	}
	
	public void insertOrderProduct(OrderProductVo orderProductVo) {
		orderProductDao.insertOrderProduct(orderProductVo);
	}
	
	public UserBasketVo getBasket(String order_code) {
		UserBasketVo userBasketVo = orderProductDao.getBasket(order_code);
		return userBasketVo;
	}
	
	public void changeBasketCount(UserBasketVo userBasketVo) {
		orderProductDao.changeBasketCount(userBasketVo);
	}
	
	public int getBasketCount(String order_code) {
		int order_count = orderProductDao.getBasketCount(order_code);
		return order_count;
	}
	
	
}
