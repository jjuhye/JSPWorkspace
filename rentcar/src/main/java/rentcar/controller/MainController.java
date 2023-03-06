package rentcar.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rentcar.frontcontroller.ViewResolver;

public class MainController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String center=request.getParameter("center");
		
		if(center==null) {
			center="center";
		}
		center=ViewResolver.makeView(center);
		request.setAttribute("center", center);
		return "carMain";
	}
	
	

}
