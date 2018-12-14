package kr.co.tripweaver.mymenu.mypage.tripplan.service;

import kr.co.tripweaver.mymenu.mypage.tripplan.model.DailyPlanVO;

public interface IDailyPlanService {
	
	
	/**
	* Method : insertDailyPlan
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 13.
	* 변경이력 :
	* @param dailyplanVo
	* @return
	* Method 설명 : 해당 dailyplanVo를 dailyplan table db 에 삽입하는 메서드 
	* 성공을 하면 1 실패하면 0을 반환한다. 
	*/
	public int insertDailyPlan(DailyPlanVO dailyplanVo);
}
