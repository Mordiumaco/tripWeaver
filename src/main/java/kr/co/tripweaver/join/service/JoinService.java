package kr.co.tripweaver.join.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tripweaver.member.model.MemberVO;
import kr.co.tripweaver.member.service.IMemberService;

@Service(value="joinService")
public class JoinService implements IJoinService {
	
	//왠만한 서비스는 멤버와 관련되 있기 때문에 memberService에서 빨대를 꽂아 사용한다. 
	@Autowired
	IMemberService memberService;
	
	/**
	* Method : selectMemberById
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 5.
	* 변경이력 :
	* @return
	* Method 설명 : 해당 회원이 존재하는지 체크하는 서비스 
	*/
	@Override
	public MemberVO selectMemberById(String mem_id) {
		MemberVO memberVo = memberService.selectMemberById(mem_id);
		return memberVo;
	}
	
	
	/**
	* Method : insertMember
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 5.
	* 변경이력 :
	* @param memberVo
	* @return
	* Method 설명 : 해당 회원정보를 DB에 있는 member 테이블에 주입해준다. 
	*/
	@Override
	public int insertMember(MemberVO memberVo) {
		return memberService.insertMember(memberVo);
	}
}
