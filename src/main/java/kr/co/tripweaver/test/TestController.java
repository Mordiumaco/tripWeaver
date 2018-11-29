package kr.co.tripweaver.test;

import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
		//age, profile, name, nickname, birthday, gender , id(고유 64bit 숫자로 이루어짐), email
		logger.debug("------------------------------");
		for(String str : userInfoMap.keySet()) {
			
			String value = userInfoMap.get(str);
			
			logger.debug("{} : {}", str, value);
		}
		logger.debug("------------------------------");
		
		String mem_email = userInfoMap.get("email");
		
		//먼저 네이버 회원과 일치하는 멤버 email이 있는지 확인한다. 
		MemberVO naverMemberVo = memberService.selectMemberByEmail(mem_email);
		
		//기존에 회원이 없을 경우에는 네이버 아이디에 대한 정보로 회원 DB 정보가 만들어 진다. 
		if(naverMemberVo == null) {
			
			String mem_gender = userInfoMap.get("gender");
			String mem_name =  userInfoMap.get("name");
			String mem_nick = userInfoMap.get("nickname");
			//String mem_profile =  userInfoMap.get("profile");
			String mem_age = userInfoMap.get("age");
			
			//네이버에 대한 정보를 객체에 담아준다. 
			naverMemberVo = new MemberVO(mem_email,mem_name,mem_nick,mem_age,mem_gender);
			
			//회원 DB 주입이 정상적으로 이루어지면 1을 반환 아니면 0
			int insertResult = memberService.insertNaverMember(naverMemberVo);
			
			if(insertResult == 1) {
				
				naverMemberVo = memberService.selectMemberByEmail(mem_email);
				request.getSession().setAttribute("loginInfo", naverMemberVo);
				
			}else {
				
				//정상적으로 회원DB가 안이루어졌다면 login 단으로 돌아간다. 
				return "test/login";
			}
			
			
		//기존에 네이버 회원과 아이디 정보가 일치할 경우 해당 정보를 받아와 session에 Member 객체를 넣어준다. 
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
}
