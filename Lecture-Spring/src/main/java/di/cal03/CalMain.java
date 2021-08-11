package di.cal03;

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


//이건 setter 주입 사용해봤는데 기본생성자 + 의존값들 setter만 만들어주고 어노테이션만 붙이면 끝