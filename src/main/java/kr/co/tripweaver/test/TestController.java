package kr.co.tripweaver.test;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
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
import kr.co.tripweaver.member.service.MemberService;
import kr.co.tripweaver.mymenu.mypage.tripplan.model.DailyPlanVO;
import kr.co.tripweaver.mymenu.mypage.tripplan.model.MapMarkerVO;
import kr.co.tripweaver.mymenu.mypage.tripplan.model.MypageTripPlanForListVO;
import kr.co.tripweaver.mymenu.mypage.tripplan.model.TripareaVO;
import kr.co.tripweaver.mymenu.mypage.tripplan.model.TripplanVO;
import kr.co.tripweaver.mymenu.mypage.tripplan.service.IDailyPlanService;
import kr.co.tripweaver.mymenu.mypage.tripplan.service.IMapMarkerService;
import kr.co.tripweaver.mymenu.mypage.tripplan.service.ITripAreaService;
import kr.co.tripweaver.mymenu.mypage.tripplan.service.ITripPlanService;
import kr.co.tripweaver.util.naver_login.NaverLoginService;

@RequestMapping("test")
@Controller
public class TestController {

	Logger logger = LoggerFactory.getLogger(TestController.class);
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	NaverLoginService naverLoginService;

	@Autowired
	ITripPlanService tripPlanService;
	
	@Autowired
	ITripAreaService tripAreaService;
	
	@Autowired
	IMapMarkerService mapMarkerService;
	
	@Autowired
	IDailyPlanService dailyPlanService;
	
	@RequestMapping("/login")
	public String login_View() {
		
		return "test/login";
		
	}
	
	@RequestMapping("/callback")
	public String callBack_View(HttpServletRequest request) throws UnsupportedEncodingException {
		
		String access_token = naverLoginService.NaverLoginAccessToken(request);
		
		request.getSession().setAttribute("access_token", access_token);
		
		
		//-------------------------------------------------------------------
		
		Map<String, String> userInfoMap = naverLoginService.getNaverUserInfo(access_token);
		
		//해당 유저에 대한 키 : 값 로그
		//age, profile_image, name, nickname, birthday, gender , id(고유 64bit 숫자로 이루어짐), email
		logger.debug("------------------------------");
		for(String str : userInfoMap.keySet()) {
			
			String value = userInfoMap.get(str);
			
			logger.debug("{} : {}", str, value);
		}
		logger.debug("------------------------------");
		
		//네이버회원에게 원하는 필수정보를 제대로 못받아올경우 재동의하도록 리턴시킨다 빠꾸빠꾸
		//총 8개의 정보를 못받으면 계속 재동의하도록 시키는 부분 
		//---------------------------------------------------
		if(userInfoMap.size() != 8) {
			
			String state = request.getParameter("state");
			String redirectURI = URLEncoder.encode("http://localhost:8081/test/callback", "UTF-8");
			String redirect = request.getScheme()+"s://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=hAi60RWrlDCU1L3kMH90&state="+state+"&redirect_uri="+redirectURI+"&auth_type=reprompt";
			return "redirect:"+redirect;
		}
		//---------------------------------------------------
		
		String mem_id = userInfoMap.get("id");
		//먼저 네이버 회원과 일치하는 멤버 아이디가 있는지 확인한다. 
		MemberVO naverMemberVo = memberService.selectMemberById(mem_id);
		
		//기존에 회원이 없을 경우에는 네이버 아이디에 대한 정보로 회원 DB 정보가 만들어 진다. 
		if(naverMemberVo == null) {
			
			mem_id = userInfoMap.get("id");
			String mem_gender = userInfoMap.get("gender");
			String mem_name =  userInfoMap.get("name");
			String mem_nick = userInfoMap.get("nickname");
			//String mem_profile =  userInfoMap.get("profile");
			String mem_age = userInfoMap.get("age");
			String mem_email = userInfoMap.get("email");
			String mem_profile = userInfoMap.get("profile_image");
			
			//네이버에 대한 정보를 객체에 담아준다. 
			naverMemberVo = new MemberVO(mem_id,mem_email ,mem_name,mem_nick,mem_age,mem_gender,mem_profile);
			
			//회원 DB 주입이 정상적으로 이루어지면 1을 반환 아니면 0
			int insertResult = memberService.insertNaverMember(naverMemberVo);
			
			if(insertResult == 1) {
				
				naverMemberVo = memberService.selectMemberById(mem_id);
				request.getSession().setAttribute("loginInfo", naverMemberVo);
				
			}else {
				
				//정상적으로 회원DB가 안이루어졌다면 login 단으로 돌아간다. 
				return "test/login";
			}
			
			
		//기존에 네이버 회원과 아이디 정보 일치하는 회원이 있을 경우, 해당 정보를 받아와 session에 Member 객체를 넣어준다. 
		}else {
			
			request.getSession().setAttribute("loginInfo", naverMemberVo);
		}
		
		return "test/index";
	}
	
	@RequestMapping("/test")
	public String test_View(HttpServletRequest request) {
		
        
   /*   
    	JsonParser parser = new JsonParser();
        JsonElement element = parser.parse(response.toString());
        
        element = element.getAsJsonObject().get("response");*/
        	
        /* 네이버가 주는 값 하나씩 받기  */
        //String name = element.getAsJsonObject().get("response").getAsJsonObject().get("name").getAsString();
        //System.out.println(name);
        
        
		return "test/test";
	}
	
	/*외부 URL 받는 방법
	 * 
	 * @RequestMapping("/reVaildTest")
	public RedirectView reVaildTestView(HttpServletRequest request) throws UnsupportedEncodingException {
	    RedirectView redirectView = new RedirectView();
	    String code = request.getParameter("code");
		String state = request.getParameter("state");
		String redirectURI = URLEncoder.encode("localhost:8081/test/callback", "UTF-8");
		redirectView.setUrl("https://nid.naver.com/oauth2.0/authorize?response_type="+code+"&client_id=hAi60RWrlDCU1L3kMH90&state="+state+"&redirect_uri="+redirectURI+"&auth_type=reprompt");
	    return redirectView;
	}
	
	*/
	@RequestMapping("mytravel_write")
	public String mytravel_writeView1() {
		return "test/map/mytravel_write";
	}
	
	
	@RequestMapping("mytravel_write2")
	public ModelAndView mytravel_writeView2(@RequestParam("departDate") String departDate, 
			String[] days, String positionInfo 
			) {
		
		logger.debug("departDate : {}", departDate);
		logger.debug("days : {}", days[0]);
		logger.debug("positionInfo : {}", positionInfo);
		
		ModelAndView mav = new ModelAndView("test/map/mytravel_write2");
		mav.addObject("departDate", departDate);
		mav.addObject("days", days);
		mav.addObject("positionInfo", positionInfo);
		return mav;
	}
	
	@RequestMapping("mytravelForm")
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
		ModelAndView mav = new ModelAndView("test/map/myPage");
		mypageView(session);
		return mav;
	}
	
	/**
	* Method : mypageView
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 13.
	* 변경이력 :
	* @param session
	* @return
	* Method 설명 : 마이 페이지에 뿌려줄 나의 여행일정 리스트 정보를 담고 마이페이지 뷰로 가는 메서드
	*/
	@RequestMapping("mypage")
	public ModelAndView mypageView(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		
		MemberVO memberVo = (MemberVO)session.getAttribute("loginInfo");
		
		if(memberVo == null) {
			mav.setViewName("LoginCheckError");
			return mav;
		}
		
		String mem_id = memberVo.getMem_id();
		
		List<MypageTripPlanForListVO> mypageTripPlanForListVoList = tripPlanService.tripplanListForMypageByMemberId(mem_id);
		
		mav.addObject("mypageTripPlanForListVoList", mypageTripPlanForListVoList);
		mav.setViewName("test/map/myPage");
		
		return mav;
	}
}


