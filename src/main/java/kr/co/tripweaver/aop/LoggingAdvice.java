package kr.co.tripweaver.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
* LoggingAdvice.java
*
* @author pc20
* @version 1.0
* @see
*
* <pre>
* << 개정이력(Modification Information) >>
*
* 수정자 수정내용
* ------ ------------------------
* pc20 최초 생성
* 공통의 관심사(메소드 호출 로깅)을 담당하는 adivce
*
* </pre>
*/
public class LoggingAdvice {
	
/*	Logger logger = LoggerFactory.getLogger(LoggingAdvice.class);
	
	//우리가 구현하는 비즈니스 로직이 실행되기 전에 실행되는 공통로직
	public void beforeAdvice(JoinPoint joinPoint){
		String methodName = joinPoint.getSignature().getName();
		String className = joinPoint.getTarget().getClass().getName();
		
		logger.debug("className : {}", className);
		logger.debug("methodName : {}", methodName);
		
	}
	
	public void afterAdivce(JoinPoint joinPoint){
		
		String methodName = joinPoint.getSignature().getName();
		String className = joinPoint.getTarget().getClass().getName();
		
		logger.debug("className : {}", className);
		logger.debug("methodName : {}", methodName);
		
	}
	
	//비즈니스 로직 전 후로 다른 로직을 삽입
	public Object aroundAdvice(ProceedingJoinPoint joinPoint) throws Throwable{
		
		//실제 비즈니스 메소드 실행전 
		long startTime = System.currentTimeMillis();
		
		//실제 비즈니스 메소드 호출 
		Object[] args = joinPoint.getArgs(); //비즈니스 메소드 메개변수
		Object object = joinPoint.proceed(args); //비즈니스 메소드 실행 
		//실제 비즈니스 메소드 실행 후 
		long endTime = System.currentTimeMillis();
		logger.debug("duration : {} ", endTime-startTime);
		
		return object;
		
	}
	*/
}