package kr.ac.kopo.reply.vo;

import javax.validation.constraints.NotEmpty;

public class ReplyVO {
	
	private int no;
	
	private int boardNo;
	
	//@Pattern(regexp = "^[A-Za-z0-9]*$", message = "특수기호 사용 불가")
	@NotEmpty(message = "(내용)필수항목입니다")
	private String content;
	
	@NotEmpty(message = "(작성자)필수항목입니다")
	private String writer;
	
	private String regDate;

	public ReplyVO() {
		super();
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "ReplyVO [no=" + no + ", boardNo=" + boardNo + ", content=" + content + ", writer=" + writer
				+ ", regDate=" + regDate + "]";
	}
	
	
	
	
}
