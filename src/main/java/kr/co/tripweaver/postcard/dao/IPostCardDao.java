package kr.co.tripweaver.postcard.dao;

import java.util.List;

import kr.co.tripweaver.postcard.model.PostCardVO;

public interface IPostCardDao {
	
	/**
	 * 
	* Method : selectPostCardAll
	* 작성자 : 박찬배
	* 생성날짜 : 2018. 12. 13.
	* 변경이력 :
	* @param 
	* @return
	* Method 설명 : postcard 리스트 가져오기
	* 
	*/
	List<PostCardVO> selectPostCardAll();

}
