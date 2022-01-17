package com.kh.ex01.vo;

import java.sql.Timestamp;
import java.util.Date;

public class UserBasketVo {

	private String order_code;
	private String order_shoescode;
	private Date order_regdate;
	private String user_id;
	private int order_count;
	private int shoes_price;
	private String shoes_name;
	private String shoes_image;
	
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
	public String getShoes_name() {
		return shoes_name;
	}
	public void setShoes_name(String shoes_name) {
		this.shoes_name = shoes_name;
	}
	public String getShoes_image() {
		return shoes_image;
	}
	public void setShoes_image(String shoes_image) {
		this.shoes_image = shoes_image;
	}
	public int getOrder_count() {
		return order_count;
	}
	public void setOrder_count(int order_count) {
		this.order_count = order_count;
	}
	@Override
	public String toString() {
		return "UserBasketVo [order_code=" + order_code + ", order_shoescode=" + order_shoescode + ", order_regdate="
				+ order_regdate + ", user_id=" + user_id + ", order_count=" + order_count + ", shoes_price="
				+ shoes_price + ", shoes_name=" + shoes_name + ", shoes_image=" + shoes_image + "]";
	}
	
	

}
