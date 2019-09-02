package com.bixin.IDaoQuestion;
import java.util.List;
import com.bixin.Entity.Question;
public interface IDaoQuestion {
	public List<Question> selectByCategory(String category,int atart, int length);//查询所有问题的方法
	public int addQuestion(Question question);//添加问题的方法
	public Question selectByTitle(String qtitle);//通过问题名查找
}
