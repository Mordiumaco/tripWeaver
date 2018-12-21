package kr.co.tripweaver.common.comment.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tripweaver.common.comment.dao.ICommentDao;
import kr.co.tripweaver.common.comment.model.CommentVO;

@Service
public class CommentService implements ICommentService {
	
	@Autowired
	ICommentDao commentDao;

	@Override
	public List<CommentVO> articleCommentList(String art_id) {
		return commentDao.articleCommentList(art_id);
	}

	@Override
	public int commentInsert(Map<String, Object> param) {
		return commentDao.commentInsert(param);
	}
	
}
