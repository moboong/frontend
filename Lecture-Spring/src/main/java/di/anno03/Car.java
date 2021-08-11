package di.anno03;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

@Component
public class Car {

	//@Autowired(required = false) //자동주입을 무조건 하지는 않겠다. 주입할 객체가 없으면 안한다.(null exception 에러 방지)
	//@Qualifier("hankook")
	
	//@Resource(name = "hankook")
	//@Qualifier("kumho") //이거 Resource는 이름 우선이라서 @Qualifier에 금호 적어놔도 한국타이어랑 매핑돼.
	
	@Resource // + 넥센에 tire로 하면, 이름 매칭 우선이라서 넥센이 주입돼. 근데 넥센은 타입이 tire가 아니라서 에러발생
	@Qualifier("kumho") //여기 금호여도 이름 부터 찾아. 넥센에 이름 삭제하면 그때 퀄리파이어가 작용해서 ㅇㅇ 정상 작동할거임
	private Tire tire;

	public Car() {
		System.out.println("Car()...");
	}
	
	//***생성자는 @Resource 이거 지원안해.
	//****생성자는 매개변수가 여러개니까. @Qualifier("hankook")를 매개 변수 앞에다가 달아줘야해.
	//@Autowired
	public Car(Tire tire) {
		this.tire = tire;
		System.out.println("Car(Tire)...");
	}
	
	//@Autowired
	public void setTire(Tire tire) {
		this.tire = tire;
		System.out.println("setTire()...");
	}

	public void prnTireBrand() {
		System.out.println("장착된 타이어 : " + tire.getBrand());
	}
}



//어노테이이션 : 필드, 생성자, setter