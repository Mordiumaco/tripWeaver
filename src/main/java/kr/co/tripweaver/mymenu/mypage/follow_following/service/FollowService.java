package kr.co.tripweaver.mymenu.mypage.follow_following.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tripweaver.mymenu.mypage.follow_following.dao.IFollowDao;

@Service
public class FollowService implements IFollowService {

	@Autowired
	IFollowDao followDao;
	
}
