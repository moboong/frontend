package aop.anno;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

//spring aop 특징
//1. Runtime 기반
//2. Proxcy 기반
//3. 인터페이스 기반

public class EmpMain {

	public static void main(String[] args) {
		
		@SuppressWarnings("resource")
		ApplicationContext context = new GenericXmlApplicationContext("aop-anno.xml");
		
		Employee e = context.getBean("programmer", Employee.class);
		//Employee e = context.getBean("designer", Employee.class);
		e.work();
		
		
		aop.xml.Employee e2 = context.getBean("programmer2", aop.xml.Employee.class);
		e2.work(); //앞뒤로 안 붙어. 그럼 MyAspect가서 anno패키지를 *로 바꿔주면? 비로소 앞뒤로 붙어 

	}

}
