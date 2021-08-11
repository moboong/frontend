package di.basic;

public class DriverMain {
	
	public static void main(String[] args) {
		
		Tire han = new HankookTire();
		Tire kum = new KumhoTire();
		
		
		
		//의존성 주입(setter 주입 방식)!!
		Car car = new Car();
		car.setTire(han);
		car.prnTireBrand();
		
		car.setTire(kum);
		car.prnTireBrand();
		
		
		
		
		
		/*
		//의존성 주입(생성자 주입 방식)!!
		Car car = new Car(han);
		car.prnTireBrand();
		
		car =  new Car(kum);
		car.prnTireBrand();
		*/
		
		
		
		
		
		/*
		Car car = new Car();
		car.prnTireBrand();
		*/
	}
}
