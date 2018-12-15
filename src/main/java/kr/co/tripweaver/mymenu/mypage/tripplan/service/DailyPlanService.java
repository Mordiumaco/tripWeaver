package kr.co.tripweaver.mymenu.mypage.tripplan.service;

import java.util.List;

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
	/**
	* Method : selectDailyPlanByTripplanId
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 14.
	* 변경이력 :
	* @param tripplan_id
	* @return
	* Method 설명 : tripplan_id를 매개변수로 하여 dailyplanVo 리스트를 받아온다.
	*/
	@Override
	public List<DailyPlanVO> selectDailyPlanByTripplanId(String tripplan_id){
		return dailyPlanDao.selectDailyPlanByTripplanId(tripplan_id);
	}
	
	/**
	* Method : updateDailyPlanByDailyId
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 16.
	* 변경이력 :
	* @param dailyPlanVo
	* @return
	* Method 설명 : tripplan_id를 매개변수로 하여 dailyplanVo 리스트를 받아온다.
	*/
	public int updateDailyPlanByDailyId(DailyPlanVO dailyPlanVo){
		return dailyPlanDao.updateDailyPlanByDailyId(dailyPlanVo);
	}
}
