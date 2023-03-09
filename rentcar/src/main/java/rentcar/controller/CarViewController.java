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
		if(data.equals("recent")) {
			list=RentcarDAO.getInstance().getRecentCar();
			request.setAttribute("kind","최신형");
		}else if(data.equals("1")) {
			//소형 차 리스트
			list=RentcarDAO.getInstance().viewCarPage("1");
			request.setAttribute("kind","소형");
		}else if(data.equals("2")) {
			//중형 차 리스트
			list=RentcarDAO.getInstance().viewCarPage("2");
			request.setAttribute("kind","중형");
		}else if(data.equals("3")){
			//대형 차 리스트
			list=RentcarDAO.getInstance().viewCarPage("3");
			request.setAttribute("kind","대형");
		}else if(data.equals("4")){
			//전체 차 리스트
			list=RentcarDAO.getInstance().viewCarPage("4");
			request.setAttribute("kind","전체");
		}
		request.setAttribute("list",list);
		
		return "carReserveMain";
	}
}
