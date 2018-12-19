package kr.co.tripweaver.article.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tripweaver.article.dao.IArticleDao;
import kr.co.tripweaver.article.model.ArticleVO;
import kr.co.tripweaver.util.model.PageVO;

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
	public Map<String, Object> articlePagingList(Map<String, Object> param) {
		
		List<ArticleVO> list = articleDao.articlePagingList(param);
		
		String board_id = (String) param.get("board_id");
		String search = (String)param.get("search");
		String searchWord = (String)param.get("searchWord");
		
		Map<String, Object> map = new HashMap<>();
		map.put("board_id", board_id);
		map.put("search", search);
		map.put("searchWord", searchWord);
		
		int totalArticleCnt = articleDao.getArticleCnt(map);
		
		PageVO pageVo = (PageVO) param.get("pageVo");
		int pageCnt = (int) Math.ceil(((double)totalArticleCnt / pageVo.getPageSize()));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("articleList", list);
		resultMap.put("search", search);
		resultMap.put("searchWord", (String)param.get("searchWord"));
		resultMap.put("pageCnt", pageCnt);
		
		return resultMap;
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


	
}
