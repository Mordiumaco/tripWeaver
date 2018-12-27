package kr.co.tripweaver.postcard.dao;

import java.util.List;
import java.util.Map;

import kr.co.tripweaver.postcard.model.PostCardVO;

public interface IPostCardDao {
	
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
	List<PostCardVO> selectPostCardAll(Map<String, Object> params);
	
	/**
	 * 
		* 
		* Method : 
		* 작성자 : 
		* 생성날짜 : 
		* 변경이력 :
		* @param 
		* @return
		* Method 설명 : 포스트 카드 삭제 하기
		*
	 */
	int deletePostcard(PostCardVO postcardVo);
	
	/**
	 * 
		* 
		* Method : 
		* 작성자 : 
		* 생성날짜 : 
		* 변경이력 :
		* @param 
		* @return
		* Method 설명 : 포스트 카드 글 쓰기
		*
	 */
	String insertPostcard(PostCardVO postcardVo);
	
	/**
	 * 
		* 
		* Method : 
		* 작성자 : 
		* 생성날짜 : 
		* 변경이력 :
		* @param 
		* @return
		* Method 설명 : 포스카드 업데이트
		*
	 */
	int updatePostcard(PostCardVO postcardVo);
	
	/**
	 * 
		* 
		* Method : 
		* 작성자 : 
		* 생성날짜 : 
		* 변경이력 :
		* @param 
		* @return
		* Method 설명 : 해당 포스트카드 게시물 가져오기
		*
	 */
	PostCardVO selectPostcard(String pc_id);
	
	
	/**
	 * 
		* 
		* Method : 
		* 작성자 :  박찬배
		* 생성날짜 : 
		* 변경이력 :
		* @param 
		* @return
		* Method 설명 : 마이페이지 클립보드 포스트카드 리스트 뿌리기
		*
	 */
	
	List<PostCardVO> selectPostcardClip(Map<String, Object> params);
	
	/**
	 * 
		* 
		* Method : 
		* 작성자 : 
		* 생성날짜 : 
		* 변경이력 :
		* @param 
		* @return
		* Method 설명 : 마이페이지 클립보드 포스트카드 총 갯수 가져오기
		*
	 */
	int selectAllPostClip(Map<String, Object> params);
}
