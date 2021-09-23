package kr.ac.kopo.admin.vo;

public class ConditionVO {
	
	private int no;
	private String type;
	private String code;
	private int top;
	private int var;
	
	public ConditionVO() {
		super();
	}

	public ConditionVO(int no, int top, int var) {
		super();
		this.no = no;
		this.top = top;
		this.var = var;
	}


	public int getNo() {
		return no;
	}



	public void setNo(int no) {
		this.no = no;
	}



	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public int getTop() {
		return top;
	}

	public void setTop(int top) {
		this.top = top;
	}

	public int getVar() {
		return var;
	}

	public void setVar(int var) {
		this.var = var;
	}



	@Override
	public String toString() {
		return "ConditionVO [no=" + no + ", type=" + type + ", code=" + code + ", top=" + top + ", var=" + var + "]";
	}
	
}
