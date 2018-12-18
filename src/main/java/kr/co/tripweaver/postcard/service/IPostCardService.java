package kr.co.tripweaver.postcard.service;

import java.util.List;
import java.util.Map;

import kr.co.tripweaver.postcard.model.PostCardVO;

public interface IPostCardService {
	
	/**
	 * 
	* Method : selectPostCardAll
	* 작성자 : 박찬배
	* 생성날짜 : 2018. 12. 13.
	* 변경이력 :
	* @param 
	* @return
	* Method 설명 : postcard 리스트 가져오기
	* 
	*/
	public Map<String, Object> selectPostCardAll();
	
	/**
	 * 
		* 
		* Method : 
		* 작성자 : 
		* 생성날짜 : 
		* 변경이력 :
		* @param 
		* @return
		* Method 설명 : 포스트 삭제
		*
	 */
	public int deletePostcard(PostCardVO postcardVo);
}
