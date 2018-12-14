package kr.co.tripweaver.hashtag.service;

import java.util.List;

import kr.co.tripweaver.hashtag.model.HashTagVO;

public interface IHashTagService {
	/**
	 * 
		* 
		* Method : hashtagColumnConunt
		* 작성자 :  박찬배
		* 생성날짜 : 2018 12 13
		* 변경이력 :
		* @param 
		* @return
		* Method 설명 : 해시 태그 중복커럼  합산 카운트 값
		*
	 */
	List<HashTagVO> hashtagColumnConunt();
	
	/**
	 * 
		* 
		* Method : hashtagPostCard
		* 작성자 : 박찬배
		* 생성날짜 : 2018. 12 13
		* 변경이력 :
		* @param 
		* @return
		* Method 설명 : 해당 포스트카드 id에 매칭하는 해시태그 리스트를 반환하는 메소드
		*
	 */
	List<String> hashtagPostCard(String pc_id);
}
