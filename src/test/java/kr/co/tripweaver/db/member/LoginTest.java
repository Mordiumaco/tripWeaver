package kr.co.tripweaver.db.member;


import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import kr.co.tripweaver.member.model.MemberVO;
import kr.co.tripweaver.member.service.MemberService;
import kr.co.tripweaver.test.ServiceDaoTestConfig;

/**
* LoginTest.java
*
* @author Jae Hyeon Choi
* @version 1.0
* @since 2018. 11. 29.
* @see
* 
* << 클래스 생성 목적 >>
* 로그인 관련 테스트를 진행
*
*
* << 개정이력(Modification Information) >>
*
* 수정자 수정내용
* ------ ------------------------
* Jae Hyeon Choi 최초 생성
*
* 
*/
public class LoginTest extends ServiceDaoTestConfig{
	
	Logger logger = LoggerFactory.getLogger(LoginTest.class);
	
	@Autowired
	MemberService memberService;
	
	/**
	* Method : insertNaverMemberTest
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 11. 29.
	* 변경이력 :
	* Method 설명 : 제대로 네이버에서 주는 정보를 DB에 기입할 수 있는지 확인하는 테스트 , 더블어 영구삭제도 제대로 되는지 확인
	*/
	@Test
	public void insertNaverMemberTest() {
		
		//회원 정보 삭제
		memberService.eternalDeleteMemberByEmail("ask6743@naver.com");
		
		
		//멤버 객체 더미 생성
		MemberVO memberVo = new MemberVO();
		memberVo.setMem_name("최재현");
		memberVo.setMem_gender("M");
		memberVo.setMem_email("ask6743@naver.com");
		//memberVo.setMem_author("1");
		memberVo.setMem_age("20-29");
		memberVo.setMem_nick("귀차니즘");
		
		
		//네이버 멤버에 해당하는 정보를 DB Member Table에 insert 시킨다. 
		int result= memberService.insertNaverMember(memberVo);
		
		//1이 나오면 정상
		assertEquals(1, result);
	}
	
	/**
	* Method : eternalDeleteMemberByEmail
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 11. 29.
	* 변경이력 :
	* Method 설명 : Email을 검색해 해당하는 아이디를 영구적으로 지운다
	* 없는 상태라면 0 있는 상태라면 1 
	*/
	@Test
	public void eternalDeleteMemberByEmail() {
		
		String mem_email = "ask6743@naver.com";
		int result = memberService.eternalDeleteMemberByEmail(mem_email);
		
		logger.debug("삭제에 해당하는 값 : {} (0 [삭제할 아이디가 없음] 혹은 1[삭제할 아이디가 한 개 존재]이면 이상이 없음) ", result);
		
		//1이나 0이 나오면 true
		assertEquals(true, result == 0 || result == 1);
	}
}
