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
	public int updateArticle(ArticleVO articleVo) {
		return template.update("articleSQL.articleUpdate", articleVo);
	}

	@Override
	public int deleteArticle(Map<String, Object> param) {
		return template.delete("articleSQL.articleDelete", param);
	}
	
	@Override
	public ArticleVO getArticleDetail(String art_id) {
		return template.selectOne("articleSQL.getArticleDetail", art_id);
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
	@Override
	public List<ArticleVO> selectEssayByMemIdAndBoardIdForBoard(Map<String, String> param){
		
		List<ArticleVO> articleList = null;
		
		try {
			
			articleList = template.selectList("articleSQL.selectEssayByMemIdAndBoardIdForBoard", param);
			
		} catch (Exception e) {
			e.printStackTrace();
			return articleList;
		}
		
		return articleList;
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
	@Override
	public int articleTotalCount(Map<String, String> param) {
		
		int resultCnt = 0;
		
		try {
			
			resultCnt = template.selectOne("articleSQL.articleTotalCount", param);
			
		} catch (Exception e) {
			e.printStackTrace();
			return resultCnt;
		}
		
		return resultCnt;
	}



}
