package kr.co.tripweaver.mymenu.mypage.tripplan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tripweaver.mymenu.mypage.tripplan.dao.ITripAreaDao;
import kr.co.tripweaver.mymenu.mypage.tripplan.model.TripareaVO;

@Service
public class TripAreaService implements ITripAreaService{
	
	@Autowired
	ITripAreaDao tripAreaDao;
	
	/**
	* Method : insertTripAreaReturnId
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 13.
	* 변경이력 :
	* @param tripareaVo
	* @return
	* Method 설명 : tripArea 정보를 삽입하고 해당 만들어진 아이디를 받아온다. 
	*/
	@Override
	public String insertTripAreaReturnId(TripareaVO tripareaVo) {
		return tripAreaDao.insertTripAreaReturnId(tripareaVo);
	}
	
	/**
	* Method : selectTripAreaByTripplanId
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 14.
	* 변경이력 :
	* @param tripplan_id
	* @return
	* Method 설명 : tripplan_id 로 해당 tripareaVo 객체를 받아온다.
	*/
	public List<TripareaVO> selectTripAreaByTripplanId(String tripplan_id){
		return tripAreaDao.selectTripAreaByTripplanId(tripplan_id);
	}
	
	
}
