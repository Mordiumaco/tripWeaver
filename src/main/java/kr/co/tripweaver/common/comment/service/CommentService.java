package kr.co.tripweaver.common.comment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tripweaver.common.comment.dao.ICommentDao;
import kr.co.tripweaver.common.comment.model.CommentVO;

@Service
public class CommentService implements ICommentService {
	
	@Autowired
	ICommentDao commentDao;
	
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
	@Override
	public List<CommentVO> selectComment(String COMT_REL_ART_ID) {
			List<CommentVO> commentVOs = commentDao.selectComment(COMT_REL_ART_ID);
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
	public int insertComment(CommentVO commentVo) {
		 int insertCommentCnt = commentDao.insertComment(commentVo);
		return insertCommentCnt;
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
			int deleteCommentCnt = commentDao.deleteComment(comt_id);
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
		* Method 설명 : 댓글 업데이트
		*
	 */
	@Override
	public int updateComment(CommentVO commentVo) {
			int updateCommentCnt = commentDao.updateComment(commentVo);
		return updateCommentCnt;
	}
	
}
