package di.cal02;

import java.util.Scanner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MyCalculator {
	
	private int firstNum;
	
	private int secondNum;
	
	
	private Calculator calculator;
	
	Scanner sc = new Scanner(System.in);
	
	public MyCalculator(@Autowired Calculator calculator) {
		System.out.print("첫번째:");
		this.firstNum = sc.nextInt();
		System.out.print("두번째:");
		this.secondNum = sc.nextInt();
		this.calculator = calculator;
		System.out.println("MyCalculator(calculator)...");
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
