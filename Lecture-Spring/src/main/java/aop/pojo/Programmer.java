package aop.pojo;

public class Programmer implements Employee {

	public void work() {
		
		Action.gotoOffice();
		System.out.println("핵심:시스템 개발을 합니다.");
		Action.getoffOffice();

	}

}
