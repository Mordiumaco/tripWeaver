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
	* Method : selectMemberById
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 5.
	* 변경이력 :
	* @param mem_id
	* @return
	* Method 설명 : 해당 아이디에 해당하는 회원이 존재할시 해당 회원에 대한 정보를 가져온다.
	* 없을경우에는 null을 반환한다. 
	*/
	@Override
	public MemberVO selectMemberById(String mem_id) {
		
		MemberVO memberVo = null;
		
		try {
			
			memberVo = template.selectOne("memberSQL.selectMemberById", mem_id);
			
		} catch (Exception e) {
			
			e.printStackTrace();
			return memberVo;
		}
		
		return memberVo;
	}
	
	/**
	* Method : insertMember
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 5.
	* 변경이력 :
	* @param int
	* @return
	* Method 설명 : 해당 회원정보를 DB에 있는 member 테이블에 주입해준다. 
	*/
	@Override
	public int insertMember(MemberVO memberVo) {
		
		int result;
		
		try {
			result = template.insert("memberSQL.insertMember", memberVo);
		} catch (Exception e) {
			result = 0;
			e.printStackTrace();
			return  result;
		}
		
		return result;
	}
	
	/**
	* Method : selectMemberByIdAndPass
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 5.
	* 변경이력 :
	* @param memberVo
	* @return
	* Method 설명 : 아이디와 비밀번호가 일치하면 해당 회원을 리턴 
	*/
	@Override
	public MemberVO selectMemberByIdAndPass(MemberVO memberVo) {
		
		MemberVO resultMemberVo = null;
		
		try {
			
			resultMemberVo = template.selectOne("memberSQL.selectMemberByIdAndPass", memberVo);
			
		} catch (Exception e) {
			
			e.printStackTrace();
			return resultMemberVo;
		}
		
		return resultMemberVo;
	}
	
	/**
	* Method : selectMemberAll
	* 작성자 : jin
	* 변경이력 :
	* @return
	* Method 설명 : 모든 MemeberVO리스트를 반환하는 메서드
	 */
	@Override
	public int selectMemberAllCount(Map<String, Object> params) {
		int memberCnt = template.selectOne("memberSQL.selectMemberAllCount", params);
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
	public int manageUpdateMemberAuthor(MemberVO memberVO) {
		int updateCnt = template.update("memberSQL.manageUpdateMemberAuthor", memberVO);
		return updateCnt;
	}

	/**
	* Method : manageDeleteMemberDel
	* 작성자 : jin
	* 변경이력 :
	* @param params
	* @return
	* Method 설명 : 관리자 회원관리 회원삭제여부 Y로 수정하는 메서드
	 */
	@Override
	public int manageDeleteMemberDel(String mem_id) {
		int deleteCnt = template.update("memberSQL.manageDeleteMemberDel", mem_id);
		return deleteCnt;
	}

	@Override
	public int manageCountMemberDel() {
		int delCnt = template.selectOne("memberSQL.manageCountMemberDel");
		return delCnt;
	}

	@Override
	public int manageCountMemberAuth() {
		int authCnt = template.selectOne("memberSQL.manageCountMemberAuth");
		return authCnt;
	}
	
	/**
	* Method : findIdCheck
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 31.
	* 변경이력 :
	* @param memberVo
	* @return
	* Method 설명 : 해당 정보에 만족하는 회원이 있으면 해당 회원의 아이디를 반환 해준다.
	*/
	@Override
	public MemberVO findIdCheck(MemberVO memberVo) {
		
		MemberVO resultMemberVo = null;
		
		try {
			
			resultMemberVo = template.selectOne("memberSQL.findIdCheck", memberVo);
			
		} catch (Exception e) {
			e.printStackTrace();
			return resultMemberVo;
		}
		
		return resultMemberVo;
	}
	
	/**
	* Method : findPassCheck
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 31.
	* 변경이력 :
	* @param memberVo
	* @return
	* Method 설명 : 해당 정보에 만족하는 회원이 있으면 해당 회원의 비밀번호를 반환 해준다.
	*/
	@Override
	public MemberVO findPassCheck(MemberVO memberVo) {
		
		MemberVO resultMemberVo = null;
		
		try {
			
			resultMemberVo = template.selectOne("memberSQL.findPassCheck", memberVo);
			
		} catch (Exception e) {
			e.printStackTrace();
			return resultMemberVo;
		}
		
		return resultMemberVo;
	}
	
	/**
	* Method : updateMember
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2019. 1. 2.
	* 변경이력 :
	* @param memberVo
	* @return
	* Method 설명 : 회원 아이디와 일치하는 튜플에 정보를 업데이트 한다. 
	*/
	@Override
	public int updateMember(MemberVO memberVo) {
		
		int resultCnt = 0;
		
		try {
			
			resultCnt = template.update("memberSQL.updateMember", memberVo);
			
		} catch (Exception e) {
			e.printStackTrace();
			return resultCnt;
			
		} 
		
		return resultCnt;
	}

}
