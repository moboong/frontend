package di.xml.cal01;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class CalMain {

	public static void main(String[] args) {
		
		@SuppressWarnings("resource")
		ApplicationContext context = new GenericXmlApplicationContext("di.xml.cal01.xml");
	
		
		MyCalculator mycal = context.getBean("myCal", MyCalculator.class);
		mycal.prnAdd(); mycal.prnSub(); mycal.prnMul(); mycal.prnDiv();
		 
	}

}


//최종단계: Config 쓰고, 필드에 @Autowired(자동주입) 사용