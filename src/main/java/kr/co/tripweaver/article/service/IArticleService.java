package kr.co.tripweaver.article.service;

import kr.co.tripweaver.article.model.ArticleVO;

public interface IArticleService {

	/**
	* Method : insertArticle
	* 작성자 : pc23
	* 변경이력 :
	* @param articleVo
	* @return
	* Method 설명 : 게시글 작성
	*/
	public int insertArticle(ArticleVO articleVo);
	
}
