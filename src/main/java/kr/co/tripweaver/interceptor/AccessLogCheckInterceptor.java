package kr.co.tripweaver.interceptor;

import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.tripweaver.manager.conn_stat.model.ConnStatVO;
import kr.co.tripweaver.manager.conn_stat.service.IConnStatService;
import kr.co.tripweaver.member.model.MemberVO;

public class AccessLogCheckInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	private IConnStatService connService;

	Logger logger = LoggerFactory.getLogger(AccessLogCheckInterceptor.class);
	
	// 전처리(사전처리)
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//다음인터셉터로 연결
		return true;
	}

	// 후처리
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		HttpSession session = request.getSession();
		// 세션에서 맵 추출
		ConnStatVO connInfo = (ConnStatVO) session.getAttribute("connInfo");

		connInfo = new ConnStatVO();
		// 로그인 멤버 추출
		MemberVO memberVO = (MemberVO) session.getAttribute("loginInfo");
		
		//로그인 실패시 인터셉터 넘기기, 로그인성공시만 로그저장
		if(memberVO != null) {
			// 접속자 정보 추출
			String agent = request.getHeader("User-Agent") == null ? "" : request.getHeader("User-Agent");
			String browser = "";
			String os = "";
			String divice = "";
	
			logger.debug("접속자 agnet : {}", agent);
	
			if (agent != null) {
				// divice
				if (agent.indexOf("Mobile") > -1) {
					divice = "Mobile";
				} else if (agent.indexOf("Tablet") > -1) {
					divice = "Tablet";
				} else if (agent.indexOf("Win16") > -1 || agent.indexOf("Win32") > -1 || agent.indexOf("Win64") > -1 || agent.indexOf("WOW64") > -1 || agent.indexOf("MAC") > -1) {
					divice = "PC";
				} else {
					divice = "Other";
				}
				// os
				if (agent.indexOf("Android") > -1) {
					os = "Android";
				} else if (agent.indexOf("iPhone") > -1) {
					os = "iOS";
				} else if (agent.indexOf("NT 10.0") != -1) {
					os = "Windows 10";
				} else if (agent.indexOf("NT 5.1") != -1) {
					os = "Windows XP";
				} else if (agent.indexOf("Windows") != -1) {
					os = "Windows";
				} else if (agent.indexOf("Linux") != -1) {
					os = "Linux";
				} else if (agent.indexOf("Macintosh") != -1) {
					os = "Macintosh";
				} else {
					os = "Other";
				}
				// browser
				if (agent.indexOf("Trident") > -1) {
					browser = "MSIE";
				} else if (agent.indexOf("Chrome") > -1) {
					browser = "Chrome";
				} else if (agent.indexOf("Opera") > -1) {
					browser = "Opera";
				} else if (agent.indexOf("Firefox") > -1) {
					browser = "FireFox";
				} else {
					browser = "Other";
				}
			}
	//		String mem_id = memberVO.getMem_id() == null ? "" : memberVO.getMem_id();
	//		logger.debug("멤버아이디 : {}", mem_id);
	
			// 속성저장
			connInfo.setMem_id(memberVO.getMem_id());
			connInfo.setConn_browser(browser);
			connInfo.setConn_divice(divice);
			connInfo.setConn_ip(request.getRemoteAddr());
			connInfo.setConn_os(os);
			connInfo.setConn_ref(request.getHeader("referer") == null ? "" : request.getHeader("referer"));
			connInfo.setConn_time(new Date());
	
			logger.debug("로그인 로그 기록 : {}", connInfo);
	
			// 접속자정보 데이터베이스에 저장
			int intCnt = connService.insertConnInfo(connInfo);
		}
	}

	
}
