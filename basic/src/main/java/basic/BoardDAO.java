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
	
	public int getNo() {
		return number+1;
	}
	
	public int getSize() {
		return boardList.size();
	}
	
	//리스트 전송
	public ArrayList<BoardVO> getList(){
		return boardList;
	}
	
	//게시글 생성
	public void newBoard(String name, String title, String content) {
		String date=""+LocalDate.now();
		boardList.add(new BoardVO(newNo(),name,date,title,content));
	}
	
	//게시글 삭제
	public void delBoard(int idx) {
		boardList.remove(idx);
	}
	
	public void delAllBoard() {
		boardList= new ArrayList<BoardVO>();
		number=0;
	}
	
	public void updateBoard(int idx, String title, String content) {
		boardList.get(idx).setTitle(title);
		boardList.get(idx).setContent(content);
	}
	
	public String[] readBoard (int idx) {
		String[] board=new String[5];
			board[0]=boardList.get(idx).getNo()+"";
			board[1]=boardList.get(idx).getName();
			board[2]=boardList.get(idx).getDate();
			board[3]=boardList.get(idx).getTitle();
			board[4]=boardList.get(idx).getContent();
			return board;
	}
	
	public int getIdx (String no) {
		for(int i=0; i<boardList.size(); i++) {
			if(boardList.get(i).equals(no)) {
				return i;
			}
		}
		return -1;
	}
	
	public ArrayList<BoardVO> getPageData(String curPageNo) {
		ArrayList<BoardVO> showList = new ArrayList<BoardVO>();
		int count = boardList.size();
		int limit = 5;
		int pageNo = 0;
		if(curPageNo== null) {
			pageNo =1;
		}else {
			pageNo = Integer.parseInt(curPageNo);
		}
		
		int start = (pageNo-1)* limit;
		int end = start + limit;
		if(end > count) {
			end = count;
		}
		// end 포함하면 안됨 index 이기 때문에 0~end 전까지 
		for(int i = start; i <end;i++) {
			showList.add(boardList.get(i));
		}
		return showList;
	}
	
	public int[] addPageNextBefore(String end) {
		int count = boardList.size();
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
