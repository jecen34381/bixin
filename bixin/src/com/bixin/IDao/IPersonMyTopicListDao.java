package com.bixin.IDao;

import java.sql.SQLException;
import java.util.List;

import com.bixin.Entity.BBS_replay;
import com.bixin.Entity.BBS_topic;

public interface IPersonMyTopicListDao {

	public List<BBS_topic> getMyTopicList(String uid) throws SQLException;
	public List<BBS_topic> getMyTopicList(String uid, Integer isPublish) throws SQLException;
	public List<BBS_topic> getMyTopicList() throws SQLException;
	public Boolean saveTopic(BBS_topic topic) throws SQLException;
	public Boolean changeTopicIsPublish(String topicId) throws SQLException;
	public Boolean deleteTopic(String topicId) throws SQLException;
	public BBS_topic getMyTopicList(Integer topicId) throws SQLException;
	public Boolean saveReplay(BBS_replay bbs_replay) throws SQLException;
	public List<BBS_replay> getReplayList(Integer topicId, Integer start) throws SQLException;
}
