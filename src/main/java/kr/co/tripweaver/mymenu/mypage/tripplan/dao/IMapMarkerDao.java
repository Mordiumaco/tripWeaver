package kr.co.tripweaver.mymenu.mypage.tripplan.dao;

import kr.co.tripweaver.mymenu.mypage.tripplan.model.MapMarkerVO;

/**
* IMapMarkerDao.java
*
* @author Jae Hyeon Choi
* @version 1.0
* @since 2018. 12. 13.
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
public interface IMapMarkerDao {
	
	/**
	* Method : insertMapmarker
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 13.
	* 변경이력 :
	* @return
	* Method 설명 : 맵마커 테이블에 db를 저장 
	*/
	public int insertMapmarker(MapMarkerVO mapMarkerVo);
		
}
