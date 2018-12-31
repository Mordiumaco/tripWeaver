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
	
	/**
	* Method : likeCheckByMemIdAndLikeRelId
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 26.
	* 변경이력 :
	* @param likeVo
	* @return
	* Method 설명 : 해당 글에 로그인한 멤버가 좋아요를 했는지 않했는지를 체크
	*/
	public LikeVO likeCheckByMemIdAndLikeRelId(LikeVO likeVo);
}
