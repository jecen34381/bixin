package com.bixin.questionServlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bixin.IServiceQuestion.IServiceQuestion;
import com.bixin.QuestionService.impl.QuestionServiceImpl;
import com.bixin.Entity.Question;
import com.google.gson.Gson;
@WebServlet("/showQuestionServlet")
public class ShowQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IServiceQuestion serviceQuestion = new QuestionServiceImpl();
	Gson gson = new Gson();
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String option = request.getParameter("option");
		String category = request.getParameter("category");
		//判定是否是点击分页列表进行查询
		if(option.equals("pageList")) {
			Integer start = Integer.parseInt(request.getParameter("start"));
			System.out.println(start);
			List<Question> questions = serviceQuestion.selectByCategory(category,start * 5,5);
			String question = gson.toJson(questions);
			out.write(question);
			return;
		}
		
		List<Question> questions = serviceQuestion.selectByCategory(category,0,5);
		String question = gson.toJson(questions);
		out.write(question);
	}
}

