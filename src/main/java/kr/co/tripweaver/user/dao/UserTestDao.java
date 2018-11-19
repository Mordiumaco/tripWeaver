package kr.co.tripweaver.user.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.tripweaver.user.model.UserTestVO;


/* 
 * DB 접속을 확인하기 위한 DB test용 dao 입니다.
 * 
 */
@Repository
public class UserTestDao implements IUserTestDao{
	
	@Resource(name = "sqlSessionTemplate")
	SqlSessionTemplate template;

	


	/**
	* Method : selectUserTest
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 11. 19.
	* 변경이력 :
	* @return
	* Method 설명 : 테스트용 UserTestVO 객체들 가져오기
	*/
	@Override
	public List<UserTestVO> selectUserTest() {
		
		List<UserTestVO> userList = template.selectList("userTestSQL.selectUserTest");
		return userList;
	}
	
	

}
