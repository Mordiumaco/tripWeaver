package kr.co.tripweaver.mymenu.mypage.tripplan.web;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

import kr.co.tripweaver.member.model.MemberVO;
import kr.co.tripweaver.mymenu.mypage.tripplan.model.DailyPlanVO;
import kr.co.tripweaver.mymenu.mypage.tripplan.model.MapMarkerVO;
import kr.co.tripweaver.mymenu.mypage.tripplan.model.TripareaVO;
import kr.co.tripweaver.mymenu.mypage.tripplan.model.TripplanVO;
import kr.co.tripweaver.mymenu.mypage.tripplan.service.IDailyPlanService;
import kr.co.tripweaver.mymenu.mypage.tripplan.service.IMapMarkerService;
import kr.co.tripweaver.mymenu.mypage.tripplan.service.ITripAreaService;
import kr.co.tripweaver.mymenu.mypage.tripplan.service.ITripPlanService;

/**
* MyPlanController.java
*
* @author Jae Hyeon Choi
* @version 1.0
* @since 2018. 12. 14.
* @see
* 
* << 클래스 생성 목적 >>
* 
*테스트 적용
*나의 일정에 관련된 모든 컨트롤러
*
* << 개정이력(Modification Information) >>
*
* 수정자 수정내용
* ------ ------------------------
* Jae Hyeon Choi 최초 생성
*
* 
*/
@RequestMapping("myplan")
@Controller
public class MyPlanController {
	
	Logger logger = LoggerFactory.getLogger(MyPlanController.class);
	
	@Autowired
	ITripPlanService tripPlanService;
	
	@Autowired
	ITripAreaService tripAreaService;
	
	@Autowired
	IMapMarkerService mapMarkerService;
	
	@Autowired
	IDailyPlanService dailyPlanService;
	
	@RequestMapping("/mytravel_write")
	public String mytravel_writeView() {
		return "mypage/travelmanagement/mytravel_write";
	}
	
	/**
	* Method : mytravel_write2View
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 14.
	* 변경이력 :
	* @param departDate
	* @param days
	* @param positionInfo
	* @return
	* Method 설명 : 나의 여행 일정 생성 2번째 뷰 
	*/
	@RequestMapping("/mytravel_write2")
	public ModelAndView mytravel_write2View(@RequestParam("departDate") String departDate, 
			String[] days, String positionInfo 
			) {
		
		logger.debug("departDate : {}", departDate);
		logger.debug("days : {}", days[0]);
		logger.debug("positionInfo : {}", positionInfo);
		
		ModelAndView mav = new ModelAndView("mypage/travelmanagement/mytravel_write2");
		mav.addObject("departDate", departDate);
		mav.addObject("days", days);
		mav.addObject("positionInfo", positionInfo);
		return mav;
	}
	
	/**
	* Method : mytrableFormView
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 14.
	* 변경이력 :
	* @param dailyplan_order
	* @param dailyplan_cnt
	* @param dailyplan_day
	* @param dailyplan_traffic
	* @param dailyplan_room
	* @param dailyplan_area
	* @param tripplanVo
	* @param tripplan_image_file
	* @param mapMarkers
	* @param triparea_stay_days
	* @param session
	* @return
	* @throws IOException
	* Method 설명 : 나의 일정을 작성을 완료하고 완료버튼을 클릭헀을때 가는 메서드 부분
	*/
	@RequestMapping("/mytravelForm")
	public ModelAndView mytrableFormView(String[] dailyplan_order, String[] dailyplan_cnt, 
			String[] dailyplan_day, String[] dailyplan_traffic, String[] dailyplan_room,
			String[] dailyplan_area, TripplanVO tripplanVo, @RequestParam("tripplan_image_file") MultipartFile tripplan_image_file,
			String mapMarkers, String triparea_stay_days, HttpSession session) throws IOException{
		
		MemberVO memberVo = (MemberVO)session.getAttribute("loginInfo");
		
		//멤버에 대한 정보가 없을경우
		if(memberVo == null) {
			return null;
		}
		
		String mem_id = memberVo.getMem_id();
		tripplanVo.setMem_id(mem_id);
		
		//------------------------1. File Section -----------------------------
		//처음에 대표 이미지 파일이 있는지 먼저 확인해본다.
		String directory = "C:/upload/tripplan/";
		if(!tripplan_image_file.isEmpty()) {
			//이미지 파일이 존재한다면 이부분이 실행된다.
			byte[] bytes = tripplan_image_file.getBytes();
			
			String fileName = UUID.randomUUID().toString()+tripplan_image_file.getOriginalFilename();
			
			
			tripplan_image_file.transferTo(new File(directory + File.separator + fileName));
			
			
			
			if(!fileName.endsWith(".jpg")&&!fileName.endsWith(".hwp")&&
					!fileName.endsWith(".png")&&!fileName.endsWith(".pdf")&&!fileName.endsWith(".xlsx")&&!fileName.endsWith(".xls")){
				File fileTest = new File(directory+fileName);
				fileTest.delete();
			}else{
				tripplanVo.setTripplan_image("tripplan/"+fileName);
			}
			
		}else {
			//이미지 파일이 존재하지 않는다면 이부분이 실행된다.
			tripplanVo.setTripplan_image("");
		}
		//-------------------------------------------------------------------------
		
		
		logger.debug("Tripplan 값이 들어오는지 확인 : {}", tripplanVo.toString());
		
		logger.debug("----------------------------------------");	
		
		logger.debug("tripplan 제목 : {}", tripplanVo.getTripplan_title());
		logger.debug("tripplan 여행테마 : {}", tripplanVo.getTripplan_theme());
		logger.debug("tripplan 시즌 : {} ", tripplanVo.getTripplan_season());
		logger.debug("tripplan 인원 구성타입 : {}", tripplanVo.getTripplan_peo_type());
		logger.debug("tripplan 인원수 : {}", tripplanVo.getTripplan_peo_count());
		logger.debug("tripplan 여행일수 : {}", tripplanVo.getTripplan_days());
		logger.debug("tripplan 출발일 : {}", tripplanVo.getTripplan_start_day());
		logger.debug("tripplan 이미지경로 : {}", tripplanVo.getTripplan_image());
		logger.debug("----------------------------------------");	
		
		
		//------------------------2. tripplan Section -----------------------------
		//다른 DB에 주입되기 위해서 tripplan db 내용이 먼저 들어가 만들어져야한다. 
		
			String current_tripplan_id =  tripPlanService.insertTripplanReturnId(tripplanVo);
			
			//제대로 DB 생성이 안되었을경우..
			if(current_tripplan_id.isEmpty()) {
				logger.debug("tripplan Service  생성 실패");
				return null;
			}
			
		//-------------------------------------------------------------------------
		logger.debug("dailyplan_order 총 갯수 : {}", dailyplan_order.length);
		logger.debug("dailyplan_cnt 총 갯수 : {}", dailyplan_cnt.length);
		
		logger.debug("file 값이 있는지 확인 : {}", tripplan_image_file.getSize());
		logger.debug("mapMarker JSON 값이 있는지 확인 : {}", mapMarkers);
		logger.debug("triparea_stay_days : {}", triparea_stay_days);
		String[] triparea_stay_day_split = triparea_stay_days.split(",");
		
		
		//-- GSON 라이브러리를 사용
		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(mapMarkers);
		JsonArray positions = element.getAsJsonObject().get("positions").getAsJsonArray();
		JsonArray sidoNames = element.getAsJsonObject().get("sidoNames").getAsJsonArray();
		JsonArray sigunguNames = element.getAsJsonObject().get("sigunguNames").getAsJsonArray();;
		JsonArray enbmyeondongNames = element.getAsJsonObject().get("enbmyeondongNames").getAsJsonArray();;
		
		logger.debug("positions 값들 : {}", positions.toString());
		for(int i = 0; i < positions.size(); i++) {
			
			
			logger.debug("숙박기간 triparea_stay_day_split : {}", triparea_stay_day_split[i]);
			logger.debug("순서 triparea_order : {}", i+1);
			logger.debug("positions X좌표: {}", positions.get(i).getAsJsonObject().get("ib").getAsString());
			logger.debug("positions Y좌표: {}", positions.get(i).getAsJsonObject().get("jb").getAsString());
			logger.debug("시도 : {}", sidoNames.get(i).getAsString());
			logger.debug("시군구 : {}", sigunguNames.get(i).getAsString());
			logger.debug("읍면동 : {}", enbmyeondongNames.get(i).getAsString());
			
		}
		
		//------------------------3.triparea and mapmarker section-------------------------
		
			for(int i = 0; i < triparea_stay_day_split.length; i++) {
				
				TripareaVO tripareaVo = new TripareaVO(Integer.parseInt(triparea_stay_day_split[i]), i+1, current_tripplan_id);
				
				String current_triparea_id = tripAreaService.insertTripAreaReturnId(tripareaVo);
				
				if(current_triparea_id == null) {
					logger.debug("triparea Service  생성 실패");
					return null;
				}
				
				MapMarkerVO mapMarkerVo = new MapMarkerVO(current_triparea_id ,sidoNames.get(i).getAsString(),
						sigunguNames.get(i).getAsString(), enbmyeondongNames.get(i).getAsString(), 
						positions.get(i).getAsJsonObject().get("ib").getAsString(), 
						positions.get(i).getAsJsonObject().get("jb").getAsString());
				
				int result = mapMarkerService.insertMapmarker(mapMarkerVo);
				
				if(result == 0) {
					logger.debug("mapMarkerService  생성 실패");
					return null;
				}
			}
			
		
		//---------------------------------------------------------------------------------
		
			
		logger.debug("");
		
		logger.debug("triparea_stay_days 여행일정이 있는지 확인 : {}", triparea_stay_days);
		
		logger.debug("dailyplan table에 집어넣을 내용들 Debug");
		for(int i=0; i < dailyplan_order.length; i++) {
			logger.debug("----------------------------------------");	
			logger.debug("순서 : {}", dailyplan_order[i]);
			logger.debug("지역 : {}", dailyplan_area[i]);
			logger.debug("내용 : {}", dailyplan_cnt[i]);
			logger.debug("일자 : {}", dailyplan_day[i]);
			logger.debug("교통 : {}", dailyplan_traffic[i]);
			logger.debug("숙소 : {}", dailyplan_room[i]);
			logger.debug("----------------------------------------");	
		}
		logger.debug("dailyplan table 내용 끝");	
		
		//------------------------4. dailyplan section -------------------------------------
		
		for(int i=0; i < dailyplan_order.length; i++) {
			
			DailyPlanVO dailyPlanVo = new DailyPlanVO(Integer.parseInt(dailyplan_order[i]), dailyplan_area[i], 
					dailyplan_cnt[i].replace("\r\n", "<br/>"), 
					Date.valueOf(dailyplan_day[i]), dailyplan_traffic[i].replace("\r\n", "<br/>"), 
					dailyplan_room[i].replace("\r\n", "<br/>"), current_tripplan_id);
			
			int result = dailyPlanService.insertDailyPlan(dailyPlanVo);
			
			if(result == 0) {
				logger.debug("dailyPlanService  생성 실패");
				return null;
			}
			
			
		}
		
		
		//----------------------------------------------------------------------------------
		ModelAndView mav = new ModelAndView("redirect:/main/mypage");
		return mav;
	}
	
	@RequestMapping("/mytravel_update")
	public ModelAndView mytravel_updateView(String tripplan_id) {
		ModelAndView mav = new ModelAndView("mypage/travelmanagement/mytravel_update");
		//tripplan 객체 받아오기
		TripplanVO tripplanVo =  tripPlanService.selectTripPlanByTripplanId(tripplan_id);
		
		List<DailyPlanVO> dailyPlanList = dailyPlanService.selectDailyPlanByTripplanId(tripplan_id);
		
		mav.addObject("tripplanVo", tripplanVo);
		mav.addObject("dailyPlanList", dailyPlanList);
		return mav;
	}
	
	@RequestMapping("/mytravelFormUpdate")
	public ModelAndView mytrableFormUpdateView(String[] dailyplan_cnt, 
			String[] dailyplan_traffic, String[] dailyplan_room,
			TripplanVO tripplanVo, @RequestParam(value="tripplan_image_file", required=false) MultipartFile tripplan_image_file,
			@RequestParam(value="fileCheck", required=false) String fileCheck, HttpSession session) throws IOException{
		
		ModelAndView mav = new ModelAndView();
		
		MemberVO memberVo = (MemberVO)session.getAttribute("loginInfo");
		
		//멤버에 대한 정보가 없을경우
		if(memberVo == null) {
			return null;
		}
		
		
		
		//------------------------1. File Section -----------------------------
		//fileCheck 가  null 이면 파일이 들어가진다.
		if(fileCheck == null){
			//처음에 대표 이미지 파일이 있는지 먼저 확인해본다.
			String directory = "C:/upload/tripplan/";
			if(!tripplan_image_file.isEmpty()) {
				//이미지 파일이 존재한다면 이부분이 실행된다.
				byte[] bytes = tripplan_image_file.getBytes();
				
				String fileName = UUID.randomUUID().toString()+tripplan_image_file.getOriginalFilename();
				
				
				tripplan_image_file.transferTo(new File(directory + File.separator + fileName));
				
				
				
				if(!fileName.endsWith(".jpg")&&!fileName.endsWith(".hwp")&&
						!fileName.endsWith(".png")&&!fileName.endsWith(".pdf")&&!fileName.endsWith(".xlsx")&&!fileName.endsWith(".xls")){
					File fileTest = new File(directory+fileName);
					fileTest.delete();
				}else{
					tripplanVo.setTripplan_image("tripplan/"+fileName);
				}
				
			}else {
				//이미지 파일이 존재하지 않는다면 이부분이 실행된다.
				tripplanVo.setTripplan_image("");
			}
		}else{
			tripplanVo.setTripplan_image(fileCheck);
		}
		//-------------------------------------------------------------------------
		
		int tripplanUpdateResult = tripPlanService.updateTripplanBytripplanId(tripplanVo);
		
		if(tripplanUpdateResult == 0){
			return null;
		}
		
		
		List<DailyPlanVO> dailyPlanList = dailyPlanService.selectDailyPlanByTripplanId(tripplanVo.getTripplan_id());
		
		for(int i=0; i < dailyPlanList.size(); i++) {
			
			DailyPlanVO dailyPlanVo = new DailyPlanVO(dailyPlanList.get(i).getDailyplan_id(), dailyplan_cnt[i], dailyplan_traffic[i].replace("\r\n", "<br/>"), dailyplan_room[i].replace("\r\n", "<br/>"));
			
			int result = dailyPlanService.updateDailyPlanByDailyId(dailyPlanVo);
			
			if(result == 0) {
				logger.debug("dailyPlanService  생성 실패");
				return null;
			}
			
			
		}
		
		mav.setViewName("redirect:/main/mypage");
		
		return mav;
	}
	
	@RequestMapping("/mytravel_delete")
	public ModelAndView mytravel_deleteView(String tripplan_id) {
		
		ModelAndView mav = new ModelAndView("redirect:/main/mypage");
		
		tripPlanService.deleteTripplanBytripplanId(tripplan_id);
		
		
		return mav;
	}
	
	/**
	* Method : mytravel_viewView
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 14.
	* 변경이력 :
	* @param tripplan_id
	* @param session
	* @return
	* Method 설명 : 일정을 클릭했을때 나오는 상세보기에 대한 뷰를 담당하는 메서드
	*/
	@RequestMapping("/mytravel_view")
	public ModelAndView mytravel_viewView(String tripplan_id, HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage/travelmanagement/mytravel_view");
		
		logger.debug("tripplan ID : {}", tripplan_id);
		
		//tripplan 객체 받아오기
		TripplanVO tripplanVo =  tripPlanService.selectTripPlanByTripplanId(tripplan_id);
		
		//tripplan id로 triparea 리스트 받아오기 
		List<TripareaVO> tripAreaList = tripAreaService.selectTripAreaByTripplanId(tripplan_id);
		
		List<MapMarkerVO> mapMarkerList = new ArrayList<>();
		//triparea로 mapmarker정보 받아오기 
		for(int i = 0 ; i < tripAreaList.size(); i++) {
			
			String triparea_id = tripAreaList.get(i).getTriparea_id();
			MapMarkerVO mapMarkerVo =  mapMarkerService.selectMapMarkerByTripAreaId(triparea_id);
			mapMarkerList.add(mapMarkerVo);
			
		}
		
		List<DailyPlanVO> dailyPlanList = dailyPlanService.selectDailyPlanByTripplanId(tripplan_id);
		
		
		mav.addObject("tripplanVo", tripplanVo);
		mav.addObject("mapMarkerList", mapMarkerList);
		mav.addObject("dailyPlanList", dailyPlanList);
		
		return mav;
	}
}
