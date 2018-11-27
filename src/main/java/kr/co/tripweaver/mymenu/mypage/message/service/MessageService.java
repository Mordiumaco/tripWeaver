package kr.co.tripweaver.mymenu.mypage.message.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tripweaver.mymenu.mypage.message.dao.IMessageDao;

@Service
public class MessageService implements IMessageService {

	@Autowired
	IMessageDao messageDao;
	
}
