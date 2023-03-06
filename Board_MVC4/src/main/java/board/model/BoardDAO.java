package board.model;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;

public class BoardDAO {
	
	private BoardDAO() {	}
	
	static private BoardDAO instance = new BoardDAO();
	
	static public BoardDAO getInstance() {
	return instance;
	}
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
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
	
	//게시글 데이터에 추가
	public int addBoard(BoardVO vo) {
		String SQL="insert into board(name,regDate,title,content) values(?,?,?,?);";
		getConnect();
		
		int cnt=-1;
		try {
			ps=conn.prepareStatement(SQL); //미리 컴파일을 시킨다.(속도가빠르기)
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getRegDate());
			ps.setString(3, vo.getTitle());
			ps.setString(4, vo.getContent());
			cnt=ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return cnt;
	}
	
	//bordList 전달
	public ArrayList<BoardVO> boardList() {
		String SQL="select * from board";
		getConnect();
		ArrayList<BoardVO> list=new ArrayList<BoardVO>();
		try {
			ps=conn.prepareStatement(SQL);
			rs=ps.executeQuery(); 
			while(rs.next()) {
				int num=rs.getInt("num");
				String name =rs.getString("name");
				String regDate =rs.getString("regDate");
				String title =rs.getString("title");
				String content =rs.getString("content");
				
				BoardVO vo=new BoardVO(num, name, regDate, title, content);
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return list;
	}

	
	//게시글 가져오기
	public BoardVO readBoard(int no) {
		int idx=getIdx(no);
		 return boardList().get(idx);
	}
	
	//게시글 수정하기
	public void updateBoard(int no, String title, String content) {
		
		String SQL="update board set title=?,content=? where num=?";
		getConnect();
		try {
			ps=conn.prepareStatement(SQL);
			ps.setString(1,title);
			ps.setString(2,content);
			ps.setInt(3,no);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
	}
	
	//Dummy게시글 생성
	public void addDummy() {
		BoardVO dummy;
		for(int i=0; i<5; i++) {
			dummy=new BoardVO();
			dummy.setName("테스트"+i);
			dummy.setRegDate("2022-02-22");
			dummy.setTitle("제목"+i);
			dummy.setContent("내용"+i);
			
			addBoard(dummy);
		}
	}
	
	//게시글 생성
	public void newBoard(String name, String title, String content) {
		BoardVO vo=new BoardVO();
		vo.setName(name);
		vo.setTitle(title);
		vo.setContent(content);
		vo.setRegDate(""+LocalDate.now());
		addBoard(vo);
	}
	
	//다음글 번호 출력
	public int getCurrentNo() {
		int no=0;
		String SQL="select max(num) from board";
		getConnect();
		try {
			ps=conn.prepareStatement(SQL);
			rs=ps.executeQuery();
		   if(rs.next()) {
			   no = rs.getInt(1);
		   }
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return no+1;
	}
	
	//게시글 삭제
	public void delBoard(int no) {
		String SQL="delete from board where num=?";
		getConnect();
		try {
			ps=conn.prepareStatement(SQL);
			ps.setInt(1,no);
			ps.executeUpdate(); 
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
	}
	
	//게시글 전체 삭제
	public void delAllBoard() {
		String SQL="delete from board";
		getConnect();
		try {
			ps=conn.prepareStatement(SQL);
			ps.executeUpdate(); 
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
	}
	
//인덱스 번호 찾기	
	public int getIdx (int no) {
		for(int i=0; i<boardList().size(); i++) {
			if(boardList().get(i).getNo()==no) {
				return i;
			}
		}
		return -1;
	}
	//////////////////////////////////////////////////////////////
	
	public ArrayList<BoardVO> getPageData(String curPage) {
		ArrayList<BoardVO> showList = new ArrayList<BoardVO>();
		int count = boardList().size();
		int limit = 5;
		int pageNo = 0;
		if(curPage== null) {
			pageNo =1;
		}else {
			pageNo = Integer.parseInt(curPage);
		}
		
		int start = (pageNo-1)* limit;
		int end = start + limit;
		if(end > count) {
			end = count;
		}
		// end 포함하면 안됨 index 이기 때문에 0~end 전까지 
		for(int i = start; i <end;i++) {
			showList.add(boardList().get(i));
		}
		return showList;
	}
	
	public int[] addPageNextBefore(String end) {
		int count = boardList().size();
		int limit = 5;
		int totalPageNum = count/ limit;
		if(count%limit != 0 ) {
			totalPageNum++;
		}
		int pageLimit = 3;
		int startPage = 1;

		if(end != null) {
			startPage = Integer.parseInt(end);
		}
		// 3 + 3 => 6  -1    --->   3 4 5  
		//               1 +3 => 4 -1 = 3 
		int endPage = startPage + pageLimit -1;
		if(endPage > totalPageNum) {
			endPage = totalPageNum;
		}
		int[] nums = {startPage, endPage, pageLimit,totalPageNum};
		return nums;
	}
	
}
