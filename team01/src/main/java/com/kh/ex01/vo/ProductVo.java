package com.kh.ex01.vo;


public class ProductVo {

	private String shoes_code;
	private String shoes_name;
	private int shoes_size;
	private String shoes_color;
	private int shoes_count;
	private String shoes_category;
	private int shoes_price;
	
	public String getShoes_code() {
		return shoes_code;
	}
	public void setShoes_code(String shoes_code) {
		this.shoes_code = shoes_code;
	}
	public String getShoes_name() {
		return shoes_name;
	}
	public void setShoes_name(String shoes_name) {
		this.shoes_name = shoes_name;
	}
	public int getShoes_size() {
		return shoes_size;
	}
	public void setShoes_size(int shoes_size) {
		this.shoes_size = shoes_size;
	}
	public String getShoes_color() {
		return shoes_color;
	}
	public void setShoes_color(String shoes_color) {
		this.shoes_color = shoes_color;
	}
	public int getShoes_count() {
		return shoes_count;
	}
	public void setShoes_count(int shoes_count) {
		this.shoes_count = shoes_count;
	}
	public String getShoes_category() {
		return shoes_category;
	}
	public void setShoes_category(String shoes_category) {
		this.shoes_category = shoes_category;
	}
	public int getShoes_price() {
		return shoes_price;
	}
	public void setShoes_price(int shoes_price) {
		this.shoes_price = shoes_price;
	}
	@Override
	public String toString() {
		return "ProductVo [shoes_code=" + shoes_code + ", shoes_name=" + shoes_name + ", shoes_size=" + shoes_size
				+ ", shoes_color=" + shoes_color + ", shoes_count=" + shoes_count + ", shoes_category=" + shoes_category
				+ ", shoes_price=" + shoes_price + "]";
	}
	
}
