package kr.co.tripweaver.mymenu.mypage.tripplan.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.tripweaver.mymenu.mypage.tripplan.model.DailyPlanVO;
import kr.co.tripweaver.mymenu.mypage.tripplan.model.TripareaVO;

@Repository
public class DailyPlanDao implements IDailyPlanDao {
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;
	
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
	public int insertDailyPlan(DailyPlanVO dailyplanVo) {
		
		int result = 0;
		
		try {
			result = template.insert("dailyPlanSQL.insertDailyPlan", dailyplanVo);
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		
		return result;
		
		
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
		
		List<DailyPlanVO> dailyPlanList =  null;
		
		try {
			
			dailyPlanList = template.selectList("dailyPlanSQL.selectDailyPlanByTripplanId", tripplan_id);
			
		} catch (Exception e) {
			e.printStackTrace();
			return dailyPlanList;
		}
		
		return dailyPlanList;
	}
}
