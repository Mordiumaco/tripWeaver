package kr.co.tripweaver.common.comment.service;

import java.util.List;
import java.util.Map;

import kr.co.tripweaver.common.comment.model.CommentVO;

public interface ICommentService {
	
	/**
	* Method : articleCommentList
	* 작성자 : pc23
	* 변경이력 :
	* @param art_id
	* @return
	* Method 설명 : 게시글 당 댓글 조회
	*/
	public List<CommentVO> articleCommentList(String art_id);
	
	/**
	* Method : commentInsert
	* 작성자 : pc23
	* 변경이력 :
	* @param param
	* @return
	* Method 설명 : 댓글 등록
	*/
	public int commentInsert(Map<String, Object> param);
	
	/**
	 * 
		* 
		* Method : 
		* 작성자 : 
		* 생성날짜 : 
		* 변경이력 :
		* @param 
		* @return
		* Method 설명 : 해당게시글 댓글 가져오기
		*
	 */
	public List<CommentVO> selectComment(String COMT_REL_ART_ID);
	
	/**
	 * 
		* 
		* Method : 
		* 작성자 : 
		* 생성날짜 : 
		* 변경이력 :
		* @param 
		* @return
		* Method 설명 : 댓글 쓰기
		*
	 */
	public String insertComment(CommentVO commentVo);
	
	/**
	 * 
		* 
		* Method : 
		* 작성자 : 
		* 생성날짜 : 
		* 변경이력 :
		* @param 
		* @return
		* Method 설명 : 댓글 삭제
		*
	 */
	public int deleteComment(String comt_id);
	
	/**
	 * 
		* 
		* Method : 
		* 작성자 : 
		* 생성날짜 : 
		* 변경이력 :
		* @param 
		* @return
		* Method 설명 : 댓글 업데이트
		*
	 */
	public int updateComment(CommentVO commentVo);
	
	/**
	* Method : selectEssayCommentByArtIdAndFilterId
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 21.
	* 변경이력 :
	* @param param
	* @return
	* Method 설명 : map으로 해당 댓글 아이디와 필터아이디를 줘서 댓글 리스트를 받는다.
	*/
	public List<CommentVO>selectEssayCommentByArtIdAndFilterId(Map<String, String> param);
}
