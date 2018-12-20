package kr.co.tripweaver.postcard.dao;

import java.util.List;
import java.util.Map;

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
	public List<PostCardVO> selectPostCardAll(Map<String, Object> params){
		System.out.println(params);
		List<PostCardVO> postcardVo = template.selectList("postcardSQL.selectPostCardAll", params);
		
		return postcardVo;
	}
	
	/**
	 * 
		* 
		* Method : 
		* 작성자 : 
		* 생성날짜 : 
		* 변경이력 :
		* @param 
		* @return
		* Method 설명 : 포스트 카드 삭제 하기
		*
	 */
	@Override
	public int deletePostcard(PostCardVO postcardVo) {
		int postcardCnt = template.delete("postcardSQL.deletePostcard", postcardVo);
		return postcardCnt;
	}
	
	/**
	 * 
		* 
		* Method : 
		* 작성자 : 
		* 생성날짜 : 
		* 변경이력 :
		* @param 
		* @return
		* Method 설명 : 포스트 카드 글 쓰기
		*
	 */
	@Override
	public String insertPostcard(PostCardVO postcardVo) {
		template.insert("postcardSQL.insertPostcard", postcardVo);
		
		String insertPostcardCnt = postcardVo.getPc_id();
		
		return insertPostcardCnt;
	}

	/**
	 * 
		* 
		* Method : 
		* 작성자 : 
		* 생성날짜 : 
		* 변경이력 :
		* @param 
		* @return
		* Method 설명 : 포스카드 업데이트
		*
	 */
	@Override
	public int updatePostcard(PostCardVO postcardVo) {
		int updatePostcard = template.update("postcardSQL.updatePostcard", postcardVo);
		return updatePostcard;
	}

	
	@Override
	public PostCardVO selectPostcard(String pc_id) {
		PostCardVO selectPostcardVo = template.selectOne("postcardSQL.selectPostcard", pc_id);
		return selectPostcardVo;
	} 
	
	
}
