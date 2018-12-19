package kr.co.tripweaver.mymenu.mypage.tripplan.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

import kr.co.tripweaver.mymenu.mypage.tripplan.dao.ITripPlanDao;
import kr.co.tripweaver.mymenu.mypage.tripplan.model.ClusterVO;
import kr.co.tripweaver.mymenu.mypage.tripplan.model.MypageTripPlanForListVO;
import kr.co.tripweaver.mymenu.mypage.tripplan.model.TripplanVO;

@Service
public class TripPlanService implements ITripPlanService{
	
	Logger logger = LoggerFactory.getLogger(TripPlanService.class);
	
	@Autowired
	ITripPlanDao tripPlanDao;
	
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
		return tripPlanDao.insertTripplanReturnId(tripplanVo);
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
		return tripPlanDao.tripplanListForMypageByMemberId(mem_id);
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
		return tripPlanDao.selectTripPlanByTripplanId(tripplan_id);
	}
	
	/**
	* Method : deleteTripplanBytripplanId
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 14.
	* 변경이력 :
	* @param tripplan_id
	* @return
	* Method 설명 : tripplan_id 로 해당 tripplan객체의 del부분을 'Y'로 변경한다
	*/
	public int deleteTripplanBytripplanId(String tripplan_id){
		return tripPlanDao.deleteTripplanBytripplanId(tripplan_id);
	}
	
	/**
	* Method : updateTripplanBytripplanId
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 15.
	* 변경이력 :
	* @param tripplanVo
	* @return
	* Method 설명 : tripplan_vo를 가져와 해당 tripplanVo 관련 부분을 수정한다.
	*/
	public int updateTripplanBytripplanId(TripplanVO tripplanVo){
		return tripPlanDao.updateTripplanBytripplanId(tripplanVo);
	}
	
	/**
	* Method : selectAllClusterList
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 17.
	* 변경이력 :
	* @return
	* Method 설명 : 메인에 있는 지도애 쓰기위한 clusterVo List 를 받아온다. 
	*/
	public List<ClusterVO> selectAllClusterList(){
		return tripPlanDao.selectAllClusterList();
	}
	
	/**
	* Method : selectClusterListByXY
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 17.
	* 변경이력 :
	* @param markers
	* @return
	* Method 설명 : X좌표 및 Y좌표에 대한 값을 받아와 해당 존재하는 클러스터 객체 값을 받아온다. 
	*/
	public List<ClusterVO> selectClusterListByXY(String markers){
		
		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(markers);
		JsonArray positions = element.getAsJsonObject().get("positions").getAsJsonArray();
		
		List<ClusterVO> clusterList = new ArrayList<>();
		Map<String, String> xy = new HashMap<>();
		
		for(int i = 0 ; i < positions.size(); i++) {
			logger.debug("positions X좌표: {}", positions.get(i).getAsJsonObject().get("ib").getAsString());
			logger.debug("positions Y좌표: {}", positions.get(i).getAsJsonObject().get("jb").getAsString());
			
			xy.put("mapmark_x_coor", positions.get(i).getAsJsonObject().get("ib").getAsString());
			xy.put("mapmark_y_coor", positions.get(i).getAsJsonObject().get("jb").getAsString());
			
			ClusterVO clusterVo = tripPlanDao.selectClusterVoByXY(xy);
			
			if(clusterVo != null) {
				clusterList.add(clusterVo);
			}
			
			xy.clear();
			
		}
		
		return clusterList;
	}
	
	/**
	* Method : selectClusterListBySearch
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 18.
	* 변경이력 :
	* @param searchMap
	* @return
	* Method 설명 : 검색 조건에 통해 얻어낸 조건들을 맵을 통해 보내서 해당 조건에 만족하는 클러스터 리스트를 뽑아온다.
	*/
	public List<ClusterVO> selectClusterListBySearch(Map<String, String> searchMap){
		return tripPlanDao.selectClusterListBySearch(searchMap);
	}
	
}
