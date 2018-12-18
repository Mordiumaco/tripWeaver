package kr.co.tripweaver.common.like.service;

import java.util.List;

import kr.co.tripweaver.common.like.model.LikeVO;

public interface ILikeService {
	/**
	 * 
		* 
		* Method : 
		* 작성자 : 
		* 생성날짜 : 
		* 변경이력 :
		* @param 
		* @return
		* Method 설명 :좋아요 숫자 알아오기
		*
	 */
	public int likeCount(String LIKE_REL_ART_ID);
	
	/**
	 * 
		* 
		* Method : 
		* 작성자 : 박찬배
		* 생성날짜 : 
		* 변경이력 :
		* @param 
		* @return
		* Method 설명 : 접속자 좋아요 체크를 위한
		*
	 */
	public List<LikeVO> likeAll(String mem_id);
	
	
	public int likeAdd(LikeVO likeVo);
	public int likeDelete(LikeVO likeVo);
}
