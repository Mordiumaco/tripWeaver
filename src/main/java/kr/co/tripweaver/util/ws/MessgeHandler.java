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
import kr.co.tripweaver.mymenu.mypage.message.service.IMessageService;

@Repository
public class MessgeHandler extends TextWebSocketHandler {
	
	@Autowired
	private IMessageDao messageDao;
	@Autowired
	private IMessageService messageService;
	private List<WebSocketSession> connectedMembers = new ArrayList<WebSocketSession>();
	private Logger logger = LoggerFactory.getLogger(MessgeHandler.class);
	private Map<String, WebSocketSession> members = new ConcurrentHashMap<String, WebSocketSession>();
	private Map<String, List<WebSocketSession>> chatroomInfoList = new ConcurrentHashMap<String, List<WebSocketSession>>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		Map<String, Object> m = session.getAttributes();
		for(String key : m.keySet()) {
			System.out.println("map KEY : " + key + " / VALUE : " + m.get(key));
		}
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
		
		MessageVO messageVO = MessageVO.convertMessage(message.getPayload());
		
		//채팅방 id
		String group_id = messageVO.getGroup_id();
		
		//입력한 메세지를 DB에 저장
		String msg_id = messageService.sendMessage(messageVO);
		messageVO.setMsg_id(msg_id);
		
		if(messageService.selectMessageByMsg_id(msg_id) != null) {
			messageVO = messageService.selectMessageByMsg_id(msg_id);			
		}
		
		logger.debug("[handleTextMessage] messageVO : {}", messageVO);
		
		//그룹id에 해당되는 멤버id를 가져오자
		List<String> mem_idList = messageDao.selectChatroomMemberList(group_id);
		
		Iterator<String> sessionIds = members.keySet().iterator();
		String sessionId = "";
		Gson gson = new Gson();
		String jsonMessage = gson.toJson(messageVO);
		while (sessionIds.hasNext()) {
			sessionId = sessionIds.next();
			members.get(sessionId).sendMessage(new TextMessage(jsonMessage));
		}
//		for(WebSocketSession socketSession : connectedMembers) {
//			Map<String, Object> map = null;
//			map = socketSession.getAttributes();
//			logger.debug("[handleTextMessage] map : {}", map);
//			
//			for(String key : map.keySet()) {
//				System.out.println("key : " + key + " / value : " + map.get(key));
//			}
//			
//			
//			MemberVO loginInfo = (MemberVO) map.get("loginInfo");
//			logger.debug("[handleTextMessage] loginInfo : {}", loginInfo);
//			
//			//받는 (그룹)사람
//			if(loginInfo.getMem_id().equals(messageVO.getMem_id())) {
//				Gson gson = new Gson();
//				String jsonMessage = gson.toJson(messageVO); 
//				socketSession.sendMessage(new TextMessage(jsonMessage));
//			}
//		}
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		logger.debug(session.getId() + " Exception : " + exception.getMessage());
	}
	
	
	
}
