package kr.co.tripweaver.article.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.tripweaver.article.model.ArticleVO;

@Repository
public class ArticleDao implements IArticleDao {
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;
	
	@Override
	public List<ArticleVO> articlePagingList(Map<String, Object> param) {
		return template.selectList("articleSQL.articlePagingList", param);
	}

	@Override
	public int getArticleCnt(Map<String, Object> param) {
		return template.selectOne("articleSQL.getArticleCnt", param);
	}
	
	@Override
	public String insertArticle(ArticleVO articleVo) {
		int result = template.insert("articleSQL.insertArticle", articleVo);
		String art_id = articleVo.getArt_id();
		return art_id;
	}
	
	@Override
	public int updateArticle(Map<String, Object> param) {
		return template.update("articleSQL.articleUpdate", param);
	}

	@Override
	public int deleteArticle(Map<String, Object> param) {
		return template.delete("articleSQL.articleDelete", param);
	}
	
	@Override
	public ArticleVO getArticleDetail(String art_id) {
		return template.selectOne("articleSQL.getArticleDetail", art_id);
	}

	

	



}
