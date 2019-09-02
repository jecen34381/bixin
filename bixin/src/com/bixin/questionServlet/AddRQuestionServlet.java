package com.bixin.questionServlet;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bixin.IServiceQuestion.IServiceQuestion;
import com.bixin.QuestionService.impl.QuestionServiceImpl;
import com.bixin.Entity.Question;
@WebServlet("/addQuestionServlet")
public class AddRQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IServiceQuestion serviceQuestion = new QuestionServiceImpl();
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String op = request.getParameter("op");
		switch (op) {
		case "addQuestion":
			addQuestion(request, response);
			break;
		case "checkExists":
			checkExists(request,response);
			break;
		default:
			break;
		}
	}
	private void checkExists(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{//检查添加的问题是否重复的方法
		PrintWriter out = response.getWriter();
		String qtitle = request.getParameter("qtitle");
		Question question = serviceQuestion.selectByTitle(qtitle);
		if (question != null) {
			out.write("这道题已经被添加过了哦，不过还是感谢你的热情贡献");
		}
	}
	private void addQuestion(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {//添加问题的方法
		Question question = new Question();
		PrintWriter out = response.getWriter();
		String questionName = request.getParameter("questionName");
		String questionAnswer = request.getParameter("questionAnswer");
		String questionAuthor = request.getParameter("questionAuthor");
		String type = request.getParameter("type");
		question.setQtitle(questionName);
		question.setQanswer(questionAnswer);
		question.setQauthor(questionAuthor);
		switch (type) {
		case "1":
			question.setType_id("java");
			break;
		case "2":
			question.setType_id("html");
			break;
		case "3":
			question.setType_id("javaScript");
			break;
		case "4":
			question.setType_id("python");
			break;
		default:
			break;
		}
		boolean result = serviceQuestion.addQuestion(question);
		if (result) {
			out.write("添加成功了，非常感谢你的贡献<a href='/bixin/admin/questionBoard/showQuestion.jsp'>回到问题页面</a>");
		}
	}
}

