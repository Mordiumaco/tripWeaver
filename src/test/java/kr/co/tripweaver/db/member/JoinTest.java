package kr.co.tripweaver.db.member;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import kr.co.tripweaver.join.service.IJoinService;
import kr.co.tripweaver.member.model.MemberVO;
import kr.co.tripweaver.member.service.IMemberService;
import kr.co.tripweaver.member.service.MemberService;
import kr.co.tripweaver.test.ServiceDaoTestConfig;

/**
* JoinTest.java
*
* @author Jae Hyeon Choi
* @version 1.0
* @since 2018. 12. 5.
* @see
* 
* << 클래스 생성 목적 >>
* 
*회원가입 관련 테스트 
*
* << 개정이력(Modification Information) >>
*
* 수정자 수정내용
* ------ ------------------------
* Jae Hyeon Choi 최초 생성
*
* 
*/
public class JoinTest extends ServiceDaoTestConfig{

	@Autowired
	IJoinService joinService;
	
	@Autowired
	IMemberService memberService;
	/**
	* Method : JoinMemberInsertTest
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 5.
	* 변경이력 :
	* Method 설명 : 제대로 회원 정보가 DB에 기입되는지 테스트 한다. 
	*/
	@Test
	public void JoinMemberInsertTest() {
		
		memberService.eternalDeleteMemberByEmail("test@gmail.com");
		
		MemberVO memberVo = new MemberVO("test", "test@gmail.com", "test", "테스트", "테스트염", "01041111111", "10-19", "M");
		
		int result = joinService.insertMember(memberVo);
		
		assertEquals(1, result);
	}

}
