package kr.co.tripweaver.listener;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.tripweaver.manager.conn_stat.model.ConnStatVO;

public class AccessLogListener implements HttpSessionListener {

	private Logger logger = LoggerFactory.getLogger(AccessLogListener.class);
	static int count = 0;
	
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		HttpSession session = se.getSession();
		count++;
		logger.debug("sessionCreated : {}", session.getId());
		
		//접속자VO에 속성들 저장
		ConnStatVO connInfo = new ConnStatVO();
		connInfo.setSession_id(session.getId());
		
		//세션에 접속자VO 속성저장
		session.setAttribute("connInfo", connInfo);
		session.setAttribute("count", count);
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		logger.debug("sessionDestroyed : {}", se.getSession().getId());

		
		
	}

}
