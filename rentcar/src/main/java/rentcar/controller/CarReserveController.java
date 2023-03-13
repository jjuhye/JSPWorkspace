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
//		}else if(request.getParameter("page").equals("cfm")) {
//			String id = request.getParameter("id");
//			int carNoI=car.getNo();
//			int qtyI=Integer.parseInt(qty);
//			int dday=Integer.parseInt(request.getParameter("dday"));
//			String rday=(request.getParameter("rday"));
//			int usein=Integer.parseInt(request.getParameter("usein"));
//			int usewifi=Integer.parseInt(request.getParameter("usewifi"));
//			int usenavi=Integer.parseInt(request.getParameter("usenavi"));
//			int useseat=Integer.parseInt(request.getParameter("useseat"));
//			
//			RentcarDAO.getInstance().addRsvDB
//			(carNoI,id,qtyI,dday,rday,usein,usewifi,usenavi,useseat);
//			ArrayList<CarReserveVO> rsv_list=RentcarDAO.getInstance().getListId(id);
//			ArrayList<CarVO> car_list=RentcarDAO.getInstance().getCarList();
//			request.setAttribute("rsv_list", rsv_list);
//			request.setAttribute("car_list", car_list);
//			
//			return "carReserveCfm";
		}else{
			return "carReserveView2";
		}
	}
}
