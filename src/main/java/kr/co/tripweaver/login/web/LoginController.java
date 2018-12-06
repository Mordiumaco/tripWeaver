package kr.co.tripweaver.login.web;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.sun.tracing.dtrace.NameAttributes;

import kr.co.tripweaver.login.service.ILoginService;
import kr.co.tripweaver.member.model.MemberVO;
import kr.co.tripweaver.member.service.MemberService;
import kr.co.tripweaver.util.naver_login.NaverLoginService;

/**
* LoginController.java
*
* @author Jae Hyeon Choi
* @version 1.0
* @since 2018. 12. 5.
* @see
* 
* << 클래스 생성 목적 >>
* 
* 로그인 기능 관련 컨트롤러
*
* << 개정이력(Modification Information) >>
*
* 수정자 수정내용
* ------ ------------------------
* Jae Hyeon Choi 최초 생성
*
* 
*/
@RequestMapping("login")
@Controller
public class LoginController {
	
	Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	ILoginService loginService;
	

	/**
	* Method : memberLoginCheckView
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 5.
	* 변경이력 :
	* @param request
	* @param memberVo
	* @return
	* Method 설명 : 해당 회원의 로그인 여부를 체크해주는 컨트롤 뷰 
	*/
	@RequestMapping(value="memberLoginCheck" , method= RequestMethod.POST)
	public String memberLoginCheckView(HttpServletRequest request, MemberVO memberVo, HttpServletResponse response) {
		
		logger.debug("해당 회원의 정보 memberVo : {}", memberVo);
		
		
		//--------------------------쿠키 관련 로직 --------------------------------
		String remember = request.getParameter("remember");
		//remember-me 파라미터 받아서 sysout으로 출력
		logger.debug("remember value : {}", remember);
		//remember == null: 아이디 기억 사용 안함
		//
		if(remember == null){
			Cookie[] cookies = request.getCookies();
			
			for(Cookie cookie : cookies){
				//cookie 이름이 remember, userId 일경우 maxage 
				//-1로 설정하여 쿠키를 유효하지 않도록 설정한다. 
				//System.out.println(cookie.getName());
				if(cookie.getName().equals("mem_id")||cookie.getName().equals("remember")){
					cookie.setMaxAge(-1);
					response.addCookie(cookie);
				}
			}
			
		//remember != null 아이디 기억 사용
		}else{
			//response 객체에 쿠키를 저장
			Cookie cookie = new Cookie("remember", "Y");
			Cookie memIdCookie = new Cookie("mem_id", memberVo.getMem_id());
			
			//쿠키의 유지시간을 정해준다. setMaxAge(초); 
			cookie.setMaxAge(60*60*24*30);
			cookie.setPath("/");
			memIdCookie.setMaxAge(60*60*24*30);
			memIdCookie.setPath("/");
			response.addCookie(cookie);
			response.addCookie(memIdCookie);
		}
		
		//----------------------------------------------------------------- 쿠키 관련 로직 끝
		
		//해당 회원이 존재할경우 MemberVO 객체를 받아오고 아니면 Null이 뜬다. 
		MemberVO existedMember = loginService.selectMemberByIdAndPass(memberVo);
		
		//해당 아이디와 비밀번호가 일치하지 않거나 없을경우
		if(existedMember == null) {
			
			//다시 로그인 하도록 로그인 페이지 뷰로 리턴
			return "/login/login";
			
		//해당 아이디와 비밀번호가 일치하는 경우 
		}else {
			
			//로그인 세션에 해당 멤버 정보를 넣어준다.
			request.getSession().setAttribute("loginInfo", existedMember);
			
			//로그인 정보를 세션에 넣어줬으니 메인으로 이동시킨다. 
			return "index";
		}
		
	}
	
	/**
	* Method : callBack_View
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 6.
	* 변경이력 :
	* @param request
	* @return
	* @throws UnsupportedEncodingException
	* Method 설명 : 네이버에 대한 콜백이 이루어지는 부분
	*/
	@RequestMapping("/callback")
	public String callBack_View(HttpServletRequest request) throws UnsupportedEncodingException {
		
		String access_token = loginService.naverLoginAccessToken(request);
		
		request.getSession().setAttribute("access_token", access_token);
		
		
		//-------------------------------------------------------------------
		
		Map<String, String> userInfoMap = loginService.getNaverUserInfo(access_token);
		
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
			String redirectURI = URLEncoder.encode("http://localhost:8081/login/callback", "UTF-8");
			String redirect = request.getScheme()+"s://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=hAi60RWrlDCU1L3kMH90&state="+state+"&redirect_uri="+redirectURI+"&auth_type=reprompt";
			return "redirect:"+redirect;
		}
		//---------------------------------------------------
		
		String mem_id = userInfoMap.get("id");
		
		//먼저 네이버 회원과 일치하는 멤버 아이디가 있는지 확인한다. 
		MemberVO naverMemberVo = loginService.selectMemberById(mem_id);
		
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
			int insertResult = loginService.insertNaverMember(naverMemberVo);
			
			if(insertResult == 1) {
				
				naverMemberVo = loginService.selectMemberById(mem_id);
				request.getSession().setAttribute("loginInfo", naverMemberVo);
				
			}else {
				
				//정상적으로 회원DB가 안이루어졌다면 login 단으로 돌아간다. 
				return "login/login";
			}
			
			
		//기존에 네이버 회원과 아이디 정보 일치하는 회원이 있을 경우, 해당 정보를 받아와 session에 Member 객체를 넣어준다. 
		}else {
			
			request.getSession().setAttribute("loginInfo", naverMemberVo);
		}
		
		return "login/callback";
	}
	
	/**
	* Method : logOutCheck
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 6.
	* 변경이력 :
	* @param session
	* @param access_token
	* @return
	* @throws UnsupportedEncodingException
	* Method 설명 : 로그아웃 관련 컨트롤러
	*/
	@RequestMapping("logout")
	public String logOutCheck(HttpSession session) throws UnsupportedEncodingException {
		
		String access_token = (String)session.getAttribute("access_token");
		
		logger.debug("로그아웃 access_token : {}", access_token);
		
		//세션 정리
		session.invalidate();

		//해당 유저가 네이버 유저 로그인일때 엑세스 토큰을 세션에서 가지고 있는데 
		//이를 이용해서 엑세스 토큰이 없을경우에는 네이버 유저가 아니므로 해당 네이버 로그아웃 로직을 실행하지 않는다.
		if(access_token != null) {
			loginService.naverUserLogOut(access_token);
		}
		
		return "index";
	}
}
