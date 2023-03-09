package rentcar.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rentcar.model.RentcarDAO;

public class CarReserveController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String no = request.getParameter("no");
		
		System.out.println(no);
		return "carReserveMain";
		
//		String rsvd = request.getParameter("rsvStep");
//		String no = request.getParameter("no");
//		HttpSession session=request.getSession();
//		String id=(String)session.getAttribute("id");
//		if(id==null) {
//			return "carReserveView";
//		}
//		if(rsvd.equals("done")) {
//			text=RentcarDAO.get
//			예약확인 화면으로
//		}else if(rsvd.equals("option")) {
			// 옵션 선택 화면
//		}else {
//			RentcarDAO.getInstance().getCar();
//		}
		
//		String text="";
//		System.out.println("con.data"+data);
//		if(data.equals("recent")||data.equals("차종")) {
//			text=RentcarDAO.getInstance().getRecentCar();
//			System.out.println("con.text"+text);
//		}else if(data.equals("1")) {
//			//소형 차 리스트
//			text=RentcarDAO.getInstance().viewCarPage("1");
//			System.out.println("con.text"+text);
//		}else if(data.equals("2")) {
//			//중형 차 리스트
//			text=RentcarDAO.getInstance().viewCarPage("2");
//			System.out.println("con.text"+text);
//		}else if(data.equals("3")){
//			//대형 차 리스트
//			text=RentcarDAO.getInstance().viewCarPage("3");
//			System.out.println("con.text"+text);
//		}else if(data.equals("4")){
//			//전체 차 리스트
//			text=RentcarDAO.getInstance().viewCarPage("4");
//					System.out.println("con.text"+text);
//		}
//		request.setAttribute("text",text);
//		
//		return "carReserveView";
	}
}
