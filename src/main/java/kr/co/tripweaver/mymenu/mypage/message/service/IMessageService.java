package kr.co.tripweaver.mymenu.mypage.message.service;

import java.util.List;
import java.util.Map;

import kr.co.tripweaver.member.model.MemberVO;
import kr.co.tripweaver.mymenu.mypage.message.model.MessageVO;
import kr.co.tripweaver.mymenu.mypage.message.model.ParticipantVO;

public interface IMessageService {

	/**
	* Method : messagePageView
	* 작성자 : jin
	* 변경이력 :
	* @param mem_id
	* @return
	* Method 설명 : 해당 멤버의 message.jsp 필요한 팔로잉/팔로워 정보(인원수,멤버리스트)를 반환하는 메서드
	 */
	public Map<String, Object> messagePageView(Map<String, Object> params);
	
	/**
	* Method : selectChatroom
	* 작성자 : jin
	* 변경이력 :
	* @param mem_id
	* @return
	* Method 설명 : 로그인유저의 채팅방 목록을 반환하는 메서드
	 */
	public List<MessageVO> selectChatroom(String mem_id);
	
	
	/**
	* Method : selectChatroomMemberList
	* 작성자 : jin
	* 변경이력 :
	* @param group_id
	* @return
	* Method 설명 : 그룹에 해당되는 멤버들의 id를 반환하는 메서드
	 */
	public List<String> selectChatroomMemberList(String group_id);
	
	/**
	* Method : sendMessage
	* 작성자 : jin
	* 변경이력 :
	* @param params
	* @return
	* Method 설명 : 메세지를 보내는 메서드
	 */
	public String sendMessage(MessageVO messageVO);
	
	/**
	 * Method : enterChatroom
	 * 작성자 : jin
	 * 변경이력 :
	 * @param params
	 * @return
	 * Method 설명 : (채팅방 입장)선택한 채팅방에 대한 정보를 반환하는 메서드
	 */
	public Map<String, Object> enterChatroom(Map<String, Object> params);
	
	/**
	* Method : exitChatroom
	* 작성자 : jin
	* 변경이력 :
	* @param params
	* @return
	* Method 설명 : 채팅방을 아예 퇴장하는 메서드
	 */
	public int exitChatroom(ParticipantVO participantVO);

	/**
	* Method : selectMessageByMsg_id
	* 작성자 : jin
	* 변경이력 :
	* @param msg_id
	* @return
	* Method 설명 : 메세지id로 메세지 정보를 반환하는 메서드
	 */
	public MessageVO selectMessageByMsg_id(String msg_id);
	
	/**
	* Method : insertChatroom
	* 작성자 : jin
	* 변경이력 :
	* @param params
	* @return
	* Method 설명 : 새로운 채팅방을 생성하고 해당 채팅방 멤버리스트를 반환하는 메서드
	 */
	public Map<String, Object> insertChatroom(Map<String, Object> params);
	
	/**
	* Method : messageAlram
	* 작성자 : jin
	* 변경이력 :
	* @param mem_id
	* @return
	* Method 설명 : 메인화면에서 메세지알림을 받기위한 읽지않은 메세지수 반환하는 메서드
	 */
	public int messageAlram(String mem_id);
	
	/**
	* Method : selectMessage11
	* 작성자 : jin
	* 변경이력 :
	* @return
	* Method 설명 : 반환 받은 1:1 쪽지 이벤트로 채팅방구성원이 2명인 구성원 정보 리스트 비교아여 기존채팅방 존재 확인 후 
	* 있으면 그 채팅방으로 없으면 새로운채팅방 생성하는 메서드(2개씩 세트임; 1/2, 3/4, 5/6 .....)
	 */
	public Map<String, Object> selectMessage11(String login_id, String mem_i);
	
	/**
	* Method : updateChatroomName
	* 작성자 : jin
	* 변경이력 :
	* @param participantVO
	* @return
	* Method 설명 : 채팅방 이름을 수정하는 메서드
	 */
	public int updateChatroomName(ParticipantVO participantVO);
	
	/**
	* Method : insertParticipant
	* 작성자 : jin
	* 변경이력 :
	* @param participantVO
	* @return
	* Method 설명 : 대화상대를 초대하는 메서드
	 */
	public int inviteParticipant(ParticipantVO participantVO);
}
