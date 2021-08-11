package aop.java;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

@EnableAspectJAutoProxy //얘도 꼭 붙여야 프록시 사용가능
@ComponentScan(basePackages = {"aop.java"})
@Configuration
public class Config {
	
}
