package kr.co.tripweaver.join.service;

import kr.co.tripweaver.member.model.MemberVO;

public interface IJoinService {
	
	
	/**
	* Method : selectMemberById
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 5.
	* 변경이력 :
	* @param mem_id
	* @return
	* Method 설명 : 해당 회원이 존재하는지 체크하는 서비스 
	*/
	public MemberVO selectMemberById(String mem_id);
	
	/**
	* Method : insertMember
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 5.
	* 변경이력 :
	* @param memberVo
	* @return
	* Method 설명 : 해당 회원정보를 DB에 있는 member 테이블에 주입해준다. 
	*/
	public int insertMember(MemberVO memberVo);
}
