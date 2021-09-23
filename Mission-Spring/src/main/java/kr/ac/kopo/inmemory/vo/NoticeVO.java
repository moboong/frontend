package kr.ac.kopo.inmemory.vo;

public class NoticeVO {
	String receiver;
	String type;
	String direction;
	
	public NoticeVO() {
		super();
	}
	
	
	public NoticeVO(String receiver, String type, String direction) {
		super();
		this.receiver = receiver;
		this.type = type;
		this.direction = direction;
	}


	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getDirection() {
		return direction;
	}
	public void setDirection(String direction) {
		this.direction = direction;
	}

	@Override
	public String toString() {
		return "NoticeVO [receiver=" + receiver + ", type=" + type + ", direction=" + direction + "]";
	}
	
}
