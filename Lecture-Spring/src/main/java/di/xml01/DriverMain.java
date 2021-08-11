package di.xml01;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class DriverMain {
	
	public static void main(String[] args) {
		
		//이걸 이제 스프링으로
		@SuppressWarnings("resource")
		ApplicationContext context = new GenericXmlApplicationContext("di-xml01.xml");

		//방법2
		Car car = (Car)context.getBean("car2");
		car.prnTireBrand(); //다른 타이어로 바꾸고 싶어? -> xml파일로 가서 ref=""에 id만 바꿔주면 돼.
		
		
		
		
		/*
		//방법1
		Car car = context.getBean("car", Car.class);
		Tire tire = (Tire)context.getBean("tire");
		car.setTire(tire);
		car.prnTireBrand();
		*/
		
		
		/*
		Car car = new Car();
		Tire tire = new HankookTire();
		car.setTire(tire);
		car.prnTireBrand();
		*/
	}
}





//xml에서 객체 생성만 하는게 아니라 setter 주입까지 해치우고 싶다!!!!!! <property name=""></property> 이걸로 할 수 있어