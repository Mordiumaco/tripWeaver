package kr.co.tripweaver.mymenu.mypage.follow_following.service;

import java.util.Map;

import kr.co.tripweaver.mymenu.mypage.follow_following.model.FollowVO;

public interface IFollowService {

	/**
	* Method : messagePageView
	* 작성자 : jin
	* 변경이력 :
	* @param mem_id
	* @return
	* Method 설명 : 해당 멤버의 message.jsp 필요한 팔로잉/팔로워 정보(인원수,멤버리스트)를 반환하는 메서드
	 */
	public Map<String, Object> messagePageView(Map<String, Object> params);
	
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
	* Method : followCount
	* 작성자 : jin
	* 변경이력 :
	* @param mem_id
	* @return
	* Method 설명 : 최신 팔로잉, 팔로워 조회하는 메서드
	 */
	public Map<String, Object> followCount(String mem_id);
}
