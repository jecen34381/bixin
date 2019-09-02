package com.bixin.QuestionService.impl;

import java.util.List;

import com.bixin.IServiceQuestion.IServiceQuestion;
import com.bixin.QuestionDao.impl.QuestionDaoImpl;
import com.bixin.Entity.Question;
import com.bixin.IDaoQuestion.IDaoQuestion;


public class QuestionServiceImpl implements IServiceQuestion {
	private IDaoQuestion daoQuestion = new QuestionDaoImpl();
	@Override
	public List<Question> selectByCategory(String category, int start, int length) {//通过类别查找所有
		return daoQuestion.selectByCategory(category,start,length);
	}
	@Override
	public boolean addQuestion(Question question) {//往数据库里插入一个问题的方法
			return daoQuestion.addQuestion(question)>0;
	}
	@Override
	public Question selectByTitle(String qtitle) {//通过名称查询，看是否是重复添加(ajax)
		return daoQuestion.selectByTitle(qtitle);
	}
}
