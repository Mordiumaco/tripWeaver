package kr.co.tripweaver.article.service;

import java.util.List;
import java.util.Map;

import kr.co.tripweaver.article.model.ArticleVO;

public interface IArticleService {

	/**
	* Method : articlePagingList
	* 작성자 : pc23
	* 변경이력 :
	* @param param
	* @return
	* Method 설명 : 게시글 페이징 리스트
	*/
	public List<ArticleVO> articlePagingList(Map<String, Object> param);
	
	/**
	* Method : getArticleCnt
	* 작성자 : pc23
	* 변경이력 :
	* @param param
	* @return
	* Method 설명 : 게시글 총 개수
	*/
	public int getArticleCnt(Map<String, Object> param);
	
	/**
	* Method : insertArticle
	* 작성자 : pc23
	* 변경이력 :
	* @param articleVo
	* @return
	* Method 설명 : 게시글 작성
	*/
	public String insertArticle(ArticleVO articleVo);
	
	/**
	* Method : getArticleDetail
	* 작성자 : pc23
	* 변경이력 :
	* @param art_id
	* @return
	* Method 설명 : 게시글 상세보기
	*/
	public ArticleVO getArticleDetail(String art_id);
	
}
