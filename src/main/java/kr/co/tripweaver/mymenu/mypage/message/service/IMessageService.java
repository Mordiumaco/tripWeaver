package kr.co.tripweaver.mymenu.mypage.message.service;

import java.util.Map;

public interface IMessageService {

	/**
	* Method : messagePageView
	* 작성자 : jin
	* 변경이력 :
	* @param mem_id
	* @return
	* Method 설명 : 해당 멤버의 message.jsp 필요한 팔로잉/팔로워 정보(인원수,멤버리스트)를 반환하는 메서드
	 */
	public Map<String, Object> messagePageView(String mem_id);
}
