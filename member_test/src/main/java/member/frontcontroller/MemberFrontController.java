package member.frontcontroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.controller.Controller;

@WebServlet("*.do")
public class MemberFrontController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String url=request.getRequestURI();
		String ctx=request.getContextPath();
		String command=url.substring(ctx.length());
		System.out.println(command);
		HandlerMapping mapping=new HandlerMapping();
		Controller controller=mapping.getController(command);
		String nextPage=controller.requestHandler(request, response);
		
		if(nextPage!=null) {
			if(nextPage.indexOf("rediret:")!=-1) {
				response.sendRedirect(nextPage.split(":")[1]);
			}else {
				RequestDispatcher rd=request.getRequestDispatcher(ViewResolver.makeView(nextPage));
				rd.forward(request, response);
			}
		}
	}
}
