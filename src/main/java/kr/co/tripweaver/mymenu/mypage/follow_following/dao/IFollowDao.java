package kr.co.tripweaver.mymenu.mypage.follow_following.dao;

import java.util.List;

import kr.co.tripweaver.member.model.MemberVO;

public interface IFollowDao {
	
	/**
	* Method : selectFollowingCount
	* 작성자 : jin
	* 변경이력 :
	* @param mem_id
	* @return
	* Method 설명 : 해당 멤버의 팔로잉수를 반환하는 메서드
	 */
	public int selectFollowingCount(String mem_id);
	
	/**
	* Method : selectFollowing
	* 작성자 : jin
	* 변경이력 :
	* @param mem_id
	* @return
	* Method 설명 : 해당 멤버의 팔로잉 멤버리스트 반환하는 메서드
	 */
	public List<MemberVO> selectFollowing(String mem_id);
	
	/**
	* Method : selectFollowerCount
	* 작성자 : jin
	* 변경이력 :
	* @param mem_id
	* @return
	* Method 설명 : 해당 멤버의 팔로워수를 반환하는 메서드
	 */
	public int selectFollowerCount(String mem_id);
	
	/**
	* Method : selectFollower
	* 작성자 : jin
	* 변경이력 :
	* @param mem_id
	* @return
	* Method 설명 : 해당 멤버의 팔로워 멤버리스트를 반환하는 메서드
	 */
	public List<MemberVO> selectFollower(String mem_id);
}
