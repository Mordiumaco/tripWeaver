package kr.co.tripweaver.mymenu.mypage.tripplan.service;

import kr.co.tripweaver.mymenu.mypage.tripplan.model.TripareaVO;

public interface ITripAreaService {
	
	/**
	* Method : insertTripAreaReturnId
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 13.
	* 변경이력 :
	* @param tripareaVo
	* @return
	* Method 설명 : tripArea 정보를 삽입하고 해당 만들어진 아이디를 받아온다. 
	*/
	public String insertTripAreaReturnId(TripareaVO tripareaVo);
	
}
