package di.cal03;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class MyCalculator {

	private int firstNum;

	private int secondNum;

	private Calculator calculator;

	public MyCalculator() {
		System.out.println("MyCalculator()...");
	}
	
	@Resource
	@Value("40")
	public void setFirstNum(int firstNum) {
		this.firstNum = firstNum;
	}
	
	@Resource
	@Value("20")
	public void setSecondNum(int secondNum) {
		this.secondNum = secondNum;
	}
	
	@Resource
	public void setCalculator(Calculator calculator) {
		this.calculator = calculator;
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
