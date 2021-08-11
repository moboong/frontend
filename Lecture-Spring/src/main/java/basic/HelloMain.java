package basic;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class HelloMain {
	
	public static void main(String[] args) {
		
		//3개 중에 제일 위에꺼 사용할거야(밑에 둘을 아우르거든). 권고사항이야.
		@SuppressWarnings("resource")
		ApplicationContext context
								   = new GenericXmlApplicationContext("beanContainer.xml");
//								   = new ClassPathXmlApplicationContext("beanContainer.xml");
//								   = new FileSystemXmlApplicationContext("src/main/resources/beanContainer.xml");
		
		
		Hello obj = (Hello)context.getBean("hello");
		System.out.println(obj);
		
		Hello obj2 = (Hello)context.getBean("hello");
		System.out.println(obj2);
		//둘은 같은 주소를 가져 왜냐면 하나를 재사용하기 때문
		
		obj.prnMsg();
		
		
		Hello obj3 = context.getBean("hello2", Hello.class); //즉, lazy떄문에 이 시점에 생성되는거임.
		System.out.println(obj3); //얘는 주소 달라. 다른 객체라서
		obj3.prnMsg();
		
		/*
		Hello obj = new Hello();
		obj.prnMsg();
		//이거 안해도 위에 문법 만으로도 Hello 객체생성이 가능.
		*/
		
	}
}
