package kr.co.tripweaver.mymenu.mypage.message.service;

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
		
		//본인 정보도 필요(로그인 구현하면 세션에 다 넣어서 필요없나?)
		
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
		int delCnt = messageDao.deleteChatroom(group_id);
		
		//해당 채팅방 participant 남아있는지 체크
		int patCnt = messageDao.selectParticipantCount(group_id);
		if(patCnt < 1) {
			//없다면 채팅방 삭제
			delCnt = messageDao.updateChatroomDel(group_id);
		}
		//남아있다면  패스
		return delCnt;
	}
}






















