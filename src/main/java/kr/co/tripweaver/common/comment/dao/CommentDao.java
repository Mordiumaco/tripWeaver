package kr.co.tripweaver.common.comment.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.tripweaver.common.comment.model.CommentVO;

@Repository
public class CommentDao implements ICommentDao {
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;

	/**
	* Method : articleCommentList
	* 작성자 : pc23
	* 변경이력 :
	* @param art_id
	* @return
	* Method 설명 : 게시글 댓글 리스트 
	*/
	@Override
	public List<CommentVO> articleCommentList(String art_id) {
		return template.selectList("commentSQL.articleComment", art_id);
	}

	/**
	* Method : commentInsert
	* 작성자 : pc23
	* 변경이력 :
	* @param param
	* @return
	* Method 설명 : 댓글 insert
	*/
	@Override
	public int commentInsert(Map<String, Object> param) {
		return template.insert("commentSQL.commentInsert", param);
	}

	/**
	 * 
		* 
		* Method : 
		* 작성자 : 
		* 생성날짜 : 
		* 변경이력 :
		* @param 
		* @return
		* Method 설명 : 해당 게시글 댓글 가져오기
		*
	 */
	@Override
	public List<CommentVO> selectComment(String COMT_REL_ART_ID) {
		List<CommentVO> commentVOs = template.selectList("commentSQL.selectComment", COMT_REL_ART_ID);
		return commentVOs;
	}
	
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
	@Override
	public String insertComment(CommentVO commentVo) {
		int insertCommentCnt = template.insert("commentSQL.insertComment", commentVo);
		return commentVo.getComt_id();
	}
	
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
	@Override
	public int deleteComment(String comt_id) {
		int deleteCommentCnt = template.update("commentSQL.deleteComment", comt_id);
		return deleteCommentCnt;
	}
	
	/**
	 * 
		* 
		* Method : 
		* 작성자 : 
		* 생성날짜 : 
		* 변경이력 :
		* @param 
		* @return
		* Method 설명 : 댓글 수정
		*
	 */
	@Override
	public int updateComment(CommentVO commentVo) {
			int updateCommentCnt = template.update("commentSQL.updateComment", commentVo);
		return updateCommentCnt;
	}
}
