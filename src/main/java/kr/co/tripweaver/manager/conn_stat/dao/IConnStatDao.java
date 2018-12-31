package kr.co.tripweaver.manager.conn_stat.dao;

import java.util.List;
import java.util.Map;

import kr.co.tripweaver.manager.conn_stat.model.ConnStatVO;

public interface IConnStatDao {

	/**
	* Method : insertConnInfo
	* 작성자 : jin
	* 변경이력 :
	* @param connInfo
	* @return
	* Method 설명 : 멤버가 로그인시 접속정보를 데이터베이스에 저장하는 메서드
	 */
	public int insertConnInfo(ConnStatVO connStatVO);
	
	/**
	* Method : selectConnInfo
	* 작성자 : jin
	* 변경이력 :
	* @param params
	* @return
	* Method 설명 : 데이터베이스에서 접속자정보리스트를 맵리스트로 반환하는 메서드
	 */
	public List<ConnStatVO> selectConnInfo(Map<String, Object> params);
	
	/**
	* Method : getTotalPageCount
	* 작성자 : jin
	* 변경이력 :
	* @return
	* Method 설명 : 접속자 정보리스트 마지막페이지 반환하는 메서드
	 */
	public int getTotalPageCount();
	
	/**
	* Method : selectConnStat
	* 작성자 : jin
	* 변경이력 :
	* @param params
	* @return
	* Method 설명 : 접속자 통계부분 해당조건에 맞는 일일통계결과리스트 반환하는 메서드
	 */
	public List<ConnStatVO> selectConnStat(Map<String, Object> params);

	/**
	* Method : selectConnTimeStat
	* 작성자 : jin
	* 변경이력 :
	* @param params
	* @return
	* Method 설명 : 해당일자의 시간별 접속자수 통계를 반환하는 메서드
	 */
	public List<ConnStatVO> selectConnTimeStat(Map<String, Object> params);

	/**
	* Method : selectConnTimeStatMonth
	* 작성자 : jin
	* 변경이력 :
	* @param params
	* @return
	* Method 설명 : 해당월 평균 시간별 접속자수 통계를 반환하는 메서드
	 */
	public List<ConnStatVO> selectConnTimeStatMonth(Map<String, Object> params);
}
