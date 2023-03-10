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
		String kind="";
		if(data.equals("r")) {
			kind="최신형";
		}else if(data.equals("1")) {
			kind="소형";
		}else if(data.equals("2")) {
			kind="중형";
		}else if(data.equals("3")){
			kind="대형";
		}else if(data.equals("a")){
			kind="전체";
		}
		list=RentcarDAO.getInstance().viewCarPage(data);
		
		request.setAttribute("list",list);
		request.setAttribute("kind",kind);
		
		return "carReserveMain";
	}
}
