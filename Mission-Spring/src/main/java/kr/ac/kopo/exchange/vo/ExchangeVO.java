package kr.ac.kopo.exchange.vo;

public class ExchangeVO {
	private String regDate;
	private double stdRate;
	private double variation;

	private double endPrice;

	public ExchangeVO() {
		super();
	}

	public double getEndPrice() {
		return endPrice;
	}

	public void setEndPrice(double endPrice) {
		this.endPrice = endPrice;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public double getStdRate() {
		return stdRate;
	}

	public void setStdRate(double stdRate) {
		this.stdRate = stdRate;
	}

	public double getVariation() {
		return variation;
	}

	public void setVariation(double variation) {
		this.variation = variation;
	}

	@Override
	public String toString() {
		return "ExchangeVO [regDate=" + regDate + ", stdRate=" + stdRate + ", variation=" + variation + ", endPrice="
				+ endPrice + "]";
	}

}
