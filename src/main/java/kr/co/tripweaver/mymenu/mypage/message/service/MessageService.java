package kr.co.tripweaver.mymenu.mypage.message.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tripweaver.member.model.MemberVO;
import kr.co.tripweaver.member.service.IMemberService;
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
	
	private Logger logger = LoggerFactory.getLogger(MessageService.class);
	
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
		
		//관리자 알림메세지가 아니면
		if(!(messageVO.getMem_id()).equals("admin")) {
			mem_idList.remove(messageVO.getMem_id());
			//메세지수신여부 생성
			for(String mem_id : mem_idList) {
				if(!mem_id.equals(messageVO.getMem_id())) {
					params.put("mem_id", mem_id);
					messageDao.insertMsgReciver(params);
				}
			}
		}
		
		return msg_id;
	}

	@Override
	public Map<String, Object> enterChatroom(Map<String, Object> params) {
		ParticipantVO participantVO = (ParticipantVO) params.get("participantVO");
		String group_id = (String) params.get("group_id");
		
		String chatrrom_name = messageDao.selectChatroomName(participantVO);
		List<MemberVO> memList = messageDao.selectParticipantList(group_id);
		List<MessageVO> messageVOs = messageDao.selectMessageList(group_id);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("chatrrom_name", chatrrom_name);
		resultMap.put("memList", memList);
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
		Map<String, Object> resultMap = new HashMap<String, Object>(); //리턴 채팅방아이디를 받아오기위한용일뿐
		String group_id = messageDao.insertChatroom(resultMap);
		String chatroom_name = (String) params.get("chatroom_name");
		
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
		
		List<MemberVO> memNickList = messageDao.selectParticipantList(group_id);
		resultMap.put("memNickList", memNickList);
		List<MemberVO> memList = messageDao.selectParticipantList(group_id); 
		resultMap.put("memList", memList);
		return resultMap;
	}

	@Override
	public int messageAlram(String mem_id) {
		int cnt = messageDao.messageAlram(mem_id);
		return cnt;
	}

	@Override
	public Map<String, Object> selectMessage11(String login_id, String mem_id) {
		//구성원이 2명인 채팅방 구성원리스트
		List<ParticipantVO> participantVOs = messageDao.selectMessage11();
		
		boolean[] result = new boolean[4];
		//구성원 비교 2개
		for(int i = 0; i < participantVOs.size(); i++) {
			if((i + 1) % 2 == 1) {
				result[0] = participantVOs.get(i).getMem_id().equals(login_id);
				result[2] = participantVOs.get(i).getMem_id().equals(mem_id);
			} else { 
				result[1] = participantVOs.get(i).getMem_id().equals(login_id);
				result[3] = participantVOs.get(i).getMem_id().equals(mem_id);
				
				logger.debug("결과 {}",(result[0] || result[1]) && (result[2] || result[3]));
				if((result[0] || result[1]) && (result[2] || result[3])) {
					//여기 들어온다면 기존 1:1 채팅방이 존재한다는 것
					//이미 존재하는 그 채팅방 입장
					String group_id = participantVOs.get(i).getGroup_id();
					ParticipantVO participantVO = new ParticipantVO();
					participantVO.setGroup_id(group_id);
					participantVO.setMem_id(login_id);
					
					Map<String, Object> params = new HashMap<String, Object>();
					params.put("group_id", group_id);
					params.put("participantVO", participantVO);
					
					return enterChatroom(params);
				} 
			}
		}
		//새로운 1:1채팅방 생성 후 그 채팅방 입장
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("inviteList", new String[] {mem_id});
		params.put("loginInfo", login_id);
		params.put("chatroom_name", "[1:1]" + login_id + "," + mem_id);
		return insertChatroom(params);
	}

	@Override
	public int updateChatroomName(ParticipantVO participantVO) {
		int updCnt = messageDao.updateChatroomName(participantVO);
		return updCnt;
	}

	@Override
	public int inviteParticipant(ParticipantVO participantVO) {
		
		//존재하는지 확인
		int cnt = messageDao.selectParticipantById(participantVO);
		participantVO.setChatroom_name(participantVO.getChatroom_name() == null || participantVO.getChatroom_name().equals("") ? "이름을 설정해주세요" : participantVO.getChatroom_name());
		if(cnt < 1) {
			//없으면 생성 
			cnt = messageDao.insertParticipant(participantVO);
		} else {
			cnt = 2;
		}
		//cnt 1 : 초대성공, 2 : 이미 초대된 멤버
		return cnt;
	}
}






















