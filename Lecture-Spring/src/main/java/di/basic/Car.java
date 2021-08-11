package di.basic;

public class Car {
	
	//의존관계 발생
	private Tire tire;
	
	// DI(의존주입) : 생성자 주입
	public Car(Tire tire) {
		this.tire = tire;
	}
	
	//타이어가 없는 자동차를 주문할 수도 있잖아.
	public Car() {
		
	}
	
	
	
	/*
	public Car() {
		//의존관계 설정
		tire = new HankookTire();
		//tire = new KumhoTire();
	}
	*/
	
	
	//DI(의존주입) : setter 주입
	public void setTire(Tire tire) {
		this.tire = tire;
	}
	
	
	public void prnTireBrand() {
		System.out.println("장착된 타이어 : " + tire.getBrand());
	}
}
