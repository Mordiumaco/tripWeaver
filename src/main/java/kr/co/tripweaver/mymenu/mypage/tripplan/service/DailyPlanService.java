package kr.co.tripweaver.mymenu.mypage.tripplan.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tripweaver.mymenu.mypage.tripplan.dao.IDailyPlanDao;
import kr.co.tripweaver.mymenu.mypage.tripplan.model.DailyPlanVO;

@Service
public class DailyPlanService implements IDailyPlanService {
	
	
	@Autowired
	IDailyPlanDao dailyPlanDao;
	
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
	@Override
	public int insertDailyPlan(DailyPlanVO dailyplanVo) {
		return dailyPlanDao.insertDailyPlan(dailyplanVo);
	}
}
