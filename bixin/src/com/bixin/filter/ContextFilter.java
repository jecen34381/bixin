package com.bixin.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebFilter("*.do")
public class ContextFilter extends HttpFilter{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		super.init(filterConfig);
	}
	
	@Override
	protected void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
//		这样用会使加载页面时，出现加载类型不匹配的错误。
//		错误提示：Resource interpreted as Stylesheet but transferred with MIME type text/html: "http://localhost:8080/bixin/css/bootstrap.min.css".
//		所以如果要过滤需要，指定一种特定格式，而不是所有的都过滤掉
		System.out.println("过滤");
		response.setContentType("text/html;charset=UTF-8");
		chain.doFilter(request, response);
	}
}
