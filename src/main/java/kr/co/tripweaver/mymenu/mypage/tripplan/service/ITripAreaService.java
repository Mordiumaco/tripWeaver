package kr.co.tripweaver.mymenu.mypage.tripplan.service;

import java.util.List;

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
	
	/**
	* Method : selectTripAreaByTripplanId
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 14.
	* 변경이력 :
	* @param tripplan_id
	* @return
	* Method 설명 : tripplan_id 로 해당 tripareaVo 객체를 받아온다.
	*/
	public List<TripareaVO> selectTripAreaByTripplanId(String tripplan_id);
}
