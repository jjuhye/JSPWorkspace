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
			CarVO car=RentcarDAO.getInstance().getCarData(carNo);
			String kind="";
			if(car.getCategory()==1) {
				kind="소형";
			}else if(car.getCategory()==2) {
				kind="중형";
			}else {
				kind="대형";
			}
			request.setAttribute("car",car);
			request.setAttribute("kind", kind);

		if(request.getParameter("page")==null) {
			return "carReserveView";
		}else{
			return "carReserveView2";
		}
	}
}
