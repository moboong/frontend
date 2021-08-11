package di.cal01;

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


//최종단계: Config 쓰고, 필드에 @Autowired(자동주입) 사용