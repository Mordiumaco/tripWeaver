package kr.co.tripweaver.mymenu.mypage.tripplan.service;

import java.util.List;

import kr.co.tripweaver.mymenu.mypage.tripplan.model.MypageTripPlanForListVO;
import kr.co.tripweaver.mymenu.mypage.tripplan.model.TripplanVO;

public interface ITripPlanService {
	
	
	/**
	* Method : insertTripplanReturnId
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 13.
	* 변경이력 :
	* @param tripplanVo
	* @return
	* Method 설명 : String으로 리턴을 진행하며 insert가 이상이 없을시 해당 만들어진 tripplan 의 id 값을 반환한다.
	*/
	public String insertTripplanReturnId(TripplanVO tripplanVo);
	
	/**
	* Method : tripplanListForMypageByMemberId
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 13.
	* 변경이력 :
	* @param mem_id
	* @return
	* Method 설명 : 멤버가 가지고 있는 tripplan list 및 my page view에 맞게 필요한 정보를 가져온 객체 MypageTripPlanForListVO 리스트를 반환한다.
	*/
	public List<MypageTripPlanForListVO> tripplanListForMypageByMemberId(String mem_id);
}
