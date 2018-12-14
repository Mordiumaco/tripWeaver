package kr.co.tripweaver.mymenu.mypage.message.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.tripweaver.mymenu.mypage.message.model.MessageVO;
import kr.co.tripweaver.mymenu.mypage.message.model.ParticipantVO;

@Repository
public class MessageDao implements IMessageDao {

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;
	
	@Override
	public List<MessageVO> selectChatroom(String mem_id) {
		List<MessageVO> messageVOs = template.selectList("messageSQL.selectChatroom", mem_id);
		return messageVOs;
	}

	@Override
	public String selectChatroomName(ParticipantVO participantVO) {
		String chatrrom_name = template.selectOne("messageSQL.selectChatroomName", participantVO);
		return chatrrom_name;
	}

	@Override
	public List<String> selectParticipantNickList(String group_id) {
		List<String> memNickList = template.selectList("messageSQL.selectParticipantNickList", group_id);
		return memNickList;
	}

	@Override
	public List<MessageVO> selectMessageList(String group_id) {
		List<MessageVO> messageVOs = template.selectList("messageSQL.selectMessageList", group_id);
		return messageVOs;
	}

	@Override
	public List<String> selectChatroomMemberList(String group_id) {
		List<String> mem_idList = template.selectList("messageSQL.selectChatroomMemberList", group_id);
		return mem_idList;
	}

	@Override
	public String insertChatroom(Map<String, Object> resultMap) {
		template.insert("messageSQL.insertChatroom", resultMap);
		String group_id = (String) resultMap.get("group_id");
		return group_id;
	}

	@Override
	public int deleteChatroom(String group_id) {
		int delCnt = template.delete("messageSQL.deleteChatroom", group_id);
		return delCnt;
	}

	@Override
	public String insertMessage(MessageVO messageVO) {
		int intCnt = template.insert("messageSQL.insertMessage", messageVO);
		return messageVO.getMsg_id();
	}

	@Override
	public int deleteParticipant(ParticipantVO participantVO) {
		int delCnt = template.delete("messageSQL.deleteParticipant", participantVO);
		return delCnt;
	}

	@Override
	public int updateChatroomName(ParticipantVO participantVO) {
		int updCnt = template.update("messageSQL.updateChatroomName", participantVO);
		return updCnt;
	}

	@Override
	public int selectParticipantCount(String group_id) {
		int patCnt = template.selectOne("messageSQL.selectParticipantCount", group_id);
		return patCnt;
	}

	@Override
	public int updateChatroomDel(String group_id) {
		int updCnt = template.update("messageSQL.updateChatroomDel", group_id);
		return updCnt;
	}

	@Override
	public int insertMsgReciver(Map<String, Object> params) {
		int intCnt = template.insert("messageSQL.insertMsgReciver", params);
		return intCnt;
	}

}
