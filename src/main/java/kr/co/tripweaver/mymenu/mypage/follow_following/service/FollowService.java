package kr.co.tripweaver.mymenu.mypage.follow_following.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tripweaver.member.model.MemberVO;
import kr.co.tripweaver.mymenu.mypage.follow_following.dao.IFollowDao;
import kr.co.tripweaver.mymenu.mypage.follow_following.model.FollowVO;

@Service
public class FollowService implements IFollowService {

	@Autowired
	private IFollowDao followDao;

	@Override
	public Map<String, Object> messagePageView(Map<String, Object> params) {
		String mem_id = (String) params.get("mem_id");
		int followingCnt = followDao.selectFollowingCount(mem_id);
		int followerCnt = followDao.selectFollowerCount(mem_id);
		List<MemberVO> followingVOs = followDao.selectFollowing(params);
		List<MemberVO> followerVOs = followDao.selectFollower(params);
		List<FollowVO> followVOs = followDao.selectFollow(mem_id);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("followingCnt", followingCnt);
		resultMap.put("followerCnt", followerCnt);
		resultMap.put("followingVOs", followingVOs);
		resultMap.put("followerVOs", followerVOs);
		resultMap.put("followVOs", followVOs);
		return resultMap;
	}

	@Override
	public int insertFollowing(FollowVO followVO) {
		//맞팔여부 확인 Y:1으로 인서트/있던거 1로 수정, N:0으로 인서트
		FollowVO followVO2 = new FollowVO(followVO.getMem_id(), followVO.getMem_id2());
		int cnt = followDao.selectFolState(followVO2);
		if(cnt == 1) {
			followVO.setFol_state(1);
			followVO2.setFol_state(1);
			followDao.updateFolState(followVO2);
		} else {
			followVO.setFol_state(0);
		}
		int followCnt = followDao.insertFollowing(followVO);
		return followCnt;
	}

	@Override
	public int deleteFollowing(FollowVO followVO) {
		//맞팔여부 확인 Y:0으로 update, N:바로 삭제
		FollowVO followVO2 = new FollowVO(followVO.getMem_id(), followVO.getMem_id2());
		int cnt = followDao.selectFolState(followVO2);
		if(cnt == 1) {
			followVO2.setFol_state(0);
			followDao.updateFolState(followVO2);
		}
		int unfollowCnt = followDao.deleteFollowing(followVO);
		return unfollowCnt;
	}

	@Override
	public Map<String, Object> followCount(String mem_id) {
		int following = followDao.selectFollowingCount(mem_id);
		int follower = followDao.selectFollowerCount(mem_id);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("followingCnt", following);
		resultMap.put("followerCnt", follower);
		return resultMap;
	}

	@Override
	public Map<String, Object> selectFollowList(Map<String, Object> params) {
		String follow = (String) params.get("follow");
		String mem_id = (String) params.get("mem_id");
		String viewer = (String) params.get("viewer");
		List<MemberVO> followList = null;
		List<FollowVO> followVOs = null;
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		if(viewer.equals("")) {
			if(follow.equals("following")) {
				followList = followDao.selectFollowingById(params);
			} else {
				followList = followDao.selectFollowerById(params);
				followVOs = followDao.selectFollow(mem_id);
				resultMap.put("followVOs", followVOs);
			}
		} else {
			followVOs = followDao.selectFollow2(viewer);
			resultMap.put("followVOs", followVOs);
			if(follow.equals("following")) {
				followList = followDao.selectFollowingById(params);
			} else {
				followList = followDao.selectFollowerById(params);
			}
		}
		
		resultMap.put("followList", followList);
		return resultMap;
	}

	
}
