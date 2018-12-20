package kr.co.tripweaver.essay.web;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.tripweaver.essay.model.EssayVO;
import kr.co.tripweaver.essay.service.EssayService;
import kr.co.tripweaver.essay.service.IEssayService;
import kr.co.tripweaver.member.model.MemberVO;
import kr.co.tripweaver.mymenu.guideplan.model.GuidePlanVO;
import kr.co.tripweaver.mymenu.guideplan.service.IGuidePlanService;
import kr.co.tripweaver.mymenu.mypage.tripplan.model.DailyPlanVO;
import kr.co.tripweaver.mymenu.mypage.tripplan.model.MapMarkerVO;
import kr.co.tripweaver.mymenu.mypage.tripplan.model.MypageTripPlanForListVO;
import kr.co.tripweaver.mymenu.mypage.tripplan.model.TripareaVO;
import kr.co.tripweaver.mymenu.mypage.tripplan.model.TripplanVO;
import kr.co.tripweaver.mymenu.mypage.tripplan.service.IDailyPlanService;
import kr.co.tripweaver.mymenu.mypage.tripplan.service.IMapMarkerService;
import kr.co.tripweaver.mymenu.mypage.tripplan.service.ITripAreaService;
import kr.co.tripweaver.mymenu.mypage.tripplan.service.ITripPlanService;

@RequestMapping("/essay")
@Controller
public class EssayController {
	
	Logger logger = LoggerFactory.getLogger(EssayController.class);
	
	@Autowired
	ITripPlanService tripPlanService;
	
	@Autowired
	ITripAreaService tripAreaService;
	
	@Autowired
	IMapMarkerService mapMarkerService;
	
	@Autowired
	IDailyPlanService dailyPlanService;
	
	@Autowired
	IEssayService essayService; 
	
	@Autowired
	IGuidePlanService guidePlanService;
	
	@RequestMapping("/write")
	public ModelAndView essayWriteView(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		
		MemberVO memberVo = (MemberVO)session.getAttribute("loginInfo");
		
		if(memberVo == null) {
			mav.setViewName("LoginCheckError");
			return mav;
		}
		
		String mem_id = memberVo.getMem_id();
		
		List<MypageTripPlanForListVO> mypageTripPlanForListVoList = tripPlanService.tripplanListForMypageByMemberId(mem_id);
		
		logger.debug("-----------------------------");
		for(int i = 0; i < mypageTripPlanForListVoList.size(); i++) {
			logger.debug("mypageTrip 내용 : {}", mypageTripPlanForListVoList.get(i));
		}
		
		mav.addObject("mypageTripPlanForListVoList", mypageTripPlanForListVoList);
		mav.setViewName("essay/essay_write");
		
		return mav;
	}
	
	@RequestMapping("/essayTripplanAjax")
	public String essayTripplanAjax(String selTripplan, Model model) {
		
		logger.debug("Tripplan Id Check = {}" , selTripplan);
		
		String tripplan_id = selTripplan;
		
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
		
		
		model.addAttribute("tripplanVo", tripplanVo);
		model.addAttribute("mapMarkerList", mapMarkerList);
		model.addAttribute("dailyPlanList", dailyPlanList);
		
		return "jsonView";
	}
	
	@RequestMapping("/insertEssayForm")
	public String insertEssayFormView(HttpSession session, EssayVO essayVo, Model model) {
		
		MemberVO memberVo = (MemberVO)session.getAttribute("loginInfo");
		
		if(memberVo == null) {
			return "LoginCheckError";
		}
		
		logger.debug("---------------------------");
		logger.debug("essayVo : {}", essayVo);
		logger.debug("---------------------------");
		
		essayVo.setMem_id(memberVo.getMem_id());
		
		String essay_id = essayService.essayInsert(essayVo);
		
		if(essay_id == null) {
			return "dbError";
		}
		
		return "redirect: /main/main";
	}
	
	@RequestMapping("/insertEssayFormForGuide")
	public String insertEssayFormForGuideView(HttpSession session, EssayVO essayVo, Model model, String[] guideplan_start_day,
			String[] guideplan_end_day, String[] guideplan_peo_count) {
		
		//일정 부분을 제대로 채워넣지 않았을때..
		if(guideplan_start_day.length != guideplan_end_day.length || guideplan_end_day.length != guideplan_peo_count.length) {
			return "emptyError";
		}
		
		MemberVO memberVo = (MemberVO)session.getAttribute("loginInfo");
		
		if(memberVo == null) {
			return "LoginCheckError";
		}
		
		essayVo.setMem_id(memberVo.getMem_id());
		
		logger.debug("---------------------------");
		logger.debug("essayVo : {}", essayVo);
		logger.debug("---------------------------");
		
		
		
		String essay_id = essayService.essayInsert(essayVo);
		
		if(essay_id == null) {
			return "dbError";
		}
		
		GuidePlanVO guidePlanVo = new GuidePlanVO();
		guidePlanVo.setEssay_id(essay_id);
		
		if(guideplan_start_day.length != 0) {
			for(int i = 0; i < guideplan_start_day.length; i++) {
				
				logger.debug("guideplan_strat_day : {}", guideplan_start_day[i]);
				logger.debug("guideplan_end_day : {} ", guideplan_end_day[i]);
				logger.debug("guideplan_peo_count : {} ", guideplan_peo_count[i]);
				
				guidePlanVo.setGuideplan_start_day(Date.valueOf(guideplan_start_day[i]));
				guidePlanVo.setGuideplan_end_day(Date.valueOf(guideplan_end_day[i]));
				guidePlanVo.setGuideplan_peo_count(Integer.parseInt(guideplan_peo_count[i]));
				
				int guidePlanResultCnt = guidePlanService.insertGuidePlan(guidePlanVo);
				
				if(guidePlanResultCnt == 0) {
					return "dbError";
				}
				
			}
		}
		
		return "redirect: /main/main";
	}
	
	
	
}
