package kr.ac.kopo.signal.vo;

public class ForeignVO {
	private String regDate;
	private int retail;
	private int foreigns;
	private int institutional;
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public int getRetail() {
		return retail;
	}
	public void setRetail(int retail) {
		this.retail = retail;
	}
	public int getForeigns() {
		return foreigns;
	}
	public void setForeigns(int foreigns) {
		this.foreigns = foreigns;
	}
	public int getInstitutional() {
		return institutional;
	}
	public void setInstitutional(int institutional) {
		this.institutional = institutional;
	}
	@Override
	public String toString() {
		return "ForeignVO [regDate=" + regDate + ", retail=" + retail + ", foreigns=" + foreigns + ", institutional="
				+ institutional + "]";
	}
	public ForeignVO() {
		super();
	}
	public ForeignVO(String regDate, int retail, int foreigns, int institutional) {
		super();
		this.regDate = regDate;
		this.retail = retail;
		this.foreigns = foreigns;
		this.institutional = institutional;
	}
	
	
}
