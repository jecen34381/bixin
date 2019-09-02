package com.bixin.Entity;
public class Question {
	private String qtitle;
	private String qanswer;
	private String qauthor;
	private String type_id;
	public String getQtitle() {
		return qtitle;
	}
	public void setQtitle(String qtitle) {
		this.qtitle = qtitle;
	}
	public String getQanswer() {
		return qanswer;
	}
	public void setQanswer(String qanswer) {
		this.qanswer = qanswer;
	}
	public String getQauthor() {
		return qauthor;
	}
	public void setQauthor(String qauthor) {
		this.qauthor = qauthor;
	}
	public String getType_id() {
		return type_id;
	}
	public void setType_id(String type_id) {
		this.type_id = type_id;
	}
	@Override
	public String toString() {
		return "Question [qtitle=" + qtitle + ", qanswer=" + qanswer + ", qauthor=" + qauthor + ", type_id=" + type_id
				+ "]";
	}
}