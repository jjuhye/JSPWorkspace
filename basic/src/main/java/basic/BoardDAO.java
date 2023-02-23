package basic;

import java.time.LocalDate;
import java.util.ArrayList;

public class BoardDAO {
	
	int number=0;
	private ArrayList<BoardVO> boardList;
	private BoardDAO() {
		boardList= new ArrayList<BoardVO>();
		setDummy();
	}
	
	static private BoardDAO instance = new BoardDAO();
	static public BoardDAO getInstance() {
		return instance;
	}
	
	private void setDummy() {
		boardList.add(new BoardVO(1,"작성자1","제목1","내용1","2022-02-01"));
		boardList.add(new BoardVO(2,"작성자2","제목2","내용2","2022-02-02"));
		boardList.add(new BoardVO(3,"작성자3","제목3","내용3","2022-02-03"));	
	}
	
	private int getNo() {
		number=boardList.size();
		number++;
		return number;
	}
	
	//리스트 전송
	public ArrayList<BoardVO> getList(){
		return boardList;
	}
	
	//게시글 생성
	public void newBoard(String name, String title, String content) {
		BoardVO b=new BoardVO();
		b.setNo(getNo());
		b.setName(name);
		b.setDate(""+LocalDate.now());
		b.setTitle(title);
		b.setContent(content);
	}
	
//	//멤버 목록 생성
//	public String[][] memberList() {
//		String[][] member=new String[list.size()][4];
//		for(int i=0; i<list.size(); i++) {
//			member[i][0]=list.get(i).getId();
//			member[i][1]=list.get(i).getPw();
//			member[i][2]=list.get(i).getName();
//			member[i][3]=list.get(i).getGender();
//		}
//		return member;
//	}
//	
//	//특정 멤버 데이터 전달
//	public String[] memberData(int idx) {
//		String[] memberOne=new String[4];
//		memberOne[0]=list.get(idx).getId();
//		memberOne[1]=list.get(idx).getPw();
//		memberOne[2]=list.get(idx).getName();
//		memberOne[3]=list.get(idx).getGender();
//		return memberOne;
//	}
	
}
