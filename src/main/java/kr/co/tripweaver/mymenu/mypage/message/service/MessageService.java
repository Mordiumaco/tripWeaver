package kr.co.tripweaver.mymenu.mypage.message.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tripweaver.mymenu.mypage.follow_following.service.IFollowService;
import kr.co.tripweaver.mymenu.mypage.message.dao.IMessageDao;

@Service
public class MessageService implements IMessageService {

	@Autowired
	private IMessageDao messageDao;

	@Autowired
	private IFollowService followService;
	
	@Override
	public Map<String, Object> messagePageView(String mem_id) {
		
		//본인 정보도 필요(로그인 구현하면 세션에 다 넣어서 필요없나?)
		
		Map<String, Object> resultMap = followService.messagePageView(mem_id);
		
		return resultMap;
	}
	
	
}
