package kr.co.tripweaver.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tripweaver.member.dao.IMemberDao;
import kr.co.tripweaver.member.model.MemberVO;
import kr.co.tripweaver.util.page.PageUtil;

@Service
public class MemberService implements IMemberService {

	@Autowired
	IMemberDao memberDao;
	
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
		return memberDao.selectMemberByEmail(mem_email);
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
		return memberDao.insertNaverMember(memberVo);
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
		return memberDao.eternalDeleteMemberByEmail(mem_email);
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
	public Map<String, Object> selectMemberPageList(Map<String, Object> params) {
		int memberCnt = memberDao.selectMemberAllCount(params);
		List<MemberVO> memberVOs = memberDao.selectMemberPageList(params);
		int pageCnt = PageUtil.pageCnt(memberCnt, 10);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("memberCnt", memberCnt);
		resultMap.put("memberVOs", memberVOs);
		resultMap.put("pageCnt", pageCnt);
		return resultMap;
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
	public Map<String, Object> manageUpdateMemberAuthor(Map<String, Object> params) {
		MemberVO memberVO = (MemberVO) params.get("memberVO");
		int updateCnt = memberDao.manageUpdateMemberAuthor(memberVO);
		Map<String, Object> resultMap = selectMemberPageList(params);
		resultMap.put("updateCnt", updateCnt);
		return resultMap;
	}

	/**
	* Method : manageDeleteMemberDel
	* 작성자 : jin
	* 변경이력 :
	* @param params
	* @return
	* Method 설명 : 관리자 회원관리 삭제여부를 'Y'로 수정하고 해당페이지 멤버리스트를 반환하는 메서드
	 */
	@Override
	public Map<String, Object> manageDeleteMemberDel(Map<String, Object> params) {
		String mem_id = ((MemberVO)params.get("memberVO")).getMem_id();
		int deleteCnt = memberDao.manageDeleteMemberDel(mem_id);
		Map<String, Object> resultMap = selectMemberPageList(params);
		resultMap.put("deleteCnt", deleteCnt);
		return resultMap;
	}

	@Override
	public Map<String, Object> manageChkDeleteMemberDel(Map<String, Object> params) {
		String delArr = (String) params.get("delArr");
		String[] memList = delArr.split(";");
		int deleteCnt = 0;
		for(String mem_id : memList) {
			deleteCnt += memberDao.manageDeleteMemberDel(mem_id);
		}
		Map<String, Object> resultMap = selectMemberPageList(params);
		resultMap.put("deleteCnt", deleteCnt);
		return resultMap;
	}

	@Override
	public Map<String, Object> manageChkUpdateMemberAuthor(Map<String, Object> params) {
		String upArr = (String) params.get("upArr");
		String auArr = (String) params.get("auArr");
		String[] memList = upArr.split(";");
		String[] memAuthor = auArr.split(";");
		int updateCnt = 0;
		for(int i = 0; i < memList.length; i++) {
			MemberVO memberVO = new MemberVO();
			memberVO.setMem_id(memList[i]);
			memberVO.setMem_author(Integer.parseInt(memAuthor[i]));
			updateCnt += memberDao.manageUpdateMemberAuthor(memberVO);
		}
		
		Map<String, Object> resultMap = selectMemberPageList(params);
		resultMap.put("updateCnt", updateCnt);
		return resultMap;
	}
	
}
