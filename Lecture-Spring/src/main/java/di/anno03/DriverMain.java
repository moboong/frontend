package di.anno03;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class DriverMain {
	
	public static void main(String[] args) {
		
		//이제 자동으로 객체도 생성(@Component)하고, 의존주입까지 해준다.(@Autowired)
		@SuppressWarnings("resource")
		ApplicationContext context = new GenericXmlApplicationContext("di.anno03.xml");
		
		
		Car car = context.getBean("car", Car.class); //@Component에 적힌이름. 공란일 경우 앞소문자인 클래스명
		car.prnTireBrand();
		
	}
}

//우리가 어노테이션 쓰는 이유: xml 파일의 길이가 너무 길어질 까봐서