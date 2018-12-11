package kr.co.tripweaver.mymenu.mypage.message.dao;

import java.util.List;

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

}
