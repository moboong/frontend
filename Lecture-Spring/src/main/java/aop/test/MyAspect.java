package aop.test;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Service;

@Service
@Aspect
public class MyAspect {
	
	@After("execution(* aop.test.*.setAge(..))")
	public void checkAdult(JoinPoint joinPoint) {
		Object[] args = joinPoint.getArgs();
		Integer age = (Integer)args[0];
		
		if(age < 19) {
			System.out.println("미성년자입니다.");
		} else {
			System.out.println("성인입니다.");
		}
	}
	
	//@Around("execution(* aop.test.*.setAge(..))")
	public void checkAdult2(ProceedingJoinPoint pjp) throws Throwable{
		
		
//		pjp.proceed();
//		System.out.println("checkad2");
				
//		System.out.println("checkad2");
//		pjp.proceed();
		
		//try catch시에 또 달라진다.
		
		//제대로 만들면
		pjp.proceed();
		Object[] args = pjp.getArgs();
		Integer age = (Integer)args[0];
		
		if(age < 19) {
			System.out.println("미성년자입니다.");
		} else {
			System.out.println("성인입니다.");
		}
	}
	
	
	@AfterThrowing(pointcut = "execution(* aop.test.*.setAge(..))", throwing = "")
	public void error(JoinPoint joinPoint, Throwable ex) {
		System.out.println("예외처리 : " + ex.toString());
	}
	
	//클릭 시에 호출되는 함수의 로그 파일을 남겨볼 수 있을거야.
}
