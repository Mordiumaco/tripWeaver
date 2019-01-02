package kr.co.tripweaver.manager.article_stat.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.tripweaver.manager.article_stat.model.ArticleStatVO;

@Repository
public class ArticleStatDao implements IArticleStatDao {

	@Resource(name = "sqlSessionTemplate")
	SqlSessionTemplate template;
	
	@Override
	public List<ArticleStatVO> selectCountGraphMonth(Map<String, Object> params) {
		List<ArticleStatVO> articleStatVOs = template.selectList("articleStatSQL.selectCountGraphMonth", params);
		return articleStatVOs;
	}

	@Override
	public List<ArticleStatVO> selectCountGraphWeek(Map<String, Object> params) {
		List<ArticleStatVO> articleStatVOs = template.selectList("articleStatSQL.selectCountGraphWeek", params);
		return articleStatVOs;
	}

	@Override
	public List<ArticleStatVO> selectCountGraphDay(Map<String, Object> params) {
		List<ArticleStatVO> articleStatVOs = template.selectList("articleStatSQL.selectCountGraphDay", params);
		return articleStatVOs;
	}

	@Override
	public List<ArticleStatVO> selectSeasonGraph(Map<String, Object> params) {
		List<ArticleStatVO> articleStatVOs = template.selectList("articleStatSQL.selectSeasonGraph", params);
		return articleStatVOs;
	}

	@Override
	public List<ArticleStatVO> selectThemeGraph(Map<String, Object> params) {
		List<ArticleStatVO> articleStatVOs = template.selectList("articleStatSQL.selectThemeGraph", params);
		return articleStatVOs;
	}

	@Override
	public List<ArticleStatVO> selectPeoGraph(Map<String, Object> params) {
		List<ArticleStatVO> articleStatVOs = template.selectList("articleStatSQL.selectPeoGraph", params);
		return articleStatVOs;
	}

	@Override
	public List<ArticleStatVO> selectAgeGenderGraph(Map<String, Object> params) {
		List<ArticleStatVO> articleStatVOs = template.selectList("articleStatSQL.selectAgeGenderGraph", params);
		return articleStatVOs;
	}

}
