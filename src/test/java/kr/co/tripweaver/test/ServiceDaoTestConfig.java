package kr.co.tripweaver.test;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
//service, dao 에 대한 설정파일만 필요하다. 
@ContextConfiguration(locations= {"classpath:kr/co/tripweaver/config/spring/root-context.xml",
		"classpath:kr/co/tripweaver/config/spring/datasource-test-context.xml",
		"classpath:kr/co/tripweaver/config/spring/transaction-context.xml"})
public class ServiceDaoTestConfig {
	
	
	@Test @Ignore
	public void ConfigTest() {
		
	}
}
