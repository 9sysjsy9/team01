package com.kh.ex01.vo;

public class OrderContentVo {

	private String shoes_code;
	private String user_id;
	private int order_count;
	private int shoes_price;
	private String shoes_name;
	private String shoes_image;
	
	public String getShoes_code() {
		return shoes_code;
	}
	public void setShoes_code(String shoes_code) {
		this.shoes_code = shoes_code;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getOrder_count() {
		return order_count;
	}
	public void setOrder_count(int order_count) {
		this.order_count = order_count;
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
	@Override
	public String toString() {
		return "OrderContentVo [shoes_code=" + shoes_code + ", user_id=" + user_id + ", order_count=" + order_count
				+ ", shoes_price=" + shoes_price + ", shoes_name=" + shoes_name + ", shoes_image=" + shoes_image + "]";
	}
	
	
}
