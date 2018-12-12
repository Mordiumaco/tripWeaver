package kr.co.tripweaver.article.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tripweaver.article.dao.IArticleDao;

@Service
public class ArticleService implements IArticleService {

	@Autowired
	IArticleDao postDao;
	
}
