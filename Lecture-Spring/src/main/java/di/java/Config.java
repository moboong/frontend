package di.java;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

//이걸로 xml대신 이 클래스 파일을 사용하겠다 이거임.
@ComponentScan(basePackages = {"di.java"}) //코드 내부에 아무것도 없어도 어노태이션 잘만쓰면 생성 쉽게 해.
@Configuration
public class Config {
	
	
	/*
	 * 일일이 쓰는게 너무 불편해서 @ComponentScan이 등장하게 됨.
	@Bean
	public Car car() {
		return new Car();
	}
	
	@Bean
	@Qualifier("hankook")
	public Tire hankookTire() {
		return new HankookTire();
	}
	
	@Bean
	@Qualifier("kumho")
	public Tire kumhoTire() {
		return new KumhoTire();
	}
	*/
	
}
