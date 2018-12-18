package kr.co.tripweaver.article.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tripweaver.article.dao.IArticleDao;
import kr.co.tripweaver.article.model.ArticleVO;

@Service
public class ArticleService implements IArticleService {

	@Autowired
	IArticleDao articleDao;

	@Override
	public int insertArticle(ArticleVO articleVo) {
		return articleDao.insertArticle(articleVo);
	}
	
}
