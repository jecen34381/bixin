package com.bixin.IServiceQuestion;
import java.util.List;
import com.bixin.Entity.Question;
public interface IServiceQuestion {
	public List<Question> selectByCategory(String category,int start,int length);//查询所有问题的方法
	public boolean addQuestion(Question question);//添加问题的方法
	public Question selectByTitle(String qtitle);//通过问题名查找
}
