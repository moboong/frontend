package di.xml01;

public class Car {
	
	private Tire tire;
	private Tire frontL;
	private Tire frontR;
	private Tire backL;
	private Tire backR;
	
	public void setFrontL(Tire frontL) {
		this.frontL = frontL;
		System.out.println("setFrontL(Tire) 호출... ");
	}

	public void setFrontR(Tire frontR) {
		this.frontR = frontR;
		System.out.println("setFrontR(Tire) 호출... ");
	}

	public void setBackL(Tire backL) {
		this.backL = backL;
		System.out.println("setBackL(Tire) 호출... ");
	}

	public void setBackR(Tire backR) {
		this.backR = backR;
		System.out.println("setBackR(Tire) 호출... ");
	}

	public Car() {
		
	}
	
	public void setTire(Tire tire) {
		this.tire = tire;
		System.out.println("setTire(Tire) 호출... ");
	}
	
	public void prnTireBrand() {
		System.out.println("장착된 스페어tire : " + tire.getBrand());
		System.out.println("장착된 frontL : " + frontL.getBrand());
		System.out.println("장착된 frontR : " + frontR.getBrand());
		System.out.println("장착된 backL : " + backL.getBrand());
		System.out.println("장착된 backR : " + backR.getBrand());
	}
	
}
