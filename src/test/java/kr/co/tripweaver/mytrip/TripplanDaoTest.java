package kr.co.tripweaver.mytrip;

import static org.junit.Assert.assertEquals;

import java.sql.Date;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import kr.co.tripweaver.mymenu.mypage.tripplan.dao.ITripPlanDao;
import kr.co.tripweaver.mymenu.mypage.tripplan.model.TripplanVO;
import kr.co.tripweaver.test.ServiceDaoTestConfig;

public class TripplanDaoTest extends ServiceDaoTestConfig{

	Logger logger = LoggerFactory.getLogger(TripplanDaoTest.class);

	@Autowired
	ITripPlanDao tripplanDao;
	
	/**
	* Method : insertTripplanReturnIdTest
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 13.
	* 변경이력 :
	* Method 설명 : 제대로 정보가 들어가나 테스트 그리고 string값으로 해당 만들어진 아이디를 반환하는지 확인하는 테스트
	*  
	*/
	@SuppressWarnings("static-access")
	@Test
	public void insertTripplanReturnIdTest() {
		
		TripplanVO tripplanVo = new TripplanVO();
		tripplanVo.setTripplan_days(6);
		tripplanVo.setMem_id("test1");
		tripplanVo.setTripplan_image("null");
		tripplanVo.setTripplan_peo_count(3);
		tripplanVo.setTripplan_peo_type("1");
		tripplanVo.setTripplan_season("1");
		tripplanVo.setTripplan_start_day(Date.valueOf("2018-12-12"));
		tripplanVo.setTripplan_theme("1");
		tripplanVo.setTripplan_title("testtest");
		
		tripplanDao.insertTripplanReturnId(tripplanVo);
		
		String tripplan_id = tripplanVo.getTripplan_id();
		
		logger.debug("tripplan return value : {} ", tripplan_id);
		
		assertEquals(false, tripplan_id.isEmpty());
	}
	
	
}
