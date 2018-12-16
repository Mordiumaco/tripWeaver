package kr.co.tripweaver.mymenu.mypage.tripplan.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tripweaver.mymenu.mypage.tripplan.dao.IMapMarkerDao;
import kr.co.tripweaver.mymenu.mypage.tripplan.model.MapMarkerVO;

@Service
public class MapMarkerService implements IMapMarkerService {
	
	@Autowired
	IMapMarkerDao mapMarkerdao;
	
	/**
	* Method : insertMapmarker
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 13.
	* 변경이력 :
	* @return
	* Method 설명 : 맵마커 테이블에 mapMarkerVo 객체의 내용을 저장한다.
	*/
	public int insertMapmarker(MapMarkerVO mapMarkerVo) {
		return mapMarkerdao.insertMapmarker(mapMarkerVo);
	}
	
	/**
	* Method : selectMapMarkerByTripAreaId
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 14.
	* 변경이력 :
	* @param triparea_id
	* @return
	* Method 설명 : triparea_id 로 mapmarekr 객체를 반환해준다.  
	*/
	@Override
	public MapMarkerVO selectMapMarkerByTripAreaId(String triparea_id) {
		return mapMarkerdao.selectMapMarkerByTripAreaId(triparea_id);
	}
}
