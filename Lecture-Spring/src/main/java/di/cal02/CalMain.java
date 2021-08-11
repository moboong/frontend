package di.cal02;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class CalMain {

	public static void main(String[] args) {
		@SuppressWarnings("resource")
		ApplicationContext context = new AnnotationConfigApplicationContext(Config.class);
		
		MyCalculator mycal = context.getBean("myCalculator", MyCalculator.class);
		mycal.prnAdd();
		mycal.prnSub();
		mycal.prnMul();
		mycal.prnDiv();
	}

}


//이건 생성자 주입 사용해봤는데. 기본 생성자 있으니가 실행 안되더라.
//자동이다 보니까 확실히 위험하네
//역시 @Resource는 안된다.