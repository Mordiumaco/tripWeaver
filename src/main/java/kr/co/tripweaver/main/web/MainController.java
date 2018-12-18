package kr.co.tripweaver.main.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.tripweaver.member.model.MemberVO;
import kr.co.tripweaver.mymenu.mypage.tripplan.model.ClusterVO;
import kr.co.tripweaver.mymenu.mypage.tripplan.model.MypageTripPlanForListVO;
import kr.co.tripweaver.mymenu.mypage.tripplan.service.ITripPlanService;

@RequestMapping("/main")
@Controller
public class MainController {

	Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	ITripPlanService tripPlanService;
	
	@RequestMapping("/main")
	public String mainView() {
		
		
		return "index";
	}
	
	
	@RequestMapping("/initMain")
	public String initMainAjax(Model model) {
		
		List<ClusterVO> clusterList = tripPlanService.selectAllClusterList();
		
		
		logger.debug("clusterList Size : {}" ,  clusterList.size());
		
		model.addAttribute("clusterList", clusterList);
		
		
		return "jsonView";
	}
	
	@RequestMapping("/reload")
	public String mainMapReloadAjax(Model model, String markers) {
		
		logger.debug("markers : {}" ,  markers);
		
		List<ClusterVO> clusterList = tripPlanService.selectClusterListByXY(markers);
		
		model.addAttribute("clusterList", clusterList);
		
		return "jsonView";
	}
	
	@RequestMapping("/login")
	public String loginView() {
		return "login/login";
	}

	@RequestMapping("/register")
	public String registerView() {
		return "login/register";
	}

	@RequestMapping("/register_form")
	public String register_formView() {
		return "login/register_form";
	}

	@RequestMapping("/idPw_lost")
	public String idPw_lostView() {
		return "login/idPw_lost";
	}
	
	@RequestMapping("/adminMain")
	public String adminMainView(Model model) {
		model.addAttribute("gnb", 0);
		return "admin/adminMain";
	}
	
	@RequestMapping("/member")
	public String memberView(Model model) {
		model.addAttribute("gnb", 1);
		return "admin/membership/member";
	}
	
	@RequestMapping("/create_board")
	public String create_boardView(Model model) {
		model.addAttribute("gnb", 2);
		return "admin/board/create_board";
	}
	
	@RequestMapping("/declaration")
	public String declarationView(Model model) {
		model.addAttribute("gnb", 0);
		return "admin/setting/declaration";
	}
	
	@RequestMapping("/contact")
	public String contactView(Model model) {
		model.addAttribute("gnb", 3);
		return "admin/statistics/contact";
	}
	
	@RequestMapping("/contactTime")
	public String contactTimeView(Model model) {
		model.addAttribute("gnb", 3);
		return "admin/statistics/contactTime";
	}
	
	@RequestMapping("/hashTag")
	public String hashTagView(Model model) {
		model.addAttribute("gnb", 3);
		return "admin/statistics/hashTag";
	}
	
	@RequestMapping("/adminPost")
	public String adminPostView(Model model) {
		model.addAttribute("gnb", 3);
		return "admin/statistics/post";
	}
	
	@RequestMapping("/codetable")
	public String codetableView(Model model) {
		model.addAttribute("gnb", 4);
		return "admin/codetable/codetable";
	}
	
	@RequestMapping("/mypage")
	public ModelAndView mypageView(HttpSession session) {
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
		mav.setViewName("mypage/myPage");
		
		return mav;
	}
	
	@RequestMapping("/guide")
	public String guideView() {
		return "mypage/guide";
	}
	
	@RequestMapping("/reservation")
	public String reservationView() {
		return "mypage/reservation";
	}
	
	@RequestMapping("/myPost")
	public String myPostView() {
		return "mypage/myPost";
	}
	
	@RequestMapping("/board")
	public String boardView(@RequestParam("board_id")String board_id, Model model) {
		model.addAttribute("board_id", board_id);
		return "servicecenter/list";
	}
	
	@RequestMapping("/boardWrite")
	public String boardWriteView() {
		return "servicecenter/write";
	}
	
	@RequestMapping("/memModified")
	public String memModifiedView() {
		return "mypage/memModified";
	}
	
	@RequestMapping("/clipBoard")
	public String clipBoardView() {
		return "mypage/clipBoard";
	}
	
	
	@RequestMapping("/essay_view")
	public String essay_viewView() {
		return "essay/essay_view";
	}
	
	@RequestMapping("/essay_write")
	public String essay_writeView() {
		return "essay/essay_write";
	}
	
	@RequestMapping("/essay_update")
	public String essay_updateView() {
		return "essay/essay_update";
	}
	
	@RequestMapping("/mytravel_write")
	public String mytravel_writeView() {
		return "mypage/travelmanagement/mytravel_write";
	}
	
	@RequestMapping("/mytravel_write2")
	public String mytravel_write2View() {
		return "mypage/travelmanagement/mytravel_write2";
	}
	
	
	@RequestMapping("/mytravel_update")
	public String mytravel_updateView() {
		return "mypage/travelmanagement/mytravel_update";
	}
	
	@RequestMapping("/mytravel_update2")
	public String mytravel_update2View() {
		return "mypage/travelmanagement/mytravel_update2";
	}
	
	@RequestMapping("/mytravel_view")
	public String mytravel_viewView() {
		return "mypage/travelmanagement/mytravel_view";
	}
}