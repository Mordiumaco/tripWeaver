package kr.co.tripweaver.hashtag.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.tripweaver.hashtag.model.HashTagVO;

@Repository
public class HashTagDao implements IHashTagDao {
	
	@Resource(name = "sqlSessionTemplate")
	SqlSessionTemplate template;
	
	/**
	 * 
		* 
		* Method : hashtagColumnConunt
		* 작성자 :  박찬배
		* 생성날짜 : 2018 12 13
		* 변경이력 :
		* @param 
		* @return
		* Method 설명 : 해시 태그 중복커럼  합산 카운트 값
		*
	 */
	public List<HashTagVO> hashtagColumnConunt() {
		
		List<HashTagVO> hashTagVOs = template.selectList("hashtagSQL.hashtagColumnConunt");
		
		return hashTagVOs;
	}

	@Override
	public List<String> hashtagPostCard(String pc_id) {
		
		List<String> strings = template.selectList("hashtagSQL.hashtagPostCard", pc_id);
		
		return strings;
	}
	
	
	
}
