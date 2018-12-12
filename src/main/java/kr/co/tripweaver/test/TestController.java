package kr.co.tripweaver.test;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.tripweaver.member.model.MemberVO;
import kr.co.tripweaver.member.service.MemberService;
import kr.co.tripweaver.util.naver_login.NaverLoginService;

@RequestMapping("test")
@Controller
public class TestController {

	Logger logger = LoggerFactory.getLogger(TestController.class);
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	NaverLoginService naverLoginService;

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
	
}


