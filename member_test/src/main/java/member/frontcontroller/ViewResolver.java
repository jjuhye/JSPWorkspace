package member.frontcontroller;

public class ViewResolver {
	public static String makeView(String nextPage) {
		return "/WEB-INT/member/"+nextPage+".jsp";
	}
}
