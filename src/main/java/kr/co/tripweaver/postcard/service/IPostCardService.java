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
	public Map<String, Object> selectPostCardAll(Map<String, Object> params);
	
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
	
	/**
	 * 
		* 
		* Method : 
		* 작성자 : 
		* 생성날짜 : 
		* 변경이력 :
		* @param 
		* @return
		* Method 설명 : 포스트 글쓰기
		*
	 */
	public int insertPostcard(Map<String, Object> resultMap);
	
	/**
	 * 
		* 
		* Method : 
		* 작성자 : 
		* 생성날짜 : 
		* 변경이력 :
		* @param 
		* @return
		* Method 설명 : 포스트 업데이트
		*
	 */
	public int updatePostcard(Map<String, Object> resultMap);
	
	/**
	 * 
		* 
		* Method : 
		* 작성자 : 
		* 생성날짜 : 
		* 변경이력 :
		* @param 
		* @return
		* Method 설명 : 해당 게시글 가져오기
		*
	 */
	public PostCardVO selectPostcard(String pc_id);
	
	/**
	* Method : recentPostCardList
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 26.
	* 변경이력 :
	* @return
	* Method 설명 : 메인에 사용할 포스트 카드 리스트를 받아오기 위한 메서드
	*/
	public List<PostCardVO> recentPostCardList();
	
	/**
	* Method : selectPostCardByMemIdForBoard
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 28.
	* 변경이력 :
	* @param param
	* @return
	* Method 설명 : 게시판 관리를 위한 포스트카드 관리 정보를 얻기 위해서 page 번호와 해당 회원의 아이디를 맵으로 받아서 
	* POSTCARDVO 객체 리스트를 반환하는 메서드
	*/
	public List<PostCardVO> selectPostCardByMemIdForBoard(Map<String,String> param);
	
	/**
	* Method : postCardTotalCount
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 28.
	* 변경이력 :
	* @param mem_id
	* @return
	* Method 설명 : 해당 회원이 가지고 있는 총 포스트 카드 게시물 수를 반환
	*/
	public Integer postCardTotalCount(String mem_id);
	
	
	public PostCardVO selectSinglePost(String pc_id);
	
	public Map<String, Object> bestPostSelect(Map<String, Object> params);
}
