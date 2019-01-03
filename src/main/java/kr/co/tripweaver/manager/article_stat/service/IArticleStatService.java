package kr.co.tripweaver.manager.article_stat.service;

import java.util.Map;

public interface IArticleStatService {
	
	/**
	* Method : selectEssayStat
	* 작성자 : jin
	* 변경이력 :
	* @param params
	* @return
	* Method 설명 : 에세이 통계 결과 데이터를 반환하는 메서드
	 */
	public Map<String, Object> selectEssayStat(Map<String, Object> params);
	
	/**
	* Method : selectPostCardStat
	* 작성자 : jin
	* 변경이력 :
	* @param params
	* @return
	* Method 설명 : 포스트카드  통계 데이터를 반환하는 메서드
	 */
	public Map<String, Object> selectPostCardStat(Map<String, Object> params);
}
