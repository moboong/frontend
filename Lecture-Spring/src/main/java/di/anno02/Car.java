package di.anno02;

import javax.annotation.Resource;

public class Car {

	@Resource
	private Tire tire;

	public Car() {
		System.out.println("Car()...");
	}
	
	//생성자는 @Resource 이거 지원안해.
	public Car(Tire tire) {
		this.tire = tire;
		System.out.println("Car(Tire)...");
	}
	
	//@Resource
	public void setTire(Tire tire) {
		this.tire = tire;
		System.out.println("setTire()...");
	}

	public void prnTireBrand() {
		System.out.println("장착된 타이어 : " + tire.getBrand());
	}
}
