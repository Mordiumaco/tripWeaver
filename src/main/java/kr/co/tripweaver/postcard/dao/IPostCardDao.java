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
	
	
	/**
	 * 
		* 
		* Method : 
		* 작성자 :  박찬배
		* 생성날짜 : 2019.01.02
		* 변경이력 :
		* @param 
		* @return
		* Method 설명 : 신고쿼리 포스트카드 클릭시 단일 내용 가져오기
		*
	 */
	public PostCardVO selectSinglePost(String pc_id);

}
