package kr.co.tripweaver.mymenu.mypage.message.dao;

import java.util.List;
import java.util.Map;

import kr.co.tripweaver.member.model.MemberVO;
import kr.co.tripweaver.mymenu.mypage.message.model.MessageVO;
import kr.co.tripweaver.mymenu.mypage.message.model.ParticipantVO;

public interface IMessageDao {

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
	* Method : selectChatroomName
	* 작성자 : jin
	* 변경이력 :
	* @param participantVO
	* @return
	* Method 설명 : 로그인멤버의 해당 채팅방이름을 반환하는 메서드
	 */
	public String selectChatroomName(ParticipantVO participantVO);

	/**
	* Method : selectParticipantNickList
	* 작성자 : jin
	* 변경이력 :
	* @param group_id
	* @return
	* Method 설명 : 해당 채팅방 구성원닉네임을 반환하는 메서드
	 */
	public List<MemberVO> selectParticipantList(String group_id);
	
	/**
	* Method : selectMessageList
	* 작성자 : jin
	* 변경이력 :
	* @param group_id
	* @return
	* Method 설명 : 해당 채팅방의 메세지리스트를 반환하는 메서드
	 */
	public List<MessageVO> selectMessageList(String group_id);
	
	/**
	* Method : selectChatroomMemberList
	* 작성자 : jin
	* 변경이력 :
	* @param group_id
	* @return
	* Method 설명 : 그룹에 해당되는 멤버들의 id를 반환하는 메서드
	 */
	public List<String> selectChatroomMemberList(String group_id);
	/////////////////////////////////////////////////////////////
	/**
	* Method : insertChatroom
	* 작성자 : jin
	* 변경이력 :
	* @return
	* Method 설명 : 채팅방을 생성하고 채팅방id를 반환해주는 메서드
	 */
	public String insertChatroom(Map<String, Object> resultMap);
	
	/**
	* Method : deleteChatroom
	* 작성자 : jin
	* 변경이력 :
	* @param group_id
	* @return
	* Method 설명 : 멤버들이 모두 퇴장한 채팅방을 삭제하는 메서드
	 */
	public int deleteChatroom(String group_id);
	
	/**
	* Method : insertMessage
	* 작성자 : jin
	* 변경이력 :
	* @param messageVO
	* @return
	* Method 설명 : 메세지를 저장하고 저장된 메세지id를 반환하는 메서드
	 */
	public String insertMessage(MessageVO messageVO);
	
	/**
	* Method : exitChatroom
	* 작성자 : jin
	* 변경이력 :
	* @param participantVO
	* @return
	* Method 설명 : 채팅방을 퇴장할때 해당 정보를 지우는 메서드
	 */
	public int deleteParticipant(ParticipantVO participantVO);
	
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
	* Method : selectParticipantCount
	* 작성자 : jin
	* 변경이력 :
	* @param group_id
	* @return
	* Method 설명 : 채팅방 인원수를 조회하는 메서드
	 */
	public int selectParticipantCount(String group_id);
	
	/**
	* Method : updateChatroomDel
	* 작성자 : jin
	* 변경이력 :
	* @param group_id
	* @return
	* Method 설명 : 채팅방의 삭제여부를 삭제로 수정하는 메서드
	 */
	public int updateChatroomDel(String group_id);
	
	/**
	* Method : insertMsgReciver
	* 작성자 : jin
	* 변경이력 :
	* @param params
	* @return
	* Method 설명 : 메세지 수신확인용 수신자정보를 저장하는 메서드
	 */
	public int insertMsgReciver(Map<String, Object> params);
	
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
	* Method : insertParticipant
	* 작성자 : jin
	* 변경이력 :
	* @param participantVO
	* @return
	* Method 설명 : 새로운 채팅방을 만들때 채팅구성원을 생성해주는 메서드
	 */
	public int insertParticipant(ParticipantVO participantVO);
	
	/**
	* Method : selectGroupMsgCount
	* 작성자 : jin
	* 변경이력 :
	* @param group_id
	* @return
	* Method 설명 : 해당 채팅방의 메세지들의 현재 unread수를 반환하는 메서드
	 */
	public List<MessageVO> selectGroupMsgCount(String group_id);
	
	/**
	* Method : deleteMsgReciver
	* 작성자 : jin
	* 변경이력 :
	* @param participantVO
	* @return
	* Method 설명 : 채팅방 입장시 메세지 수신여부 삭제하는 메서드
	 */
	public int deleteMsgReciver(ParticipantVO participantVO);
	
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
	* Method 설명 : 1:1 쪽지 이벤트로 채팅방구성원이 2명인 구성원 정보 리스트를 반환하는 메서드(2개씩 세트임; 1/2, 3/4, 5/6 .....)
	 */
	public List<ParticipantVO> selectMessage11();
	
	/**
	* Method : selectParticipantById
	* 작성자 : jin
	* 변경이력 :
	* @param participantVO
	* @return
	* Method 설명 : 대화상대 초대전 이미 초대된 멤버인지 확인하는 메서드
	 */
	public int selectParticipantById(ParticipantVO participantVO);
}
