package di.xml.cal01;

public class MyCalculator {

	private int firstNum;
	private int secondNum;
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

	public void setFirstNum(int firstNum) {
		this.firstNum = firstNum;
	}

	public void setSecondNum(int secondNum) {
		this.secondNum = secondNum;
	}

	public void setCalculator(Calculator calculator) {
		this.calculator = calculator;
	}
	
	
}
