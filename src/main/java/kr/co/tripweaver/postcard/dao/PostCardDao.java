package kr.co.tripweaver.postcard.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.tripweaver.postcard.model.PostCardVO;

@Repository
public class PostCardDao implements IPostCardDao{
	
	@Resource(name = "sqlSessionTemplate")
	SqlSessionTemplate template;

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
	@Override
	public List<PostCardVO> selectPostCardAll(){
		
		List<PostCardVO> postcardVo = template.selectList("postcardSQL.selectPostCardAll");
		
		return postcardVo;
	} 
	
	
}
