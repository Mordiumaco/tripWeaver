package kr.co.tripweaver.mymenu.mypage.tripplan.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import kr.co.tripweaver.mymenu.mypage.tripplan.model.MypageTripPlanForListVO;
import kr.co.tripweaver.mymenu.mypage.tripplan.model.TripplanVO;

/**
* TripPlanDao.java
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
@Repository
public class TripPlanDao implements ITripPlanDao{
	
	Logger logger = LoggerFactory.getLogger(TripPlanDao.class);
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;
	
	
	/**
	* Method : insertTripplanReturnId
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 13.
	* 변경이력 :
	* @param tripplanVo
	* @return
	* Method 설명 : String으로 리턴을 진행하며 insert가 이상이 없을시 해당 만들어진 tripplan 의 id 값을 반환한다.
	*/
	@Override
	public String insertTripplanReturnId(TripplanVO tripplanVo) {
		
		try {
			int result = template.insert("tripplanSQL.insertTripplanReturnId", tripplanVo);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		logger.debug("test : {}", tripplanVo.getTripplan_id());
		
		return tripplanVo.getTripplan_id();
	}
	
	/**
	* Method : tripplanListForMypageByMemberId
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 13.
	* 변경이력 :
	* @param mem_id
	* @return
	* Method 설명 : 멤버가 가지고 있는 tripplan list 및 my page view에 맞게 필요한 정보를 가져온 객체 MypageTripPlanForListVO 리스트를 반환한다.
	*/
	@Override
	public List<MypageTripPlanForListVO> tripplanListForMypageByMemberId(String mem_id){
		
		List<MypageTripPlanForListVO> mypageTripPlanForListVoList =  null;
		
		try {
			
			mypageTripPlanForListVoList = template.selectList("tripplanSQL.tripplanListForMypageByMemberId", mem_id);
			
		} catch (Exception e) {
			e.printStackTrace();
			return mypageTripPlanForListVoList;
		}
		
		return mypageTripPlanForListVoList;
	}
	
	/**
	* Method : selectTripPlanByTripplanId
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 14.
	* 변경이력 :
	* @param tripplan_id
	* @return
	* Method 설명 : tripplan_id 로 해당 객체를 받아온다.
	*/
	@Override
	public TripplanVO selectTripPlanByTripplanId(String tripplan_id) {
		
		TripplanVO tripplanVo =  null;
		
		try {
			
			tripplanVo = template.selectOne("tripplanSQL.selectTripPlanByTripplanId", tripplan_id);
			
		} catch (Exception e) {
			e.printStackTrace();
			return tripplanVo;
		}
		
		return tripplanVo;
	}
}
