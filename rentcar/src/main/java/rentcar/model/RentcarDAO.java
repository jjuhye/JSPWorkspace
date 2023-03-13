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
				String pw=rs.getString("pw1");
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
		System.out.println(id+pw);
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
		
	public ArrayList<CarVO> viewCarPage(String data) {
		ArrayList<CarVO> list=new ArrayList<CarVO>();
		getConnect();
		String SQL="";
		try {
			if(data.equals("r")) {
				SQL="select * from rentcar where usepeople>0 order by no desc limit 3";
				ps=conn.prepareStatement(SQL);
			}else if(data.equals("a")){
				SQL="select * from rentcar order by no desc";
				ps=conn.prepareStatement(SQL);
			}else {
				SQL="select * from rentcar where category=? order by no desc";
				ps=conn.prepareStatement(SQL);
				ps.setString(1, data);
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
	
	public ArrayList<CarVO> getCarList() {
		ArrayList<CarVO> list=new ArrayList<CarVO>();
		getConnect();
		String SQL="select * from rentcar";
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
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return list;
	}
	
	public CarVO getCarData(String carNo) {
		getConnect();
		String SQL="select * from rentcar where no=?";
		CarVO car=null;
		try {
			ps=conn.prepareStatement(SQL);
			ps.setString(1, carNo);
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
				car=new CarVO(no,name,category,price,usepeople,company,img,info);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return car;
	}
	
	public String getCarKind (String category) {
		if(category.equals("r")) {
			return "최신형";
		}else if(category.equals("1")) {
			return "소형";
		}else if(category.equals("2")) {
			return "중형";
		}else if(category.equals("3")){
			return "대형";
		}else {
			return "전체";
		}
	}
	

	
	//예약 개별 vo데이터
	public CarReserveVO getRsvdDB(String seqNo) {
		getConnect();
		String SQL="select * from carreserve where reserve_seq=?";
		CarReserveVO vo=null;
		try {
			ps=conn.prepareStatement(SQL);
			ps.setString(1, seqNo);
			rs=ps.executeQuery();
			while(rs.next()) {
				int seqN=Integer.parseInt(seqNo);
				int no=rs.getInt("no");
				String id =rs.getString("id");
				int qty=rs.getInt("qty");
				int dday=rs.getInt("dday");
				String rday=rs.getString("rday");
				int usein=rs.getInt("usein");
				int usewifi=rs.getInt("usewifi");
				int usenavi=rs.getInt("usenavi");
				int useseat=rs.getInt("useseat");
				vo=new CarReserveVO(seqN, no,id,qty,dday,rday,usein,usewifi,usenavi,useseat);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return vo;
	}
	
	public int getMaxRsvNum() {
    	int n = 0;
    	ArrayList<CarReserveVO> list=getRsvList();
    	n=list.size()==0?1:list.size()+1;
    	return n;
    }
	
	//예약 전체 리스트
	public ArrayList<CarReserveVO> getRsvList() {
		String SQL="select * from carreserve";
		getConnect();
		ArrayList<CarReserveVO> list=new ArrayList<CarReserveVO>();
		try {
			ps=conn.prepareStatement(SQL);
			rs=ps.executeQuery();
			while(rs.next()) {
				int reserve_seq=rs.getInt("reserve_seq");
				int no=rs.getInt("no");
				String id =rs.getString("id");
				int qty=rs.getInt("qty");
				int dday=rs.getInt("dday");
				String rday=rs.getString("rday");
				int usein=rs.getInt("usein");
				int usewifi=rs.getInt("usewifi");
				int usenavi=rs.getInt("usenavi");
				int useseat=rs.getInt("useseat");
				CarReserveVO vo=new CarReserveVO(reserve_seq,no,id,qty,dday,rday,usein,usewifi,usenavi,useseat);
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return list;
	}
	
	public void addRsvDB(int revNo, int carNo,String id, int qty, int dday,
		String rday, int usein, int usewifi, int usenavi, int useseat) {
		System.out.println(getMaxRsvNum());
		String SQL="insert into carreserve (reserve_seq,no,id,qty,dday,rday,usein,usewifi,usenavi,useseat) values(?,?,?,?,?,?,?,?,?,?)"; 
		String SQL2="UPDATE rentcar SET usepeople = usepeople -? WHERE no =?";
		getConnect();
		  try {
			  	ps=conn.prepareStatement(SQL); 
				ps.setInt(1, revNo);
				ps.setInt(2, carNo);
				ps.setString(3, id);
				ps.setInt(4, qty);
				ps.setInt(5, dday);
				ps.setString(6, rday);
				ps.setInt(7, usein);
				ps.setInt(8, usewifi);
				ps.setInt(9, usenavi);
				ps.setInt(10, useseat);
				ps.executeUpdate(); 
			  	ps=conn.prepareStatement(SQL2);
			  	ps.setInt(1, qty);
			  	ps.setInt(2, carNo);
			  	ps.executeUpdate(); 
		   }catch (Exception e) {
			e.printStackTrace();
		   }finally {
			   dbClose();
		  }
	}
	
	//아이디별 예약 리스트
	public ArrayList<CarReserveVO> getListId(String userId) {
		String SQL="select * from carreserve where id=?";
		getConnect();
		ArrayList<CarReserveVO> list=new ArrayList<CarReserveVO>();
		try {
			ps=conn.prepareStatement(SQL);
			ps.setString(1, userId);
			rs=ps.executeQuery();
			while(rs.next()) {
				int reserve_seq=rs.getInt("reserve_seq");
				int no=rs.getInt("no");
				String id =rs.getString("id");
				int qty=rs.getInt("qty");
				int dday=rs.getInt("dday");
				String rday=rs.getString("rday");
				int usein=rs.getInt("usein");
				int usewifi=rs.getInt("usewifi");
				int usenavi=rs.getInt("usenavi");
				int useseat=rs.getInt("useseat");
				CarReserveVO vo=new CarReserveVO(reserve_seq,no,id,qty,dday,rday,usein,usewifi,usenavi,useseat);
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return list;
	}
	
		public void rsvDbDelete(int rsvNo, int carNo, int qty) {
		int rno=rsvNo;
		int cno=carNo;
		int qt=qty;
		
		 String SQL="delete from carreserve where reserve_seq=?";
		 String SQL2="UPDATE rentcar SET usepeople = usepeople +? WHERE no =?";
		 
		 getConnect();
		 try {
		   ps=conn.prepareStatement(SQL);
		   ps.setInt(1,rno);
		   ps.executeUpdate();
		   ps=conn.prepareStatement(SQL2);
		   ps.setInt(1,cno);
		   ps.setInt(1,qt);
		   ps.executeUpdate();
		 } catch (Exception e) {
			e.printStackTrace();
		 }finally {
			dbClose();
		}	   
	}
	
}
