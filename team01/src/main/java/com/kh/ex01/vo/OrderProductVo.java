package com.kh.ex01.vo;

import java.sql.Timestamp;
import java.util.Date;

public class OrderProductVo {

	private String order_code;
	private String order_shoescode;
	private Date order_regdate;
	private String user_id;
	private int shoes_price;
	
	public String getOrder_code() {
		return order_code;
	}
	public void setOrder_code(String order_code) {
		this.order_code = order_code;
	}
	public String getOrder_shoescode() {
		return order_shoescode;
	}
	public void setOrder_shoescode(String order_shoescode) {
		this.order_shoescode = order_shoescode;
	}
	public Date getOrder_regdate() {
		return order_regdate;
	}
	public void setOrder_regdate(Date order_regdate) {
		this.order_regdate = order_regdate;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getShoes_price() {
		return shoes_price;
	}
	public void setShoes_price(int shoes_price) {
		this.shoes_price = shoes_price;
	}
	@Override
	public String toString() {
		return "OrderProductVo [order_code=" + order_code + ", order_shoescode=" + order_shoescode + ", order_regdate="
				+ order_regdate + ", user_id=" + user_id + ", shoes_price=" + shoes_price + "]";
	}
	

}
