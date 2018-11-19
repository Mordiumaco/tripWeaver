package kr.co.tripweaver.test;

import javax.annotation.Resource;
import javax.sql.DataSource;

import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

@RunWith(SpringJUnit4ClassRunner.class)
//controller의 경우 service 스프링 빈을 주입받기 때문에 
//service, dao 에 대한 설정파일도 필요하다. 
@ContextConfiguration(locations= {"classpath:kr/co/tripweaver/config/spring/root-context.xml","classpath:kr/co/tripweaver/config/spring/servlet-context.xml","classpath:kr/or/ddit/config/spring/datasource-test-context.xml",
		"classpath:kr/co/tripweaver/config/spring/transaction-context.xml"})
//스프링 컨테이너를 웹 기반에서 사용가능한 webApplicationContext 생성 
@WebAppConfiguration
public class ControllerTestConfig {

	//webApplicationContext ==> mockMvc(dispatcherServlet) 생성을 위해 필요  0
	@Autowired
	protected WebApplicationContext context;
	
	protected MockMvc mockMvc;
	
	@Resource(name="dataSource")
	private DataSource dataSource; 
	
	
	@Before
	public void setup() {
		mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
		
	}

	
	@Test @Ignore
	public void ConfigTest() {
		
	}
}
