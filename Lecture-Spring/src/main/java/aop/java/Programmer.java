package aop.java;

import org.springframework.stereotype.Component;

@Component
public class Programmer implements Employee {

	public void work() {
		System.out.println("시스템 개발합니다.");
	}

}
