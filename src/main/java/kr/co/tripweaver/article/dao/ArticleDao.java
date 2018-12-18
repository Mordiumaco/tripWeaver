package kr.co.tripweaver.article.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.tripweaver.article.model.ArticleVO;

@Repository
public class ArticleDao implements IArticleDao {
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;

	@Override
	public int insertArticle(ArticleVO articleVo) {
		return template.insert("articleSQL.insertArticle", articleVo);
	}

}
