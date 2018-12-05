package kr.co.tripweaver.mymenu.mypage.follow_following.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.tripweaver.member.model.MemberVO;

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
	public List<MemberVO> selectFollowing(String mem_id) {
		List<MemberVO> memberVOs = template.selectList("followSQL.selectFollowing", mem_id);
		return memberVOs;
	}

	@Override
	public int selectFollowerCount(String mem_id) {
		int followerCnt = template.selectOne("followSQL.selectFollowerCount", mem_id);
		return followerCnt;
	}

	@Override
	public List<MemberVO> selectFollower(String mem_id) {
		List<MemberVO> memberVOs = template.selectList("followSQL.selectFollower", mem_id);
		return memberVOs;
	}
	
}
