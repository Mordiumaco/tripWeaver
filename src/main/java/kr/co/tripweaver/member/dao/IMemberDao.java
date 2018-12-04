package kr.co.tripweaver.member.dao;

import java.util.List;
import java.util.Map;

import kr.co.tripweaver.member.model.MemberVO;

public interface IMemberDao {

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
	* Method : selectMemberAll
	* 작성자 : jin
	* 변경이력 :
	* @return
	* Method 설명 : 모든 MemeberVO리스트를 반환하는 메서드
	 */
	public int selectMemberAllCount(Map<String, Object> params);
	
	/**
	* Method : selectMemberPageList
	* 작성자 : jin
	* 변경이력 :
	* @param params
	* @return
	* Method 설명 : 해당 페이지의 MemberVO리스트를 반환하는 메서드
	 */
	public List<MemberVO> selectMemberPageList(Map<String, Object> params);
	
	/**
	* Method : updateMemberAuthor
	* 작성자 : jin
	* 변경이력 :
	* @param params
	* @return
	* Method 설명 : 관리자 회원관리 권한 수정하는 메서드
	 */
	public int manageUpdateMemberAuthor(MemberVO memberVO);
	
	/**
	* Method : manageDeleteMemberDel
	* 작성자 : jin
	* 변경이력 :
	* @param params
	* @return
	* Method 설명 : 관리자 회원관리 회원삭제여부 Y로 수정하는 메서드
	 */
	public int manageDeleteMemberDel(String mem_id);
	
	/**
	* Method : manageCountMemberDel
	* 작성자 : jin
	* 변경이력 :
	* @return
	* Method 설명 : 관리자 회원관리에서 탈퇴회원 수를 반환하는 메서드
	 */
	public int manageCountMemberDel();
	
	/**
	* Method : manageCountMemberAuth
	* 작성자 : jin
	* 변경이력 :
	* @return
	* Method 설명 : 관리자 회원관리에서 블랙리스트 수를 반환하는 메서드
	 */
	public int manageCountMemberAuth();
}
