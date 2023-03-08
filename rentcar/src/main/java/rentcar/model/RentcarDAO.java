package rentcar.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class RentcarDAO {
	private RentcarDAO() {}
	
	private static RentcarDAO instance=new RentcarDAO();
	public static RentcarDAO getInstance() {
		return instance;
	}
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public void getConnect() {
		String URL="jdbc:mysql://localhost:3306/rentcardb?characterEncoding=UTF-8&serverTimezone=UTC";
		String user="root";
		String password="root";
		
		try {
			  Class.forName("com.mysql.cj.jdbc.Driver");		  
			  conn=DriverManager.getConnection(URL, user, password);
			  System.out.println("db 연동성공: " + conn );
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void dbClose() {
		try {
			if(rs!=null)rs.close();
			if(ps!=null)ps.close();
			if(conn!=null)conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<MemberVO> memberList(){
		String SQL="select * from member";
		getConnect();
		ArrayList<MemberVO> list=new ArrayList<MemberVO>();
		try {
			ps=conn.prepareStatement(SQL);
			rs=ps.executeQuery();
			while(rs.next()) {
				String id=rs.getString("id");
				String pw=rs.getString("pw");
				String email=rs.getString("email");
				String tel=rs.getString("tel");
				String hobby=rs.getString("hobby");
				String job=rs.getString("job");
				int age=rs.getInt("age");
				String info=rs.getString("info");
				MemberVO vo=new MemberVO(id,pw,email,tel,hobby,job,age,info);
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return list;
	}
	
	public int checkIdPw(String id, String pw) {
		ArrayList<MemberVO> list=memberList();
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).getId().equals(id) && list.get(i).getPw().equals(pw)) {
				return 1;
			}
		}
		return 0;
	}
	
	public int getMemberNo(String id) {
		 String SQL="select num from member where id=?";
		 getConnect();

		 try {
		   ps=conn.prepareStatement(SQL);
		   ps.setString(1, id);
			rs=ps.executeQuery();
			 if(rs.next()) {
				 return rs.getInt("num");
			 }
		 } catch (Exception e) {
			e.printStackTrace();
		 }finally {
			dbClose();
		}	   
		 return -1;
	}
	
	public String getRecentCar() {
		String carData="<h2 class=\"py-3\"style=\"color: gray\">최신형 자동차</h2>"
					 + "<div class=\"row row-cols-1 px-5 row-cols-md-3 g-4\">";
		
		String SQL="select * from rentcar order by no desc limit 3";
		getConnect();
		try {
		   ps=conn.prepareStatement(SQL);
		   rs=ps.executeQuery();
			while(rs.next()) {
				int no=rs.getInt("no");
				String img=rs.getString("img");
				String name =rs.getString("name");
				int usepeople=rs.getInt("usepeople");
				carData+="<div class=\"col\">"
						+"<div class=\"card p-2 h-100\" onclick=\"location.href='reserve.do?no="+no+"\'\" style=\"cursor:pointer\">"
						+"<img src=\"img/"+img+"\" style=\"width: 100%\" class=\"card-img-top\">"
						+"<div class=\"card-body\"><h5>"+name+"</h5>"
						+"<p class=\"card-text\">대여 가능 차량 : "+usepeople+"대</p></div></div></div>";
				System.out.println(carData);
			}
			return carData;
		 } catch (Exception e) {
			e.printStackTrace();
		 }finally {
			dbClose();
		}
		return null;
	}
	
	public String viewCarPage(String kindNo) {
		String kind="";
		if(kindNo.equals("1")) {
			kind="소형 ";
		}else if(kindNo.equals("2")) {
			kind="중형 ";
		}else if(kindNo.equals("3")) {
			kind="대형 ";
		}else {
			kind="전체 ";
			kindNo="4";
		}
		String carData="<h2 class=\"py-3\"style=\"color: gray\">" + kind + "자동차</h2>"
					 + "<div class=\"row row-cols-1 px-5 row-cols-md-3 g-4\">";
		String SQL="";
		
		getConnect();
		try {
			if(kindNo.equals("4")){
				SQL="select * from rentcar order by no desc";
				ps=conn.prepareStatement(SQL);
			} else {
				SQL="select * from rentcar where category=? order by no desc";
				ps=conn.prepareStatement(SQL);
				ps.setString(1, kindNo);
			}
		   rs=ps.executeQuery();
			while(rs.next()) {
				int no=rs.getInt("no");
				String img=rs.getString("img");
				String name =rs.getString("name");
				int usepeople=rs.getInt("usepeople");
				carData+="<div class=\"col\">"
						+"<div class=\"card p-2 h-100\" onclick=\"location.href='reserve.do?no="+no+"\'\" style=\"cursor:pointer\">"
						+"<img src=\"img/"+img+"\" style=\"width: 100%\" class=\"card-img-top\">"
						+"<div class=\"card-body\"><h5>"+name+"</h5>"
						+"<p class=\"card-text\">대여 가능 차량 : "+usepeople+"대</p></div></div></div>";
				System.out.println(carData);
			}
			return carData;
		 } catch (Exception e) {
			e.printStackTrace();
		 }finally {
			dbClose();
		}
		return null;
	}
	
	public ArrayList<CarVO> carList() {
	ArrayList<CarVO> list=new ArrayList<CarVO>();
	String SQL="select * from rentcar order by no desc";
	getConnect();
	try {
	   ps=conn.prepareStatement(SQL);
	   rs=ps.executeQuery();
		while(rs.next()) {
			int no=rs.getInt("no");
			String name =rs.getString("name");
			int category=rs.getInt("category");
			int price=rs.getInt("price");
			int usepeople=rs.getInt("usepeople");
			String company=rs.getString("company");
			String img=rs.getString("img");
			String info=rs.getString("info");
			
			CarVO vo=new CarVO(no,name,category,price,usepeople,company,img,info);
			list.add(vo);
			}
			return list;
		 } catch (Exception e) {
			e.printStackTrace();
		 }finally {
			dbClose();
		}
		return null;
	}
	
	//////////////
}
