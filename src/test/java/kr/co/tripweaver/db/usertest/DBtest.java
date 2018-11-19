package kr.co.tripweaver.db.usertest;

import static org.junit.Assert.assertEquals;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import kr.co.tripweaver.test.ServiceDaoTestConfig;
import kr.co.tripweaver.user.dao.IUserTestDao;
import kr.co.tripweaver.user.model.UserTestVO;

 /**
* DBtest.java
*
* @author pc20
* @version 1.0
* @since 2018.11.19 
* @author 최재현
* @see
*
* <pre>
* DB 접속을 확인하기 위한 테스트 
* 중프때 이용한 오라클 DB를 활용중입니다.
* 
* 참고해야 할점은 확장된 Class는 따로 test data source, dbtest.properties 를 사용하고 있음을 명심해 주세요.
*
* 수정자 수정내용
* ------ ------------------------
* pc20 최초 생성
*
* </pre>
*/
public class DBtest extends ServiceDaoTestConfig{
	
	@Autowired
	IUserTestDao userTestService;
	
	/**
	* Method : DBConnectionTest
	* 작성자 : pc20
	* 변경이력 :
	* Method 설명 : his DB 오라클 아이디와의 Connection Test 
	*/
	@Test
	public void DBConnectionTest() {
		
		List<UserTestVO> userTestList = userTestService.selectUserTest();
		
		assertEquals(1, userTestList.size());
	}

}
