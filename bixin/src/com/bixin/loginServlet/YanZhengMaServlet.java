package com.bixin.loginServlet;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Random;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/image")
public class YanZhengMaServlet extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//生成验证码
	
		String code = generateCode();
		request.getSession().setAttribute("generatecode", code);
		//创建同一个彩色图片，宽100 高30像素
		BufferedImage bi = new BufferedImage(100, 30, BufferedImage.TYPE_INT_BGR);
		Graphics gc = bi.getGraphics();
		//背景
		gc.setColor(Color.blue);
		gc.fillRect(0, 0, 100, 30);
		
		//写字
		gc.setColor(Color.white);//设置字体颜色
		
		gc.setFont(new Font(Font.SANS_SERIF,Font.BOLD,20));
		
		gc.drawString(code, 18, 20);
		
		//向响应体输出，使用字节流
		
		ServletOutputStream os = response.getOutputStream();
		
		ImageIO.write(bi, "jpg", os);
		
	}
	public String generateCode() {
		ArrayList<Character> list = new ArrayList<Character>();
		for(char i = 'a'; i < 'z' ;i++) {
			list.add(i);
			list.add((char)(i-32));
			if (i <= 'j') {
				list.add((char)(i-49));
			}
		}
		//随机取四个
		char[] chs = new char[4];
		Random r = new Random();
		for(int i = 0; i < chs.length; i++) {
			chs[i] = list.remove(r.nextInt(list.size()));
			//从list数组中随机取一个赋给char数组，然后再给他移除掉
		}
		return new String(chs);
	}
}
