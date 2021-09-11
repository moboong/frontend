package kr.ac.kopo.signal.vo;

public class PickrateVO {
	private int g1;
	private int g2;
	private int g3;
	private int g4;
	private int g5;
	private int g6;
	private int g7;
	private int g8;
	private int g9;
	
	public PickrateVO(int g1, int g2, int g3, int g4, int g5, int g6, int g7, int g8, int g9) {
		super();
		this.g1 = g1;
		this.g2 = g2;
		this.g3 = g3;
		this.g4 = g4;
		this.g5 = g5;
		this.g6 = g6;
		this.g7 = g7;
		this.g8 = g8;
		this.g9 = g9;
	}
	
	public void getRate(int all) {
		this.g1 = g1*100/all;
		this.g2 = g2*100/all;
		this.g3 = g3*100/all;
		this.g4 = g4*100/all;
		this.g5 = g5*100/all;
		this.g6 = g6*100/all;
		this.g7 = g7*100/all;
		this.g8 = g8*100/all;
		this.g9 = g9*100/all;
	}

	public int getG1() {
		return g1;
	}

	public void setG1(int g1) {
		this.g1 = g1;
	}

	public int getG2() {
		return g2;
	}

	public void setG2(int g2) {
		this.g2 = g2;
	}

	public int getG3() {
		return g3;
	}

	public void setG3(int g3) {
		this.g3 = g3;
	}

	public int getG4() {
		return g4;
	}

	public void setG4(int g4) {
		this.g4 = g4;
	}

	public int getG5() {
		return g5;
	}

	public void setG5(int g5) {
		this.g5 = g5;
	}

	public int getG6() {
		return g6;
	}

	public void setG6(int g6) {
		this.g6 = g6;
	}

	public int getG7() {
		return g7;
	}

	public void setG7(int g7) {
		this.g7 = g7;
	}

	public int getG8() {
		return g8;
	}

	public void setG8(int g8) {
		this.g8 = g8;
	}

	public int getG9() {
		return g9;
	}

	public void setG9(int g9) {
		this.g9 = g9;
	}

	@Override
	public String toString() {
		return "PickrateVO [g1=" + g1 + ", g2=" + g2 + ", g3=" + g3 + ", g4=" + g4 + ", g5=" + g5 + ", g6=" + g6
				+ ", g7=" + g7 + ", g8=" + g8 + ", g9=" + g9 + "]";
	}
	
}
