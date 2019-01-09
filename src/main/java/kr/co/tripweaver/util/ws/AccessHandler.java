package kr.co.tripweaver.util.ws;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;

import kr.co.tripweaver.member.model.MemberVO;
import kr.co.tripweaver.member.service.IMemberService;
import kr.co.tripweaver.mymenu.mypage.message.dao.IMessageDao;
import kr.co.tripweaver.mymenu.mypage.message.model.MessageVO;
import kr.co.tripweaver.mymenu.mypage.message.model.ParticipantVO;
import kr.co.tripweaver.mymenu.mypage.message.service.IMessageService;

@Repository
public class AccessHandler extends TextWebSocketHandler {
	
	@Autowired
	private IMemberService memberService;
	@Autowired
	private IMessageDao messageDao;
	@Autowired
	private IMessageService messageService;
	private List<WebSocketSession> connectedMembers = new ArrayList<WebSocketSession>();
	private Logger logger = LoggerFactory.getLogger(AccessHandler.class);
	private Map<String, WebSocketSession> members = new ConcurrentHashMap<String, WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
//		ServletRequestAttributes sra = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
//		HttpServletRequest request = sra.getRequest();
//		MemberVO memberVO = (MemberVO) request.getSession().getAttribute("loginInfo");
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
		System.out.println("[AccessHandler] 퇴장시 : " + participantVO);
		
		//채팅방 id
		String group_id = participantVO.getGroup_id();
		int cnt = 0;
		String invited_nick = "";
		if(participantVO.getAccess().equals("exit")) { //퇴장시
			//채팅방 구성원에서 삭제
			cnt = messageService.exitChatroom(participantVO);
			cnt = 0;
		} else { // 초대시
			//초대된 멤버 닉네임 구하기
			invited_nick = (memberService.selectMemberById(participantVO.getInvited_nick())).getMem_nick();
			//1이면 초대 성공, 2이면 이미 초대된 멤버
			cnt = messageService.inviteParticipant(participantVO);
		}
		
//		List<String> memList = messageService.selectChatroomMemberList(group_id);
		
		//채팅방 인원리스트
		List<MemberVO> memberVOs = messageDao.selectParticipantList(group_id);
		memberVOs.get(0).setMem_qrcode(Integer.toString(cnt));
		memberVOs.get(0).setInvited_nick(invited_nick);
		memberVOs.get(0).setInvite_nick(participantVO.getInvite_nick());
		memberVOs.get(0).setGroup_id(group_id);
		
		Iterator<String> sessionIds = members.keySet().iterator();
		System.out.println("members.size() : " + members.size());
		String sessionId = "";
		Gson gson = new Gson();
		String jsonMessage = gson.toJson(memberVOs);
		System.out.println("[AccessHandler] : " + jsonMessage);
		while (sessionIds.hasNext()) {
			sessionId = sessionIds.next();
//			for(String mem_id : memList) {
//				if(sessionId.equals(mem_id)) {
					members.get(sessionId).sendMessage(new TextMessage(jsonMessage));
//				}
//			}
		}
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		logger.debug(session.getId() + " Exception : " + exception.getMessage());
	}
	
}
