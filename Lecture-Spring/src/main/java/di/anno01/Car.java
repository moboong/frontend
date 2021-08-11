package di.anno01;

import org.springframework.beans.factory.annotation.Autowired;

public class Car {
	
	@Autowired
	private Tire tire;
	//이렇게 변수에 오토와이어하면 알아서 주입돼. 생성자, setter주입이 아니라. 알아서 연결돼.
	
	public Car() {
		System.out.println("Car()...");
	}
	
	//@Autowired
	public Car(Tire tire) {
		this.tire = tire;
		System.out.println("Car(Tire)...");
	}
	//와 진짜 자동으로 의존성 주입해주네... 개쩐다. 어노테이션 하나로. 이거 없으면 tire에 아무것도 안들어가서 null 예외 발생하는데... 
	//어노테이션있으니까 굳이 xml에 의존성 설정 안해줘도, 객체만 생성해줘도 알아서 생성자 찾아서 실행해주는 느낌이야.
	
	
	//@Autowired
	public void setTire(Tire tire) {
		this.tire = tire;
		System.out.println("setTire()...");
	}
	
	
	public void prnTireBrand() {
		System.out.println("장착된 타이어 : " + tire.getBrand());
	}
}
