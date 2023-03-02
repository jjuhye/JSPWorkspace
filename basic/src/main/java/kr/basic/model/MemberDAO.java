package kr.basic.model;

import java.sql.*;
import java.util.ArrayList;

public class MemberDAO {
	
	static private MemberDAO instance = new MemberDAO();
	static public MemberDAO getInstance() {
		return instance;
	}
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public ArrayList<MemberVO> mbList(){
		String SQL="select * from board";
		getConnect();
		ArrayList<MemberVO> list=new ArrayList<MemberVO>();
		try {
			ps=conn.prepareStatement(SQL);
			rs=ps.executeQuery();
			while(rs.next()) {
				int no=rs.getInt("no");
				String id=rs.getString("id");
				String pw=rs.getString("pw");
				String name=rs.getString("name");
				int age=rs.getInt("age");
				String email=rs.getString("email");
				String phone=rs.getString("phone");
				MemberVO vo=new MemberVO(no,id,pw,name,age,email,phone);
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return list;
	}
	
	void setAdmin() {
		String SQL="insert into member(id,pw,name,age,email,phone) values('admin','admin','관리자',30,'test@admin.com','010-1111-1234')";
	}
	
	//아이디 존재 여부확인
	public boolean isID(String id) {
		for(int i=0; i<mbList().size(); i++) {
			if(mbList().get(i).getId().equals(id)) {
				return true;
			}
		}
		return false;
	}
	
	//아이디 인덱스번호 찾기
	public int checkId(String id) {
		for(int i=0; i<mbList().size(); i++) {
			if(mbList().get(i).getId().equals(id)) {
				return i;
			}
		}
		return -1;
	}
	
	//아이디와 비밀번호 일치 여부 확인
	public boolean checkPw(String pw, int idIdx) {
		if(idIdx!=-1) {
			for(int i=0; i<mbList().size(); i++) {
				if(mbList().get(i).getPw().equals(pw) && i==idIdx) {
					return true;
				}
			}
		}
		return false;
	}
	
	//멤버 삭제
	public void delMember(int idx) {
		mbList().remove(idx);
	}
	
//	//멤버 생성
//	public void addMember(String id, String pw, String name,String gender) {
//		mbList().add(new MemberVO(id,pw,name,gender));
//	}
//	
//	//특정 멤버 데이터 전달
//	public String[] memberData(int idx) {
//		String[] memberOne=new String[4];
//		memberOne[0]=mbList().get(idx).getId();
//		memberOne[1]=mbList().get(idx).getPw();
//		memberOne[2]=mbList().get(idx).getName();
//		return memberOne;
//	}
//	
//	//멤버 수정
//	public void updateMember(int idx, String id, String pw, String name,String gender) {
//		MemberVO newMem=new MemberVO(id,pw,name,gender);
//		mbList().set(idx, newMem);
//	}
	
	
	public void getConnect() {
		String URL="jdbc:mysql://localhost:3306/testdb?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";
		String user="root";
		String pw="root";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn=DriverManager.getConnection(URL, user, pw);
			System.out.println("db 연동성공"+conn);
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	void dbClose() {
		try {
			if(rs !=null)	rs.close();
			if(ps !=null) ps.close();
			if(conn !=null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
