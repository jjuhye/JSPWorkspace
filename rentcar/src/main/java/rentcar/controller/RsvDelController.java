package rentcar.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rentcar.model.RentcarDAO;

public class RsvDelController implements Controller {
	
	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String rno=request.getParameter("rsv_no");
		String cno=request.getParameter("car_no");
		String qt=request.getParameter("qty");
		RentcarDAO.getInstance().rsvDbDelete(rno,cno,qt);

		return "carReserveCfm";
	}
}