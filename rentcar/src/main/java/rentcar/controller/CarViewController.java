package rentcar.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rentcar.model.CarVO;
import rentcar.model.RentcarDAO;

public class CarViewController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ArrayList<CarVO> list = new ArrayList<CarVO>();
		String data = request.getParameter("data");
		String kind=RentcarDAO.getInstance().getCarKind(data);
		list=RentcarDAO.getInstance().viewCarPage(data);
		
		request.setAttribute("list",list);
		request.setAttribute("kind",kind);
		
		return "carReserveMain";
	}
}
