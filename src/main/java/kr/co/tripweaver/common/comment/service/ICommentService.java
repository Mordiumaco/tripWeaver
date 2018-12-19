package kr.co.tripweaver.common.comment.service;

import java.util.List;

import kr.co.tripweaver.common.comment.model.CommentVO;

public interface ICommentService {
	
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
	public int insertComment(CommentVO commentVo);
	
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
}
