package rentcar.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rentcar.model.CarReserveVO;
import rentcar.model.CarVO;
import rentcar.model.RentcarDAO;

public class RsvConfirmController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		String id = request.getParameter("id");
		if(request.getParameter("carNo")==null) {
			ArrayList<CarReserveVO> rsv_list=RentcarDAO.getInstance().getListId(id);
			ArrayList<CarVO> car_list=RentcarDAO.getInstance().getCarList();
			request.setAttribute("rsv_list", rsv_list);
			request.setAttribute("car_list", car_list);
			return "carReserveCfm";
		}else {
			String carNo = request.getParameter("carNo");
			String qty = request.getParameter("qty");
			CarVO car=RentcarDAO.getInstance().getCarData(carNo);
			request.setAttribute("car",car);
			int carNoI=car.getNo();
			int qtyI=Integer.parseInt(qty);
			int dday=Integer.parseInt(request.getParameter("dday"));
			String rday=(request.getParameter("rday"));
			int usein=Integer.parseInt(request.getParameter("usein"));
			int usewifi=Integer.parseInt(request.getParameter("usewifi"));
			int usenavi=Integer.parseInt(request.getParameter("usenavi"));
			int useseat=Integer.parseInt(request.getParameter("useseat"));
			
			RentcarDAO.getInstance().addRsvDB
			(carNoI,id,qtyI,dday,rday,usein,usewifi,usenavi,useseat);
			ArrayList<CarReserveVO> rsv_list=RentcarDAO.getInstance().getListId(id);
			ArrayList<CarVO> car_list=RentcarDAO.getInstance().getCarList();
			request.setAttribute("rsv_list", rsv_list);
			request.setAttribute("car_list", car_list);
			
//			if(request.getParameter("rsv_no")!=null) {
//				String rno=request.getParameter("rsv_no");
//				String cno=request.getParameter("car_no");
//				String qt=request.getParameter("qty");
//				RentcarDAO.getInstance().rsvDbDelete(rno,cno,qt);
//			}
			return "carReserveCfm";
		}
	}
}
