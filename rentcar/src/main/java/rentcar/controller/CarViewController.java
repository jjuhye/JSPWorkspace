package rentcar.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rentcar.model.RentcarDAO;

public class CarViewController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		String select=request.getParameter("carKind");
//		System.out.println("con.kind"+select);
		String data = request.getParameter("data");
		String text="";
		System.out.println("con.data"+data);
		if(data.equals("recent")||data.equals("차종")) {
			text=RentcarDAO.getInstance().getRecentCar();
			System.out.println("con.text"+text);
		}else if(data.equals("1")) {
			//소형 차 리스트
			text=RentcarDAO.getInstance().viewCarPage("1");
			System.out.println("con.text"+text);
		}else if(data.equals("2")) {
			//중형 차 리스트
			text=RentcarDAO.getInstance().viewCarPage("2");
			System.out.println("con.text"+text);
		}else if(data.equals("3")){
			//대형 차 리스트
			text=RentcarDAO.getInstance().viewCarPage("3");
			System.out.println("con.text"+text);
		}else if(data.equals("4")){
			//전체 차 리스트
			text=RentcarDAO.getInstance().viewCarPage("4");
					System.out.println("con.text"+text);
		}
		request.setAttribute("text",text);
		
		return "carReserveMain";
	}
}
