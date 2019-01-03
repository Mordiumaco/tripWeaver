package kr.co.tripweaver.article.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tripweaver.article.dao.IArticleDao;
import kr.co.tripweaver.article.model.ArticleVO;

@Service
public class ArticleService implements IArticleService {

	@Autowired
	IArticleDao articleDao;

	/**
	* Method : articlePagingList
	* 작성자 : pc23
	* 변경이력 :
	* @param param
	* @return
	* Method 설명 : 게시글 페이지 리스트 
	*/
	@Override
	public List<ArticleVO> articlePagingList(Map<String, Object> param) {
		return articleDao.articlePagingList(param);
	}

	/**
	* Method : getArticleCnt
	* 작성자 : pc23
	* 변경이력 :
	* @param param
	* @return
	* Method 설명 : 게시글 총 갯수
	*/
	@Override
	public int getArticleCnt(Map<String, Object> param) {
		return articleDao.getArticleCnt(param);
	}

	/**
	* Method : insertArticle
	* 작성자 : pc23
	* 변경이력 :
	* @param articleVo
	* @return
	* Method 설명 : 게시글 insert
	*/
	@Override
	public String insertArticle(ArticleVO articleVo) {
		return articleDao.insertArticle(articleVo);
	}
	
	/**
	* Method : updateArticle
	* 작성자 : pc23
	* 변경이력 :
	* @param param
	* @return
	* Method 설명 : 게시글 수정
	*/
	@Override
	public int updateArticle(ArticleVO articleVo) {
		return articleDao.updateArticle(articleVo);
	}

	/**
	* Method : deleteArticle
	* 작성자 : pc23
	* 변경이력 :
	* @param param
	* @return
	* Method 설명 : 게시글 삭제
	*/
	@Override
	public int deleteArticle(ArticleVO articleVo) {
		return articleDao.deleteArticle(articleVo);
	}
	
	/**
	* Method : getArticleDetail
	* 작성자 : pc23
	* 변경이력 :
	* @param art_id
	* @return
	* Method 설명 : 게시글 상세보기
	*/
	@Override
	public ArticleVO getArticleDetail(String art_id) {
		return articleDao.getArticleDetail(art_id);
	}

	
	/**
	* Method : selectEssayByMemIdAndBoardIdForBoard
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 28.
	* 변경이력 :
	* @param param
	* @return
	* Method 설명 : 맵으로 페이지 수, 아이디, board_id 값을 줘 해당하는 ArticleVO 리스트를 받아온다.
	*/
	public List<ArticleVO> selectEssayByMemIdAndBoardIdForBoard(Map<String, String> param){
		return articleDao.selectEssayByMemIdAndBoardIdForBoard(param);
	}
	
	
	/**
	* Method : articleTotalCount
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 28.
	* 변경이력 :
	* @param param
	* @return
	* Method 설명 : board_id와 mem_id를 주고 해당 회원이 쓴 게시물 갯수를 받아온다.
	*/
	public int articleTotalCount(Map<String, String> param) {
		return articleDao.articleTotalCount(param);
	}


	
}
