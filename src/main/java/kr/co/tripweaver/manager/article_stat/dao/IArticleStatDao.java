package kr.co.tripweaver.manager.article_stat.dao;

import java.util.List;
import java.util.Map;

import kr.co.tripweaver.manager.article_stat.model.ArticleStatVO;

public interface IArticleStatDao {

	//에세이
	/**
	* Method : selectCountGraphMonth
	* 작성자 : jin
	* 변경이력 :
	* @param params
	* @return
	* Method 설명 : 에세이 월간 총 개수 그래프 데이터 반환하는 메서드
	 */
	public List<ArticleStatVO> selectCountGraphMonth(Map<String, Object> params);
	
	/**
	* Method : selectCountGraphWeek
	* 작성자 : jin
	* 변경이력 :
	* @param params
	* @return
	* Method 설명 : 에세이 주간 총 개수 그래프 데이터 반환하는 메서드
	 */
	public List<ArticleStatVO> selectCountGraphWeek(Map<String, Object> params);
	
	/**
	* Method : selectCountGraphDay
	* 작성자 : jin
	* 변경이력 :
	* @param params
	* @return
	* Method 설명 : 에세이 일간 총 개수 그래프 데이터 반환하는 메서드
	 */
	public List<ArticleStatVO> selectCountGraphDay(Map<String, Object> params);
	
	/**
	* Method : selectSeasonGraph
	* 작성자 : jin
	* 변경이력 :
	* @param params
	* @return
	* Method 설명 : 선택날짜 에세이 시즌 데이터를 반환하는 메서드
	 */
	public List<ArticleStatVO> selectSeasonGraph(Map<String, Object> params);
	
	/**
	* Method : selectThemeGraph
	* 작성자 : jin
	* 변경이력 :
	* @param params
	* @return
	* Method 설명 : 선택날짜 에세이 테마 데이터를 반환하는 메서드
	 */
	public List<ArticleStatVO> selectThemeGraph(Map<String, Object> params);
	
	/**
	* Method : selectPeoGraph
	* 작성자 : jin
	* 변경이력 :
	* @param params
	* @return
	* Method 설명 : 선택날짜 에세이 인원 데이터를 반환하는 메서드
	 */
	public List<ArticleStatVO> selectPeoGraph(Map<String, Object> params);
	
	/**
	* Method : selectAgeGenderGraph
	* 작성자 : jin
	* 변경이력 :
	* @param params
	* @return
	* Method 설명 : 선택날짜 에세이 나이 성별 데이터를 반환하는 메서드
	 */
	public List<ArticleStatVO> selectAgeGenderGraph(Map<String, Object> params);
	
	//포스트카드
	/**
	* Method : selectCountGraphMonthPostcard
	* 작성자 : jin
	* 변경이력 :
	* @param params
	* @return
	* Method 설명 : 포스트카드 월간 총 개수 그래프 데이터 반환하는 메서드
	 */
	public List<ArticleStatVO> selectCountGraphMonthPostcard(Map<String, Object> params);
	
	/**
	* Method : selectCountGraphWeekPostcard
	* 작성자 : jin
	* 변경이력 :
	* @param params
	* @return
	* Method 설명 : 포스트카드 주간 총 개수 그래프 데이터 반환하는 메서드
	 */
	public List<ArticleStatVO> selectCountGraphWeekPostcard(Map<String, Object> params);
	
	/**
	* Method : selectCountGraphDayPostcard
	* 작성자 : jin
	* 변경이력 :
	* @param params
	* @return
	* Method 설명 : 포스트카드 일간 총 개수 그래프 데이터 반환하는 메서드
	 */
	public List<ArticleStatVO> selectCountGraphDayPostcard(Map<String, Object> params);
	
	
	/**
	* Method : selectAgeGenderGraphPostcard
	* 작성자 : jin
	* 변경이력 :
	* @param params
	* @return
	* Method 설명 : 선택날짜 포스트카드 나이 성별 데이터를 반환하는 메서드
	 */
	public List<ArticleStatVO> selectAgeGenderGraphPostcard(Map<String, Object> params);
}
