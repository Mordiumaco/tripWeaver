package kr.co.tripweaver.mymenu.mypage.message.service;

import java.util.List;
import java.util.Map;

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
}
