package kr.basic.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class JoinAction
 */
@WebServlet("/Join.do")
public class JoinAction extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("id");
		String pw=request.getParameter("pw");
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String[] hobbies=request.getParameterValues("hobbies");
		String hobby="";
		for(int i=0; i<hobbies.length; i++) {
			hobby+=hobbies[i]+" ";
		}
		
/*		String info[]= {id, pw, name, email, hobby};*/
		Member m=new Member(id, pw, name, email, hobby);
		
		request.setAttribute("info",m);
		
		RequestDispatcher dis= request.getRequestDispatcher("/08_mvc2login/joinPro.jsp");
		dis.forward(request, response);
		
	}

}
