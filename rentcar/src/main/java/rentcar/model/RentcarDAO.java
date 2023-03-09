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
	
	//재고수량 0개 이상인 최근자동차 3대
	public ArrayList<CarVO> getRecentCar() {
		ArrayList<CarVO> list=new ArrayList<CarVO>();
		String SQL="select * from rentcar where usepeople>0 order by no desc limit 3";
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
	
		
	public ArrayList<CarVO> viewCarPage(String kindNo) {
		ArrayList<CarVO> list=new ArrayList<CarVO>();
		String SQL="select * from rentcar where usepeople>0 order by no desc limit 3";
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
	
//	public ArrayList<CarVO> carList() {
//	ArrayList<CarVO> list=new ArrayList<CarVO>();
//	String SQL="select * from rentcar order by no desc";
//	getConnect();
//	try {
//	   ps=conn.prepareStatement(SQL);
//	   rs=ps.executeQuery();
//		while(rs.next()) {
//			int no=rs.getInt("no");
//			String name =rs.getString("name");
//			int category=rs.getInt("category");
//			int price=rs.getInt("price");
//			int usepeople=rs.getInt("usepeople");
//			String company=rs.getString("company");
//			String img=rs.getString("img");
//			String info=rs.getString("info");
//			
//			CarVO vo=new CarVO(no,name,category,price,usepeople,company,img,info);
//			list.add(vo);
//			}
//			return list;
//		 } catch (Exception e) {
//			e.printStackTrace();
//		 }finally {
//			dbClose();
//		}
//		return null;
//	}
	
	//////////////
}
