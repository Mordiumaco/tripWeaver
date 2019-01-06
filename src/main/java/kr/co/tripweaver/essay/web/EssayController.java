package kr.co.tripweaver.essay.web;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.tripweaver.common.comment.model.CommentVO;
import kr.co.tripweaver.common.comment.service.ICommentService;
import kr.co.tripweaver.common.like.model.LikeVO;
import kr.co.tripweaver.common.like.service.ILikeService;
import kr.co.tripweaver.essay.model.EssayVO;
import kr.co.tripweaver.essay.service.IEssayService;
import kr.co.tripweaver.manager.report.model.ReportVO;
import kr.co.tripweaver.manager.report.service.IReportService;
import kr.co.tripweaver.member.model.MemberVO;
import kr.co.tripweaver.member.service.IMemberService;
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
import kr.co.tripweaver.mymenu.reservation.service.IReservationService;

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
	
	@Autowired
	IMemberService memberService;
	
	@Autowired
	ICommentService commentService;
	
	@Autowired
	IReservationService reservationService;
	
	@Autowired
	ILikeService likeService;
	
	// 신고 기능을 위한 부분 2018. 12. 31
	@Autowired
	IReportService reportService;
	
	@RequestMapping("/write")
	public ModelAndView essayWriteView(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		
		MemberVO memberVo = (MemberVO)session.getAttribute("loginInfo");
		
		if(memberVo == null) {
			mav.setViewName("loginCheckError");
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
			return "loginCheckError";
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
			return "loginCheckError";
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
	
	/**
	* Method : essayView
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 20.
	* 변경이력 :
	* @param model
	* @return
	* Method 설명 :essay 상세보기를 위한 컨트롤러 뷰 
	*/
	@RequestMapping("/essayView")
	public String essayView(Model model, String essay_id, HttpSession session) {
		
		//해당 회원이 로그인 되있나 확인 
		MemberVO loginMemberVo = (MemberVO)session.getAttribute("loginInfo");
		
		//해당 글의 조회 수를 올려 준다. 
		
		essayService.addViewCountByEssayId(essay_id);
		
		logger.debug("-------------------------");
		logger.debug("essay_id : {} ", essay_id);
		logger.debug("-------------------------");
		
		EssayVO essayVo = essayService.selectEssayByEssayId(essay_id);
		
		
		//로그인이 되어 있으면 해당 하트 표시를 보여줌 
		if(loginMemberVo != null) {
			
			LikeVO likeVo = new LikeVO();
			likeVo.setLike_rel_art_id(essayVo.getEssay_id());
			likeVo.setMem_id(loginMemberVo.getMem_id());
			
			LikeVO resultLikeVo = likeService.likeCheckByMemIdAndLikeRelId(likeVo);
			
			
			model.addAttribute("likeVo", resultLikeVo);
		}
		
		//좋아요 수 처음 체크할때
		int likeCount = likeService.likeCount(essayVo.getEssay_id());
		model.addAttribute("likeCount", likeCount);
		
		//글쓴이 받아오기 
		MemberVO memberVo = memberService.selectMemberById(essayVo.getMem_id());
		
		String tripplan_id = essayVo.getTripplan_id();
		
		//해당 글이 Guide글일경우 예약일자를 가진 Guideplan을 불러온다. 
		if(essayVo.getEssay_filter().equals("G")) {
			
			List<GuidePlanVO> guidePlanList = guidePlanService.selectGuidePlanByEssayId(essay_id);
			
			model.addAttribute("guidePlanList", guidePlanList);
			
			//가이드 리스트가 존재할시에
			if(guidePlanList != null) {
				//그리고 해당 예약에 대한 인원수를 체크하기 위해 예약 인원수를 체크한다. 
				for(int i = 0; i < guidePlanList.size(); i++) {
					
					GuidePlanVO guidePlanVo = guidePlanList.get(i);
					
					//해당 예약 인원에 대한 총 인원 수를 가이드 플랜 객체에 넣어준다. 
					Integer total_res_people_count = reservationService.reserTotalPeopleCountByGuidePlanId(guidePlanVo.getGuideplan_id());
					
					//total_people_count 가 null 값일 씨 0 을 넣어준다. 
					if(total_res_people_count == null) {
						guidePlanVo.setTotal_res_people_count(0);
					}else {
						//존재할 경우에는 그냥 월래 total_people_count 에 존재하는 숫자를 넣어준다. 
						guidePlanVo.setTotal_res_people_count(total_res_people_count);
					}
				}
			}
			
		}
		
		//댓글 리스트를 받아온다.
		//------------------------------------
			
			//필요로 하는건 essay id 와 comment fileter 값이다
			//맵으로 넣어준다.
			Map<String, String> param = new HashMap<>();
			
			param.put("comt_rel_art_id", essay_id);
			param.put("filter_id", "essay");
		
			List<CommentVO> commentList = commentService.selectEssayCommentByArtIdAndFilterId(param);
			
			model.addAttribute("commentList", commentList);
			
		//------------------------------------
		
		logger.debug("-------------------------");
		logger.debug("tripplan_id : {} ", tripplan_id);
		logger.debug("-------------------------");
		
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
		
		model.addAttribute("writerVo", memberVo);
		model.addAttribute("essayVo", essayVo);
		model.addAttribute("tripplanVo", tripplanVo);
		model.addAttribute("mapMarkerList", mapMarkerList);
		model.addAttribute("dailyPlanList", dailyPlanList);
		
		
		//신고사유  박찬배 2018.12.31   신고기능  작성
		List<ReportVO> reportVOs = reportService.selectReportreason();
		model.addAttribute("reportVOs", reportVOs);
		

		return "/essay/essay_view";
	}
	
	/**
	* Method : essayCommentInsertAjax
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 21.
	* 변경이력 :
	* @return
	* Method 설명 : 현재 존재하는 댓글을 insert 해주고 해당 게시글에 맞는 댓글들을 다시 업데이트하여 불러온다
	*/
	@RequestMapping("essayCommentInsertAjax")
	public String essayCommentInsertAjax(HttpSession session, String essay_id, String comt_cnt, Model model) {
		
		MemberVO memberVo = (MemberVO)session.getAttribute("loginInfo");
		
		if(memberVo == null) {
			return "loginCheckError";
		}
		
		//댓글을 삽입한다. 
		CommentVO commentVo = new CommentVO();
		
		commentVo.setFilter_id("essay");
		commentVo.setComt_rel_art_id(essay_id);
		commentVo.setComt_cnt(comt_cnt);
		commentVo.setMem_id(memberVo.getMem_id());
		
		String comt_id = commentService.insertComment(commentVo);
		
		//댓글이 제대로 달리지 않으면 ....db 에러 페이지로
		if(comt_id == null) {
			return "dbError";
		}
		
		
		logger.debug("에세이 Ajax INSERT 부분 essay_id : {}", essay_id);
		
		
		Map<String, String> param = new HashMap<>();
		param.put("comt_rel_art_id", essay_id);
		param.put("filter_id", "essay");
		
		logger.debug("-------------------------------------------------------------------------");
		
		List<CommentVO> commentList = commentService.selectEssayCommentByArtIdAndFilterId(param);
		
		model.addAttribute("commentList", commentList);
		logger.debug("commentList Size : {}", commentList.size());
		for(int i = 0; i < commentList.size(); i++) {
			
			logger.debug("comment comt_rel_art_id : {}", commentList.get(i).getComt_rel_art_id());
		}
		
		logger.debug("-------------------------------------------------------------------------");
		
		return "jsonView";
	}
	
	/**
	* Method : essayCommentDeleteAjax
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 21.
	* 변경이력 :
	* @param session
	* @param comt_id
	* @return
	* Method 설명 : 삭제 관련 Ajax
	*/
	@RequestMapping("essayCommentDeleteAjax")
	public String essayCommentDeleteAjax(HttpSession session, String comt_id, Model model) {
		
		MemberVO memberVo = (MemberVO)session.getAttribute("loginInfo");
		
		if(memberVo == null) {
			return "loginCheckError";
		}
		
		int resultCnt = commentService.deleteComment(comt_id);
		
		model.addAttribute("resultCnt", resultCnt);
		
		return "jsonView";
	}
		
	@RequestMapping("/essayUpdate")
	public String essayUpdateView(Model model, String essay_id, HttpSession session) {
		
		MemberVO memberVo = (MemberVO)session.getAttribute("loginInfo");
		
		if(memberVo == null) {
			return "loginCheckError";
		}
		
		EssayVO essayVo = essayService.selectEssayByEssayId(essay_id);
		
		model.addAttribute("essayVo", essayVo);
		
		String tripplan_id = essayVo.getTripplan_id();
		
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
		
		
		
		model.addAttribute("essayVo", essayVo);
		model.addAttribute("tripplanVo", tripplanVo);
		model.addAttribute("mapMarkerList", mapMarkerList);
		model.addAttribute("dailyPlanList", dailyPlanList);
		
		return "essay/essay_update";
	}
	
	
	@RequestMapping("essayUpdateForm")
	public String essayUpdateForm(EssayVO essayVo) {
		
		if(essayVo!=null) {
			logger.debug("essayVo value = {}", essayVo);
		}
		
		int resultCnt = essayService.essayUpdate(essayVo);
		
		if(resultCnt == 0) {
			return "dbError";
		}
		
		String essay_id = essayVo.getEssay_id();
		
		return "redirect:/essay/essayView?essay_id="+essay_id;
	}
	
	
	@RequestMapping("essayDelete")
	public String essayDeleteView(HttpSession session, String essay_id) {
		
		MemberVO memberVo = (MemberVO)session.getAttribute("loginInfo");
		
		if(memberVo == null) {
			return "loginCheckError";
		}
		
		int resultCnt = essayService.deleteEssayByEssayId(essay_id);
		
		if(resultCnt == 0) {
			return "dbError";
		}
		
		return "redirect: /main/main";
	}
	
	
	
}
