package kr.co.tripweaver.mymenu.mypage.follow_following.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.tripweaver.member.model.MemberVO;
import kr.co.tripweaver.mymenu.mypage.follow_following.model.FollowVO;

@Repository
public class FollowDao implements IFollowDao {

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;
	
	@Override
	public int selectFollowingCount(String mem_id) {
		int followingCnt = template.selectOne("followSQL.selectFollowingCount", mem_id);
		return followingCnt;
	}

	@Override
	public List<MemberVO> selectFollowing(Map<String, Object> params) {
		List<MemberVO> memberVOs = template.selectList("followSQL.selectFollowing", params);
		return memberVOs;
	}

	@Override
	public int selectFollowerCount(String mem_id) {
		int followerCnt = template.selectOne("followSQL.selectFollowerCount", mem_id);
		return followerCnt;
	}

	@Override
	public List<MemberVO> selectFollower(Map<String, Object> params) {
		List<MemberVO> memberVOs = template.selectList("followSQL.selectFollower", params);
		return memberVOs;
	}

	@Override
	public int insertFollowing(FollowVO followVO) {
		System.out.println("insert follow : " + followVO);
		int followCnt = template.insert("followSQL.insertFollowing", followVO);
		return followCnt;
	}

	@Override
	public int deleteFollowing(FollowVO followVO) {
		System.out.println("delete follow : " + followVO);
		int unfollowCnt = template.delete("followSQL.deleteUnfollow", followVO);
		return unfollowCnt;
	}

	@Override
	public int selectFolState(FollowVO followVO) {
		int cnt = template.selectOne("followSQL.selectFolState", followVO);
		return cnt;
	}

	@Override
	public int updateFolState(FollowVO followVO) {
		int cnt = template.update("followSQL.updateFolState", followVO);
		return cnt;
	}

	@Override
	public List<FollowVO> selectFollow(String mem_id) {
		List<FollowVO> followVOs = template.selectList("followSQL.selectFollow", mem_id);
		return followVOs;
	}
	
}
