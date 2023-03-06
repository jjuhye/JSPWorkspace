package rentcar.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rentcar.model.RentcarDAO;

public class MemberLoginController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id=request.getParameter("id");
		String pw=request.getParameter("pw");
		System.out.println(id+" "+pw);
		if(request.getParameter("id")==null || request.getParameter("pw")==null) {
			return "memberLogin";
		}
		String ctx=request.getContextPath();
		
		if(RentcarDAO.getInstance().checkIdPw(id, pw)) {
			HttpSession session = request.getSession();
			session.setAttribute("log", id);
			return "redirect:"+ctx+"/main.do";
		}else {
			return "redirect:"+ctx+"/memberLogin.do";
		}
	}
	

}
