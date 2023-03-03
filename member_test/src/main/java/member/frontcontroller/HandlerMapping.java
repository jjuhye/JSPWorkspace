package member.frontcontroller;

import java.util.HashMap;

import member.controller.Controller;

public class HandlerMapping {
	private HashMap<String, Controller> mapping;
	public HandlerMapping() {
		mapping=new HashMap<String, Controller>();
		mapping.put("/memberList.do", new MemberListController());
//		mapping.put("/memberInsert.do", new MemberInsertController());
//		mapping.put("/memberContent.do", new MemberContentController());
//		mapping.put("/memberUpdate.do", new MemberUpdateController());
//		mapping.put("/memberDelete.do", new MemberDeleteController());
//		mapping.put("/memberLogin.do", new MemberLoginController());
//		mapping.put("/memberLogout.do", new MemberLogoutController());
//		mapping.put("/vaildIdAjax.do", new VaildIdAjaxController());
	}
	
	public Controller getController(String key) {
		return mapping.get(key);
	}
}
