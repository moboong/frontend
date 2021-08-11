package di.cal01;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class MyCalculator {
	
	@Resource
	@Value("20")
	private int firstNum;
	@Resource
	@Value("5")
	private int secondNum;
	@Resource
	private Calculator calculator;
	
	
	public MyCalculator() {
		System.out.println("MyCalculator()...");
	}
	
	
	
	
	
	
	
	
	
	public void prnAdd() {
		int result = calculator.addition(firstNum, secondNum);
		System.out.println(result);
	}
	
	public void prnSub() {
		int result = calculator.subtraction(firstNum, secondNum);
		System.out.println(result);
	}
	
	public void prnMul() {
		int result = calculator.multiplication(firstNum, secondNum);
		System.out.println(result);
	}
	
	public void prnDiv() {
		int result = calculator.division(firstNum, secondNum);
		System.out.println(result);
	}
}
