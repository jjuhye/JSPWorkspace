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
		boardList.add(new BoardVO(newNo(),"작성자1","2022-02-01","제목1","내용1"));
		boardList.add(new BoardVO(newNo(),"작성자2","2022-02-02","제목2","내용2"));
		boardList.add(new BoardVO(newNo(),"작성자3","2022-02-03","제목3","내용3"));	
	}
	
	public void addDummy() {
		for(int i=0; i<10; i++) {
			int num=newNo();
			boardList.add(new BoardVO(num,"작성자"+num,"2022-02-22","제목"+num,"내용"+num));
		}
	}
	
	public int newNo() {
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
		b.setNo(newNo());
		b.setName(name);
		b.setDate(""+LocalDate.now());
		b.setTitle(title);
		b.setContent(content);
	}
	
	//게시글 삭제
	public void delBoard(String no) {
		int delNo=Integer.parseInt(no);
		for (int i = 0; i < boardList.size(); i++) {
			if(boardList.get(i).getNo()==delNo) {
				boardList.remove(i);
			}
		}
	}
	
	public void delAllBoard() {
		boardList= new ArrayList<BoardVO>();
		number=0;
	}
	
}
