package kr.co.tripweaver.article.dao;

import kr.co.tripweaver.article.model.ArticleVO;

public interface IArticleDao {

	/**
	* Method : insertArticle
	* 작성자 : pc23
	* 변경이력 :
	* @param articleVo
	* @return
	* Method 설명 : 게시글 생성
	*/
	public int insertArticle(ArticleVO articleVo);
	
}
