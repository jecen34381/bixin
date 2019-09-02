package com.bixin.IService;

import java.sql.SQLException;
import java.util.List;

import com.bixin.Entity.BBS_replay;
import com.bixin.Entity.BBS_topic;

public interface IPersonMyTopicListService {
	public List<BBS_topic> getMyTopicList(String uid);
	public List<BBS_topic> getMyTopicList(String uid, Integer isPublish);
	public List<BBS_topic> getMyTopicList();
	public boolean saveTopic(BBS_topic topic);
	public Boolean changeTopicIsPublish(String topicId);
	public Boolean deleteTopic(String topicId);
	public BBS_topic getMyTopicList(Integer topicId);
	public Boolean saveReplay(BBS_replay bbs_replay);
	public List<BBS_replay> getReplayList(Integer topicId, Integer start);
}
