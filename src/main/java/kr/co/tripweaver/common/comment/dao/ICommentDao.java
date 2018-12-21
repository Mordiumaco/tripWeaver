package kr.co.tripweaver.common.comment.dao;

import java.util.List;
import java.util.Map;

import kr.co.tripweaver.common.comment.model.CommentVO;

public interface ICommentDao {
	
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
	
}
