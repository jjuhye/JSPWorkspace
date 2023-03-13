package rentcar.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rentcar.model.CarVO;
import rentcar.model.RentcarDAO;

public class CarReserveController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String carNo = request.getParameter("carNo");
		String qty = request.getParameter("qty");
			CarVO car=RentcarDAO.getInstance().getCarData(carNo);
			String kind=RentcarDAO.getInstance().getCarKind(car.getCategory()+"");
			request.setAttribute("car",car);
			request.setAttribute("kind", kind);
			request.setAttribute("qty", qty);
		if(request.getParameter("page")==null) {
			return "carReserveView";
		}else{
			return "carReserveView2";
		}
	}
}
