package aop.test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class TestMain {

	public static void main(String[] args) {
		
		@SuppressWarnings("resource")
		ApplicationContext context = new GenericXmlApplicationContext("aop-test.xml");
		
		Person p = context.getBean("man", Person.class);
		p.setAge(15);
		
	}

}
