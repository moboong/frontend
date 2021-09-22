package kr.ac.kopo.board.vo;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;

public class BoardVO {
	
	private int no;
	
	@NotEmpty(message = "(종류)필수항목입니다")
	private String type;
	
	@Length(min=2, max=40, message = "최소 2글자 최대 40글자만 사용가능합니다")
	@NotEmpty(message = "(제목)필수항목입니다")
	private String title;
	
	@Pattern(regexp = "^[A-Za-z0-9]*$", message = "특수기호 사용 불가")
	@NotEmpty(message = "(작성자)필수항목입니다")
	private String writer;
	
	@NotEmpty(message = "(내용)필수항목입니다")
	private String content;
	
	private int viewCnt;
	
	private String regDate;
	
	private int replyCnt;
	private String fileSaveName;
	
	public String getFileSaveName() {
		return fileSaveName;
	}

	public void setFileSaveName(String fileSaveName) {
		this.fileSaveName = fileSaveName;
	}

	public BoardVO() {
		super();
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getViewCnt() {
		return viewCnt;
	}

	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public int getReplyCnt() {
		return replyCnt;
	}

	public void setReplyCnt(int replyCnt) {
		this.replyCnt = replyCnt;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "BoardVO [no=" + no + ", type=" + type + ", title=" + title + ", writer=" + writer + ", content="
				+ content + ", viewCnt=" + viewCnt + ", regDate=" + regDate + ", replyCnt=" + replyCnt
				+ ", fileSaveName=" + fileSaveName + "]";
	}

}
