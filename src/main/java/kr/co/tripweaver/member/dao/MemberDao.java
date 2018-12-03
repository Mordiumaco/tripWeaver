package kr.co.tripweaver.member.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;


import kr.co.tripweaver.member.model.MemberVO;

@Repository
public class MemberDao implements IMemberDao {

	@Resource(name = "sqlSessionTemplate")
	SqlSessionTemplate template;

	
	
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
	@Override
	public MemberVO selectMemberByEmail(String mem_email) {
		
		MemberVO memberVo = template.selectOne("memberSQL.selectMemberByEmail", mem_email);
		
		return memberVo;
	}
	
	
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
	@Override
	public int insertNaverMember(MemberVO memberVo) {
		
		int result = template.insert("memberSQL.insertNaverMember", memberVo);
		
		return result;
	}
	
	/**
	* Method : eternalDeleteMemberByEmail
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 11. 29.
	* 변경이력 :
	* @param mem_email
	* @return
	* Method 설명 : 해당 이메일에 해당하는 회원이 존재할 시 해당 회원에 대한 정보를 지운다.
	*/
	@Override
	public int eternalDeleteMemberByEmail(String mem_email) {
		
		int result = template.delete("memberSQL.eternalDeleteMemberByEmail", mem_email);
		
		return result;
	}

	/**
	* Method : selectMemberAll
	* 작성자 : jin
	* 변경이력 :
	* @return
	* Method 설명 : 모든 MemeberVO리스트를 반환하는 메서드
	 */
	@Override
	public int selectMemberAllCount() {
		int memberCnt = template.selectOne("memberSQL.selectMemberAllCount");
		return memberCnt;
	}

	/**
	* Method : selectMemberPageList
	* 작성자 : jin
	* 변경이력 :
	* @param params
	* @return
	* Method 설명 : 해당 페이지의 MemberVO리스트를 반환하는 메서드
	 */
	@Override
	public List<MemberVO> selectMemberPageList(Map<String, Object> params) {
		List<MemberVO> memberVOs = template.selectList("memberSQL.selectMemberPageList", params);
		return memberVOs;
	}

	/**
	* Method : updateMemberAuthor
	* 작성자 : jin
	* 변경이력 :
	* @param params
	* @return
	* Method 설명 : 관리자 회원관리 권한 수정하는 메서드
	 */
	@Override
	public int manageUpdateMemberAuthor(Map<String, Object> params) {
		int updateCnt = template.update("memberSQL.manageUpdateMemberAuthor", params);
		return updateCnt;
	}
	
	
	
}
