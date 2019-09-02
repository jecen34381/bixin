package com.bixin.Entity;

import java.sql.Date;

public class BBS_topic {

	private Integer topicId;
	private String title;
	private String content;
	private String createTime;
	private String uid;
	private Integer boardId;
	private Integer isPublish;
	public BBS_topic() {
		// TODO Auto-generated constructor stub
	}
	public Integer getTopicId() {
		return topicId;
	}
	public void setTopicId(Integer topicId) {
		this.topicId = topicId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public Integer getBoardId() {
		return boardId;
	}
	public void setBoardId(Integer boardId) {
		this.boardId = boardId;
	}
	public void setIsPublish(Integer isPublish) {
		this.isPublish = isPublish;
	}
	public Integer getIsPublish() {
		return isPublish;
	}
	@Override
	public String toString() {
		return "BBS_topic [topicId=" + topicId + ", title=" + title + ", content=" + content + ", createTime="
				+ createTime + ", uid=" + uid + ", boardId=" + boardId + "]";
	}
	
	
}
