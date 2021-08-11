package aop.pojo;

public class Designer implements Employee {

	public void work() {
		
		Action.gotoOffice();
		System.out.println("핵심:제품 디자인을 합니다.");
		Action.getoffOffice();

	}

}
