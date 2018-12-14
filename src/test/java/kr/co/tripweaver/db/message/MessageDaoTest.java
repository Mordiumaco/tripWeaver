package kr.co.tripweaver.db.message;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.Map;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import kr.co.tripweaver.mymenu.mypage.message.dao.IMessageDao;
import kr.co.tripweaver.test.ServiceDaoTestConfig;

public class MessageDaoTest extends ServiceDaoTestConfig {

	@Autowired
	private IMessageDao messageDao;
	
	@Test
	public void insertChatroomTest() {
		/***Given***/
		Map<String, Object> resultMap = new HashMap<String, Object>();

		/***When***/
		String group_id = messageDao.insertChatroom(resultMap);
		
		/***Then***/
		assertEquals("test", group_id);
	}

}
