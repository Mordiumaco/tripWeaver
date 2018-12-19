package kr.co.tripweaver.mymenu.mypage.message.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tripweaver.member.model.MemberVO;
import kr.co.tripweaver.mymenu.mypage.follow_following.service.IFollowService;
import kr.co.tripweaver.mymenu.mypage.message.dao.IMessageDao;
import kr.co.tripweaver.mymenu.mypage.message.model.MessageVO;
import kr.co.tripweaver.mymenu.mypage.message.model.ParticipantVO;

@Service
public class MessageService implements IMessageService {

	@Autowired
	private IMessageDao messageDao;

	@Autowired
	private IFollowService followService;
	
	@Override
	public Map<String, Object> messagePageView(Map<String, Object> params) {
		
		Map<String, Object> resultMap = followService.messagePageView(params);
		
		return resultMap;
	}

	@Override
	public List<MessageVO> selectChatroom(String mem_id) {
		List<MessageVO> messageVOs = messageDao.selectChatroom(mem_id);
		return messageVOs;
	}


	@Override
	public List<String> selectChatroomMemberList(String group_id) {
		List<String> mem_idList = messageDao.selectChatroomMemberList(group_id);
		return mem_idList;
	}
	
	@Override
	public String sendMessage(MessageVO messageVO) {
		Map<String, Object> params = new HashMap<String, Object>();
		//메세지 저장
		String msg_id = messageDao.insertMessage(messageVO);
		params.put("msg_id", msg_id);
		//채팅방멤버아이디 모두 조회
		List<String> mem_idList = messageDao.selectChatroomMemberList(messageVO.getGroup_id());
		
		mem_idList.remove(messageVO.getMem_id());
		
		//메세지수신여부 생성
		for(String mem_id : mem_idList) {
			if(!mem_id.equals(messageVO.getMem_id())) {
				params.put("mem_id", mem_id);
				messageDao.insertMsgReciver(params);
			}
		}
		return msg_id;
	}

	@Override
	public Map<String, Object> enterChatroom(Map<String, Object> params) {
		ParticipantVO participantVO = (ParticipantVO) params.get("participantVO");
		String group_id = (String) params.get("group_id");
		
		String chatrrom_name = messageDao.selectChatroomName(participantVO);
		List<String> memNickList = messageDao.selectParticipantNickList(group_id);
		List<MessageVO> messageVOs = messageDao.selectMessageList(group_id);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("chatrrom_name", chatrrom_name);
		resultMap.put("memNickList", memNickList);
		resultMap.put("messageVOs", messageVOs);
		resultMap.put("group_id", group_id);
		
		return resultMap;
	}

	@Override
	public int exitChatroom(ParticipantVO participantVO) {
		//participant 삭제
		String group_id = participantVO.getGroup_id();
		int delCnt = messageDao.deleteParticipant(participantVO); //구성원 삭제
		
		//해당 채팅방 participant 남아있는지 체크
		int patCnt = messageDao.selectParticipantCount(group_id);
		if(patCnt < 1) {
			//없다면 채팅방 삭제
			delCnt = messageDao.updateChatroomDel(group_id);
		}
		//남아있다면  패스
		return delCnt;
	}

	@Override
	public MessageVO selectMessageByMsg_id(String msg_id) {
		MessageVO messageVO = messageDao.selectMessageByMsg_id(msg_id);		
		return messageVO;
	}

	@Override
	public Map<String, Object> insertChatroom(Map<String, Object> params) {
		//채팅방 생성, 채팅방 아이디 조회
		Map<String, Object> resultMap = new HashMap<String, Object>();
		String group_id = messageDao.insertChatroom(resultMap);
		String chatroom_name = "New Chatroom";
		
		//채팅구성원 생성
		String[] inviteList = (String[]) params.get("inviteList");
		List<ParticipantVO> participantVOs = new ArrayList<ParticipantVO>();
		
		ParticipantVO participantVOLogin = new ParticipantVO();
		participantVOLogin.setGroup_id(group_id);
		participantVOLogin.setMem_id((String) params.get("loginInfo"));
		participantVOLogin.setChatroom_name(chatroom_name);
		participantVOs.add(participantVOLogin);
		
		for(String mem_id : inviteList) {
			System.out.println("insertChatroom : " + mem_id);
			ParticipantVO participantVO = new ParticipantVO();
			participantVO.setGroup_id(group_id);
			participantVO.setMem_id(mem_id);
			participantVO.setChatroom_name(chatroom_name);
			participantVOs.add(participantVO);
		}
		int intCnt = 0;
		for(ParticipantVO participantVO : participantVOs) {
			intCnt += messageDao.insertParticipant(participantVO);
		}
				
		//채팅 구성원 조회, 조회할 필요없음 위에 있음
		//결과 resultMap
		resultMap.put("chatrrom_name", chatroom_name);
		resultMap.put("participantVOs", participantVOs);
		
		List<String> memNickList = messageDao.selectParticipantNickList(group_id);
		resultMap.put("memNickList", memNickList);
		return resultMap;
	}
}






















