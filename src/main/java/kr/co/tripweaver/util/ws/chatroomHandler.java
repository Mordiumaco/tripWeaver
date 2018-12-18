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
public class chatroomHandler extends TextWebSocketHandler {
	
	@Autowired
	private IMessageService messageService;
	private List<WebSocketSession> connectedMembers = new ArrayList<WebSocketSession>();
	private Logger logger = LoggerFactory.getLogger(chatroomHandler.class);
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
		logger.debug(message.getPayload());
		List<MessageVO> messageVOs = messageService.selectChatroom(message.getPayload());
//		session.sendMessage(new TextMessage(messageVOs)); 
		//현재 수신자에게 몇개의 메세지가 와있는지 디비에서 검색함.
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		logger.debug(session.getId() + " Exception : " + exception.getMessage());
	}
	
}
