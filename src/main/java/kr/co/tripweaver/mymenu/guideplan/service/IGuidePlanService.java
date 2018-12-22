package kr.co.tripweaver.mymenu.guideplan.service;

import java.util.List;

import kr.co.tripweaver.mymenu.guideplan.model.GuidePlanVO;

/**
* IGuidePlanService.java
*
* @author Jae Hyeon Choi
* @version 1.0
* @since 2018. 12. 20.
* @see
* 
* << 클래스 생성 목적 >>
* 
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
public interface IGuidePlanService {
	
	/**
	* Method : insertGuidePlan
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 20.
	* 변경이력 :
	* @return
	* Method 설명 : 가이드를 위한 일정 테이블을 db에 넣어주는 서비스
	*/
	public int insertGuidePlan(GuidePlanVO guidePlanVo);
	
	
	/**
	* Method : selectGuidePlanByEssayId
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 21.
	* 변경이력 :
	* @param essay_id
	* @return
	* Method 설명 : essay_id로 GuidePlanVO를 받아온다. 
	*/
	public List<GuidePlanVO> selectGuidePlanByEssayId(String essay_id);
}
