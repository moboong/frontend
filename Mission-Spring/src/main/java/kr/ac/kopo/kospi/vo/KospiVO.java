package kr.ac.kopo.kospi.vo;

public class KospiVO {
	private String regDate;
	private double endPrice;
	private double variation;

	private double nasPrice;

	public KospiVO() {
		super();
	}

	public double getNasPrice() {
		return nasPrice;
	}

	public void setNasPrice(double nasPrice) {
		this.nasPrice = nasPrice;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public double getEndPrice() {
		return endPrice;
	}

	public void setEndPrice(double endPrice) {
		this.endPrice = endPrice;
	}

	public double getVariation() {
		return variation;
	}

	public void setVariation(double variation) {
		this.variation = variation;
	}

	@Override
	public String toString() {
		return "KospiVO [regDate=" + regDate + ", endPrice=" + endPrice + ", variation=" + variation + ", nasPrice="
				+ nasPrice + "]";
	}

}
