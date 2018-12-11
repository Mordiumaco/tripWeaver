package kr.co.tripweaver.mymenu.mypage.message.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
		
		return resultMap;
	}
}
