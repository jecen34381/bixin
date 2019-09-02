package com.bixin.ServiceImpl;

import java.sql.SQLException;
import java.util.List;

import com.bixin.DaoImpl.PersonMyTopicListImpl;
import com.bixin.Entity.BBS_replay;
import com.bixin.Entity.BBS_topic;
import com.bixin.IService.IPersonMyTopicListService;

public class PeronMyTopicListServiceImpl implements IPersonMyTopicListService{

	@Override
	public BBS_topic getMyTopicList(Integer topicId) {
		// TODO Auto-generated method stub
		 BBS_topic bBS_topic = null;
		 try {
			 bBS_topic = new PersonMyTopicListImpl().getMyTopicList(topicId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return bBS_topic;
	}
	@Override
	public List<BBS_topic> getMyTopicList(String uid) {
		// TODO Auto-generated method stub
		 List<BBS_topic> list = null;
		 try {
			list = new PersonMyTopicListImpl().getMyTopicList(uid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public List<BBS_topic> getMyTopicList(String uid,Integer isPublish) {
		// TODO Auto-generated method stub
		 List<BBS_topic> list = null;
		 try {
			list = new PersonMyTopicListImpl().getMyTopicList(uid, isPublish);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public List<BBS_topic> getMyTopicList() {
		// TODO Auto-generated method stub
		 List<BBS_topic> list = null;
		 try {
			list = new PersonMyTopicListImpl().getMyTopicList();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public boolean saveTopic(BBS_topic topic) {
		// TODO Auto-generated method stub
		boolean status = false;
		try {
			status = new PersonMyTopicListImpl().saveTopic(topic);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status;
	}

	@Override
	public Boolean changeTopicIsPublish(String topicId) {
		// TODO Auto-generated method stub
		boolean status = false;
		try {
			status = new PersonMyTopicListImpl().changeTopicIsPublish(topicId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status;
	}

	@Override
	public Boolean deleteTopic(String topicId) {
		// TODO Auto-generated method stub
		//在删除帖子之前先删除与帖子相关的回复
		/*
		 * @topicId 被删除回复对应的帖子id
		 * return 返回boolen值，不以这个为准，因为如果这个帖子没有回复则也要删除一下，则会返回false
		 * 所以返回值并不作为判断其他活动的根据，仅作为参考
		 */
		try {
			boolean deleteReplay = new PersonMyTopicListImpl().deleteReplay(topicId);
			if(deleteReplay) {
				System.out.println("回复已删除");
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} 
		boolean status = false;
		try {
			status = new PersonMyTopicListImpl().deleteTopic(topicId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status;
	}
	@Override
	public Boolean saveReplay(BBS_replay bbs_replay) {
		// TODO Auto-generated method stub
		
		boolean status = false;
		try {
			status = new PersonMyTopicListImpl().saveReplay(bbs_replay);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status;
	
	}
	@Override
	public List<BBS_replay> getReplayList(Integer topicId, Integer start) {
		// TODO Auto-generated method stub
		 List<BBS_replay> list = null;
		 try {
			list = new PersonMyTopicListImpl().getReplayList(topicId, start);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

}
