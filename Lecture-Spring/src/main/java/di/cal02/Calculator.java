package di.cal02;

import org.springframework.stereotype.Component;

@Component
public class Calculator {
	
	public int addition(int firstNum, int secondNum) {
		return firstNum + secondNum;
	}
	
	public int subtraction(int firstNum, int secondNum) {
		return firstNum - secondNum;
	}
	
	public int multiplication(int firstNum, int secondNum) {
		return firstNum * secondNum;
	}
	
	public int division(int firstNum, int secondNum) {
		return firstNum / secondNum;
	}
	
}
