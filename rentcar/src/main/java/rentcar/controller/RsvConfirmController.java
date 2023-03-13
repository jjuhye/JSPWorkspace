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
			
	    	int n = 0;
	    	ArrayList<CarReserveVO> list=RentcarDAO.getInstance().getRsvList();
	    	n=list.size()==0?1:list.get(list.size()-1).getReserve_seq()+1;
			
			RentcarDAO.getInstance().addRsvDB
			(n,carNoI,id,qtyI,dday,rday,usein,usewifi,usenavi,useseat);
			ArrayList<CarReserveVO> rsv_list=RentcarDAO.getInstance().getListId(id);
			ArrayList<CarVO> car_list=RentcarDAO.getInstance().getCarList();
			request.setAttribute("rsv_list", rsv_list);
			request.setAttribute("car_list", car_list);
			
			return "carReserveCfm";
		}
	}
}
