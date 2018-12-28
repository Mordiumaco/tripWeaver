package kr.co.tripweaver.manager.conn_stat.service;

import java.util.Map;

import kr.co.tripweaver.manager.conn_stat.model.ConnStatVO;

public interface IConnStatService {
	
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
	public Map<String, Object> selectConnInfo(Map<String, Object> params);
	
	/**
	* Method : selectConnStat
	* 작성자 : jin
	* 변경이력 :
	* @param params
	* @return
	* Method 설명 : 그래프 아작스용 결과를 반환해주는 메서드
	 */
	public Map<String, Object> selectConnStat(Map<String, Object> params);
}
