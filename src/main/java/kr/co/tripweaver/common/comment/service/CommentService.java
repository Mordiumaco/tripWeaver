package kr.co.tripweaver.common.comment.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tripweaver.common.comment.dao.ICommentDao;

@Service
public class CommentService implements ICommentService {
	
	@Autowired
	ICommentDao commentDao;
	
}
