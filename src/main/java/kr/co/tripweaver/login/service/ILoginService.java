package kr.co.tripweaver.login.service;

import kr.co.tripweaver.member.model.MemberVO;

public interface ILoginService {
	
	/**
	* Method : selectMemberByIdAndPass
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 5.
	* 변경이력 :
	* @param memberVo
	* @return
	* Method 설명 : 아이디와 비밀번호가 일치하면 해당 회원을 리턴 
	*/
	public MemberVO selectMemberByIdAndPass(MemberVO memberVo);
}
