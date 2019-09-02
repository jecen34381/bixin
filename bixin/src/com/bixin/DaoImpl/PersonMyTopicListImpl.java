package com.bixin.DaoImpl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.junit.Test;

import com.bixin.Entity.BBS_replay;
import com.bixin.Entity.BBS_topic;
import com.bixin.IDao.IPersonMyTopicListDao;
import com.bixin.utils.DataSourceUtils;

public class PersonMyTopicListImpl implements IPersonMyTopicListDao {

	
	@Override
	public BBS_topic getMyTopicList(Integer topicId) throws SQLException {
		// TODO Auto-generated method stub
		Connection conn = DataSourceUtils.getConnection();
		QueryRunner query = new QueryRunner();
		String sql = "select * from bbs_topic where topicId=?";
		BBS_topic bBS_topic = query.query(conn, sql, new BeanHandler<BBS_topic>(BBS_topic.class), topicId);
		conn.close();
		return bBS_topic;
	}
	/*
	 * 获取公共的帖子
	 * @uid 用户id
	 * @isPublish 标记帖子是否发布的状态
	 */
	@Override
	public List<BBS_topic> getMyTopicList(String uid, Integer isPublish) throws SQLException {
		// TODO Auto-generated method stub
		Connection conn = DataSourceUtils.getConnection();
		QueryRunner query = new QueryRunner();
		String sql = "select * from bbs_topic where uid=? and isPublish=?";
		List<BBS_topic> list = query.query(conn, sql, new BeanListHandler<BBS_topic>(BBS_topic.class), uid, isPublish);
		conn.close();
		return list;
	}
	//获得所有的帖子
	@Override
	public List<BBS_topic> getMyTopicList(String uid) throws SQLException {
		// TODO Auto-generated method stub
		Connection conn = DataSourceUtils.getConnection();
		QueryRunner query = new QueryRunner();
		String sql = "select * from bbs_topic where uid=?";
		List<BBS_topic> list = query.query(conn, sql, new BeanListHandler<BBS_topic>(BBS_topic.class), uid);
		conn.close();
		return list;
	}
	@Override
	public List<BBS_topic> getMyTopicList() throws SQLException {
		// TODO Auto-generated method stub
		Connection conn = DataSourceUtils.getConnection();
		QueryRunner query = new QueryRunner();
		String sql = "select * from bbs_topic where isPublish=1";
		List<BBS_topic> list = query.query(conn, sql, new BeanListHandler<BBS_topic>(BBS_topic.class));
		conn.close();
		return list;
	}
	@Override
	public Boolean saveTopic(BBS_topic topic) throws SQLException {
		// TODO Auto-generated method stub
		Connection conn = DataSourceUtils.getConnection();
		QueryRunner query = new QueryRunner();
		String sql = "insert into bbs_topic(title,content,createTime,uid,boardId,isPublish) values(?,?,?,?,?,?)";
		Object[] param = {topic.getTitle(),topic.getContent(),topic.getCreateTime(),topic.getUid(),topic.getBoardId(),topic.getIsPublish()};
		int status = query.update(conn, sql,param);
		if(status > 0) {
			return true;
		}
		conn.close();
		return false;
	}

	@Override
	public Boolean changeTopicIsPublish(String topicId) throws SQLException {
		// TODO Auto-generated method stub
		Connection conn = DataSourceUtils.getConnection();
		QueryRunner query = new QueryRunner();
		String sql = "update bbs_topic set isPublish=1 where topicId = ?";
		int status = query.update(conn, sql, topicId);
		if(status > 0) {
			return true;
		}
		conn.close();
		return false;
	}

	@Override
	public Boolean deleteTopic(String topicId) throws SQLException {
		// TODO Auto-generated method stub
		Connection conn = DataSourceUtils.getConnection();
		QueryRunner query = new QueryRunner();
		String sql = "delete from bbs_topic where topicId = ?";
		int status = query.update(conn, sql, topicId);
		System.out.println(status);
		if(status > 0) {
			return true;
		}
		conn.close();
		return false;
	}
	@Test
	public void test123() {
		
	}
	@Override
	public Boolean saveReplay(BBS_replay bbs_replay) throws SQLException {
		// TODO Auto-generated method stub
		
		Connection conn = DataSourceUtils.getConnection();
		QueryRunner query = new QueryRunner();
		String sql = "insert into bbs_replay(content,createTime,uid,topicId) values(?,?,?,?)";
		Object[] param = {bbs_replay.getContent(),bbs_replay.getCreateTime(),bbs_replay.getUid(),bbs_replay.getTopicId()};
		int status = query.update(conn, sql,param);
		if(status > 0) {
			return true;
		}
		conn.close();
		return false;
	}
	@Override
	public List<BBS_replay> getReplayList(Integer topicId, Integer start) throws SQLException {
		// TODO Auto-generated method stub
		Connection conn = DataSourceUtils.getConnection();
		QueryRunner query = new QueryRunner();
		String sql = "select * from bbs_replay where topicId=? limit ?,5";
		List<BBS_replay> list = query.query(conn, sql, new BeanListHandler<BBS_replay>(BBS_replay.class), topicId, start);
		conn.close();
		return list;
	}
	/*
	 * 删除帖子的附属dao函数
	 */
	public boolean deleteReplay(String topicId) throws SQLException  {
		// TODO Auto-generated method stub
		Connection conn = DataSourceUtils.getConnection();
		QueryRunner query = new QueryRunner();
		String sql = "delete from bbs_replay where topicId = ?";
		int status = query.update(conn, sql, topicId);
		System.out.println("回复删除" + status);
		if(status > 0) {
			return true;
		}
		conn.close();
		return false;
	}
}
