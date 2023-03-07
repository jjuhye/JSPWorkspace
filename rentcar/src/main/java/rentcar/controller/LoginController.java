package rentcar.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rentcar.model.RentcarDAO;

public class LoginController implements Controller {
	
	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		int check = RentcarDAO.getInstance().checkIdPw(id, pw);// 사용자인증처리 메소드

		if(check==1) {
			HttpSession session = request.getSession();
			session.setAttribute("id", id);
		}
		response.getWriter().print(check);
		
		return null;
	}
}