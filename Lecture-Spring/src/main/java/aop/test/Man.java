package aop.test;

import org.springframework.stereotype.Component;

@Component
public class Man implements Person {

	int age;
	
	public void setAge(int age) {
		this.age = age;
		System.out.println("나이를 입력했습니다: " + age);
	}

}
