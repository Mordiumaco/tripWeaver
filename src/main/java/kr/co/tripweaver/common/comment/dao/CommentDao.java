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

	@Override
	public List<CommentVO> articleCommentList(String art_id) {
		return template.selectList("commentsSQL.articleComment", art_id);
	}

	@Override
	public int commentInsert(Map<String, Object> param) {
		return template.insert("commentsSQL.commentInsert", param);
	}

}
