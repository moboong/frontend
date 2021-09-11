package kr.ac.kopo.signal.vo;

public class CustomVO {
	
	private String no;
	private String size;
	
	public CustomVO() {
		super();
	}
	
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}

	@Override
	public String toString() {
		return "CustomVO [no=" + no + ", size=" + size + "]";
	}
}
