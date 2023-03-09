package rentcar.frontcontroller;

import java.util.HashMap;

import rentcar.controller.*;

public class HandlerMapping {
	private HashMap<String, Controller> mapping;
	public HandlerMapping() {
		mapping=new HashMap<String, Controller>();
		mapping.put("/main.do", new MainController());
		mapping.put("/login.do", new LoginController());
		mapping.put("/logout.do", new LogoutController());
		mapping.put("/carView.do", new CarViewController());
		mapping.put("/reserve.do", new CarReserveController());
		/* mapping.put("/rsvCheck.do", new CarReserveController()); */
	}
	
	public Controller getController(String key) {
		return mapping.get(key);
	}
}
