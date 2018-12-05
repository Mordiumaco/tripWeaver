package kr.co.tripweaver.mymenu.mypage.follow_following.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tripweaver.member.model.MemberVO;
import kr.co.tripweaver.mymenu.mypage.follow_following.dao.IFollowDao;

@Service
public class FollowService implements IFollowService {

	@Autowired
	private IFollowDao followDao;

	@Override
	public Map<String, Object> messagePageView(String mem_id) {
		
		int followingCnt = followDao.selectFollowingCount(mem_id);
		int followerCnt = followDao.selectFollowerCount(mem_id);
		List<MemberVO> followingVOs = followDao.selectFollowing(mem_id);
		List<MemberVO> followerVOs = followDao.selectFollower(mem_id);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("followingCnt", followingCnt);
		resultMap.put("followerCnt", followerCnt);
		resultMap.put("followingVOs", followingVOs);
		resultMap.put("followerVOs", followerVOs);
		
		return resultMap;
	}
	
}
