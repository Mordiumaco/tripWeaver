package kr.co.tripweaver.util.ws;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;

import kr.co.tripweaver.mymenu.mypage.message.dao.IMessageDao;
import kr.co.tripweaver.mymenu.mypage.message.model.MessageVO;
import kr.co.tripweaver.mymenu.mypage.message.model.ParticipantVO;
import kr.co.tripweaver.mymenu.mypage.message.service.IMessageService;

@Repository
public class AlramHandler extends TextWebSocketHandler {
	
	@Autowired
	private IMessageDao messageDao;
	private List<WebSocketSession> connectedMembers = new ArrayList<WebSocketSession>();
	private Logger logger = LoggerFactory.getLogger(AlramHandler.class);
	private Map<String, WebSocketSession> members = new ConcurrentHashMap<String, WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		logger.debug("{} 연결됨", session.getId());
		connectedMembers.add(session);
		members.put(session.getId(), session);
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		logger.debug("{} 연결 끊김", session.getId());
		connectedMembers.remove(session);
		members.remove(session.getId());
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		ParticipantVO participantVO = ParticipantVO.convertMessage(message.getPayload());
		
		//채팅방 id
		String group_id = participantVO.getGroup_id();
		
		//해당 채팅방에 해당 아이디 메세지수신여부 삭제하고 
		//해당 메세지 수신숫자조회 
		int delCnt = messageDao.deleteMsgReciver(participantVO);
		System.out.println("[handleTextMessage] delCnt : " + delCnt);
		List<MessageVO> messageVOs = messageDao.selectGroupMsgCount(group_id); //메세지아이디, unread 담겨있음
		
		Iterator<String> sessionIds = members.keySet().iterator();
		String sessionId = "";
		Gson gson = new Gson();
		String jsonMessage = gson.toJson(messageVOs);
		System.out.println("[AlramHandler] : " + jsonMessage);
		while (sessionIds.hasNext()) {
			sessionId = sessionIds.next();
			members.get(sessionId).sendMessage(new TextMessage(jsonMessage));
		}
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		logger.debug(session.getId() + " Exception : " + exception.getMessage());
	}
	
}
