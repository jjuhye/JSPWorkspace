package member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.MemberDAO;
import member.model.MemberVO;

public class MemberListcontroller implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ArrayList<MemberVO> list=MemberDAO.getInstance().memberList();
		
		request.setAttribute("list", list);
		HttpSession session=request.getSession();
		if(session.getAttribute("log")!=null) {
			String id=(String)session.getAttribute("log");
			int num=MemberDAO.getInstance().getMemberNo(id);
			request.setAttribute("num",num);
		}else {
			request.setAttribute("num", null);
		}
		
		return null;
	}

	
	
}
