package di.xml02;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class DriverMain {

	public static void main(String[] args) {

		// 이걸 이제 스프링으로
		@SuppressWarnings("resource")
		ApplicationContext context = new GenericXmlApplicationContext("di-xml02.xml");
		
		Car car = context.getBean("car", Car.class);
		car.prnTireBrand();
		
	}
}