package com.bixin.Entity;
import java.util.HashMap;
import java.util.Map;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

public class Cart {
	//购物车列表
	private Map<String,CartItem> list = new HashMap<>();
	//总价
	private double totalPrice;
	public Map<String, CartItem> getList() {
		return list;
	}
	public void setList(Map<String, CartItem> list) {
		this.list = list;
	}
	public double getTotalPrice() {
		double newtotalPrice = 0.0;
		for (CartItem value : list.values()) {
			newtotalPrice += value.getTotalPrice();
		}
		return newtotalPrice;
	}
	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
}
