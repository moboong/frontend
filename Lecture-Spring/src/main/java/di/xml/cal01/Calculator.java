package di.xml.cal01;

public class Calculator {
	
	public Calculator() {
		System.out.println("Calculator()...");
	}
	
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
