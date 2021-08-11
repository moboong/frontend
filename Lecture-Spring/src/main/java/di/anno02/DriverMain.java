package di.anno02;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class DriverMain {
	
	public static void main(String[] args) {
		
		
		@SuppressWarnings("resource")
		ApplicationContext context = new GenericXmlApplicationContext("di.anno02.xml");
		
		Car car = context.getBean("car", Car.class);
		car.prnTireBrand();
		
		
	}
}


//Autowired와 Resource의 가장 큰 차이
//@Autowired : type => name
//@Resource : name => type
//-> 순수 자바 어노테이션
//@Inject : type => name
//-> repository에서 다운.

//우리가 어노테이션 쓰는 이유: xml 파일의 길이가 너무 길어질 까봐서