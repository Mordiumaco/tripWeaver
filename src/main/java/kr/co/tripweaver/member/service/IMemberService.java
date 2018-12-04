package kr.co.tripweaver.member.service;

import java.util.List;
import java.util.Map;

import kr.co.tripweaver.member.model.MemberVO;

public interface IMemberService {

	/**
	 * 
	* Method : selectMemberByEmail
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 11. 29.
	* 변경이력 :
	* @param mem_email
	* @return
	* Method 설명 : 해당 회원의 이메일을 가지고 DB에 존재하는 Member 가 존재하는지 확인하는 메서드 
	* 해당 회원이 존재하면 해당 회원에 대한 정보를 가지고 있는 MemberVO 객체를 반환해 준다. 
	* 없을경우에는 null 값을 반환한다. 
	* 
	*/
	public MemberVO selectMemberByEmail(String mem_email);
	
	/**
	* Method : insertNaverMember
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 11. 29.
	* 변경이력 :
	* @param memberVo
	* @return
	* Method 설명 : Naver Member에 해당하는 회원을 TRIP WEAVER MEMBER DB에 주입시켜 준다. 
	* 정상적으로 완료가 되면 result는 1을 반환한다. 
	* 
	*/
	public int insertNaverMember(MemberVO memberVo);
	
	
	/**
	* Method : eternalDeleteMemberByEmail
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 11. 29.
	* 변경이력 :
	* @param mem_email
	* @return
	* Method 설명 : 해당 이메일에 해당하는 회원이 존재할 시 해당 회원에 대한 정보를 지운다.
	*/
	public int eternalDeleteMemberByEmail(String mem_email);
	
	/**
	* Method : selectMemberPageList
	* 작성자 : jin
	* 변경이력 :
	* @param params
	* @return
	* Method 설명 : 해당 페이지의 MemberVO리스트를 반환하는 메서드
	 */
	public Map<String, Object> selectMemberPageList(Map<String, Object> params);
	
	/**
	* Method : updateMemberAuthor
	* 작성자 : jin
	* 변경이력 :
	* @param params
	* @return
	* Method 설명 : 관리자 회원관리 권한 수정하고 해당페이지 멤버리스트를 반환하는 메서드
	 */
	public Map<String, Object> manageUpdateMemberAuthor(Map<String, Object> params);
	
	/**
	* Method : manageDeleteMemberDel
	* 작성자 : jin
	* 변경이력 :
	* @param params
	* @return
	* Method 설명 : 관리자 회원관리 삭제여부를 'Y'로 수정하고 해당페이지 멤버리스트를 반환하는 메서드
	 */
	public Map<String, Object> manageDeleteMemberDel(Map<String, Object> params);
	
	/**
	* Method : manageChkDeleteMemberDel
	* 작성자 : jin
	* 변경이력 :
	* @param params
	* @return
	* Method 설명 : 관리자 회원관리에서 해당 멤버들의 삭제여부를 'Y'로 수정하고 해당페이지 멤버리스트를 반환하는 메서드
	 */
	public Map<String, Object> manageChkDeleteMemberDel(Map<String, Object> params);
	
	/**
	* Method : manageChkUpdateMemberAuthor
	* 작성자 : jin
	* 변경이력 :
	* @param params
	* @return
	* Method 설명 : 관리자 회원관리에서 해당 멤버들의 권한을 수정하고 해당페이지 멤버리스트를 반환하는 메서드
	 */
	public Map<String, Object> manageChkUpdateMemberAuthor(Map<String, Object> params);
}
