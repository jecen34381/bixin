package com.bixin.Entity;

import java.sql.Date;

public class Pbook {

	private String pbid;
	private String pbname;
	private int ishot;
	private double pbprice;
	private String pbimage;
	private Date pbdate;
	private String pbdesc;
	private String cid;
	public Pbook() {
		// TODO Auto-generated constructor stub
	}
	
	public Pbook(String pbid, String pbname, int ishot, double pbprice, String pbimage, Date pbdate, String pbdesc,
			String cid) {
		super();
		this.pbid = pbid;
		this.pbname = pbname;
		this.ishot = ishot;
		this.pbprice = pbprice;
		this.pbimage = pbimage;
		this.pbdate = pbdate;
		this.pbdesc = pbdesc;
		this.cid = cid;
	}
	public String getPbid() {
		return pbid;
	}
	public void setPbid(String pbid) {
		this.pbid = pbid;
	}
	public String getPbname() {
		return pbname;
	}
	public void setPbname(String pbname) {
		this.pbname = pbname;
	}
	public int getIshot() {
		return ishot;
	}
	public void setIshot(int ishot) {
		this.ishot = ishot;
	}
	public double getPbprice() {
		return pbprice;
	}
	public void setPbprice(double pbprice) {
		this.pbprice = pbprice;
	}
	public String getPbimage() {
		return pbimage;
	}
	public void setPbimage(String pbimage) {
		this.pbimage = pbimage;
	}
	public Date getPbdate() {
		return pbdate;
	}
	public void setPbdate(Date pbdate) {
		this.pbdate = pbdate;
	}
	public String getPbdesc() {
		return pbdesc;
	}
	public void setPbdesc(String pbdesc) {
		this.pbdesc = pbdesc;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	
	
}
