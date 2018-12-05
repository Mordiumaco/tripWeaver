package kr.co.tripweaver.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tripweaver.member.model.MemberVO;
import kr.co.tripweaver.member.service.IMemberService;

@Service
public class LoginService implements ILoginService {
	
	@Autowired
	IMemberService memberService;
	
	/**
	* Method : selectMemberByIdAndPass
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 5.
	* 변경이력 :
	* @param memberVo
	* @return
	* Method 설명 : 아이디와 비밀번호가 일치하면 해당 회원을 리턴 
	*/
	public MemberVO selectMemberByIdAndPass(MemberVO memberVo) {
		return memberService.selectMemberByIdAndPass(memberVo);
	}
	
}
