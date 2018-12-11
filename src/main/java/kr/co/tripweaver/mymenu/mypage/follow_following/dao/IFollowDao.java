package kr.co.tripweaver.mymenu.mypage.follow_following.dao;

import java.util.List;
import java.util.Map;

import kr.co.tripweaver.member.model.MemberVO;
import kr.co.tripweaver.mymenu.mypage.follow_following.model.FollowVO;

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
	public List<MemberVO> selectFollowing(Map<String, Object> params);
	
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
	public List<MemberVO> selectFollower(Map<String, Object> params);
	
	/**
	* Method : insertFollowing
	* 작성자 : jin
	* 변경이력 :
	* @param followVO
	* @return
	* Method 설명 : 팔로잉을 하는 메서드
	 */
	public int insertFollowing(FollowVO followVO);
	
	/**
	* Method : deleteFollowing
	* 작성자 : jin
	* 변경이력 :
	* @param followVO
	* @return
	* Method 설명 : 언팔로우흫 하는 메서드
	 */
	public int deleteFollowing(FollowVO followVO);
	
	/**
	* Method : selectFolState
	* 작성자 : jin
	* 변경이력 :
	* @param mem_id
	* @param mem_id2
	* @return
	* Method 설명 : 맞팔인지 확인하는 메서드
	 */
	public int selectFolState(FollowVO followVO);
	
	/**
	* Method : updateFolState
	* 작성자 : jin
	* 변경이력 :
	* @param followVO
	* @return
	* Method 설명 : 맞팔여부를 수정하는 메서드
	 */
	public int updateFolState(FollowVO followVO);
	
	/**
	* Method : selectFollower
	* 작성자 : jin
	* 변경이력 :
	* @param mem_id
	* @return
	* Method 설명 : 팔로워에 대한 FollowVO정보리스트를 반환하는 메서드
	 */
	public List<FollowVO> selectFollow(String mem_id);
}
