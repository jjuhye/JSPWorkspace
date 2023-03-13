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
		int rsvNo=Integer.parseInt(request.getParameter("rsvNo"));
		int carNo=Integer.parseInt(request.getParameter("no"));
		int qty=Integer.parseInt(request.getParameter("qty"));
		RentcarDAO.getInstance().rsvDbDelete(rsvNo,carNo,qty);

		return "carReserveCfm";
	}
}