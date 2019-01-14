package kr.co.tripweaver.article.service;

import java.util.List;
import java.util.Map;

import kr.co.tripweaver.article.model.ArticleVO;
import kr.co.tripweaver.member.model.MemberVO;

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
	* Method : updateArticle
	* 작성자 : pc23
	* 변경이력 :
	* @param param
	* @return
	* Method 설명 : 게시글 수정
	*/
	public int updateArticle(ArticleVO articleVo);
	
	/**
	* Method : deleteArticle
	* 작성자 : pc23
	* 변경이력 :
	* @param param
	* @return
	* Method 설명 : 게시글 삭제
	*/
	public int deleteArticle(ArticleVO articleVo);
	
	/**
	* Method : getArticleDetail
	* 작성자 : pc23
	* 변경이력 :
	* @param art_id
	* @return
	* Method 설명 : 게시글 상세보기
	*/
	public ArticleVO getArticleDetail(String art_id);
	
	/**
	* Method : selectEssayByMemIdAndBoardIdForBoard
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 28.
	* 변경이력 :
	* @param param
	* @return
	* Method 설명 : 맵으로 페이지 수, 아이디, board_id 값을 줘 해당하는 ArticleVO 리스트를 받아온다.
	*/
	public List<ArticleVO> selectEssayByMemIdAndBoardIdForBoard(Map<String, String> param);
	
	/**
	* Method : articleTotalCount
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 28.
	* 변경이력 :
	* @param param
	* @return
	* Method 설명 : board_id와 mem_id를 주고 해당 회원이 쓴 게시물 갯수를 받아온다.
	*/
	public int articleTotalCount(Map<String, String> param);
	
	/**
	* Method : recentlyGuideArticle
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2019. 1. 14.
	* 변경이력 :
	* @return
	* Method 설명 : 최근 가이드 지원 게시글들
	*/
	public List<MemberVO> recentlyGuideArticle();
}
