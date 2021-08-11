package aop.pojo;

public class Manager implements Employee {

	public void work() {
		
		//결국에는 개발자가 공통의 코드를 추가해줘야해. 이게 OOP의 한계. 결국에 안 넣어주면 실행 안돼.
		System.out.println("핵심:팀원들 관리, 회의한다");

	}

}
