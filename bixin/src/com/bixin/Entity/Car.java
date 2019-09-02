package com.bixin.Entity;

public class Car {

	private String cname;
	private String cimage;
	private Double cprice;
	private Integer cnumber;
	private String uid;
	private Integer cid;
	public Car() {
		// TODO Auto-generated constructor stub
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getCimage() {
		return cimage;
	}
	public void setCimage(String cimage) {
		this.cimage = cimage;
	}
	public Double getCprice() {
		return cprice;
	}
	public void setCprice(Double cprice) {
		this.cprice = cprice;
	}
	public Integer getCnumber() {
		return cnumber;
	}
	public void setCnumber(Integer cnumber) {
		this.cnumber = cnumber;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
	}
	public Integer getCid() {
		return cid;
	}
	@Override
	public String toString() {
		return "Car [cname=" + cname + ", cimage=" + cimage + ", cprice=" + cprice + ", cnumber=" + cnumber + ", uid="
				+ uid + "]";
	}
	
	
}
