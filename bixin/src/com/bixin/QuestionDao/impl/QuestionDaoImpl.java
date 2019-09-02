package com.bixin.QuestionDao.impl;
import java.sql.SQLException;
import java.util.List;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import com.bixin.Entity.Question;
import com.bixin.IDaoQuestion.IDaoQuestion;
import com.bixin.utils.DataSourceUtils;


public class QuestionDaoImpl implements IDaoQuestion {
	private QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource()); 
	@Override
	public List<Question> selectByCategory(String category,int start, int length) {//通过类别查找所有
		List<Question> questions = null;
		String sql = "select * from question where type_id = ? limit ?,?";
		try {
			questions = qr.query(sql, new BeanListHandler<Question>(Question.class),category,start,length);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return questions;
	}
	@Override
	public int addQuestion(Question question) {//往数据库里插入一个问题的方法
		int result = 0;
		String sql = "insert into question values(?,?,?,?)";
		Object[] obj= {question.getQtitle(),question.getQanswer(),question.getQauthor(),question.getType_id()};
		try {
			result = qr.update(sql, obj);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	@Override
	public Question selectByTitle(String qtitle) {//通过名称查询，看是否是重复添加(ajax)
		Question question = null;
		String sql = "select * from question where qtitle = ?";
		try {
			question = qr.query(sql, new BeanHandler<Question>(Question.class),qtitle);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return question;
	}
}
