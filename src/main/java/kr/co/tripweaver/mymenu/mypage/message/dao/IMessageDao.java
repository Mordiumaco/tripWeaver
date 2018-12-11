package kr.co.tripweaver.mymenu.mypage.message.dao;

import java.util.List;

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
	public List<String> selectParticipantNickList(String group_id);
	
	/**
	* Method : selectMessageList
	* 작성자 : jin
	* 변경이력 :
	* @param group_id
	* @return
	* Method 설명 : 해당 채팅방의 메세지리스트를 반환하는 메서드
	 */
	public List<MessageVO> selectMessageList(String group_id);
	
}
