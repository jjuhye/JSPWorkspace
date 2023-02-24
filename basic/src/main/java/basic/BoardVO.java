package basic;

public class BoardVO {
	
	private int no;
	private String name;
	private String date;
	private String title;
	private String content;
	
	public BoardVO() {}
	
	public BoardVO(int no, String name, String date, String title, String content) {
		super();
		setNo(no);
		setName(name);
		setDate(date);
		setTitle(title);
		setContent(content);
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
}
