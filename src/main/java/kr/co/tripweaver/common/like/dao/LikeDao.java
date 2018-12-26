package kr.co.tripweaver.common.like.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.tripweaver.common.like.model.LikeVO;

@Repository
public class LikeDao implements ILikeDao {
	
	@Resource(name = "sqlSessionTemplate")
	SqlSessionTemplate template;
	
	
	@Override
	public int likeCount(String LIKE_REL_ART_ID) {
		
		int likeInsertCnt = template.selectOne("likeSQL.likeCount", LIKE_REL_ART_ID);
		
		return likeInsertCnt;
	}


	@Override
	public List<LikeVO> likeAll(String mem_id) {
		List<LikeVO> likeAll = template.selectList("likeSQL.likeAll", mem_id);
		return likeAll;
	}


	@Override
	public int likeAdd(LikeVO likeVo) {
		int likeAddCnt = template.insert("likeSQL.likeAdd",likeVo);
		return likeAddCnt;
	}


	@Override
	public int likeDelete(LikeVO likeVo) {
		int likeDelCnt = template.delete("likeSQL.likeDelete", likeVo);
		return likeDelCnt;
	}
	
	
	/**
	* Method : likeCheckByMemIdAndLikeRelId
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 26.
	* 변경이력 :
	* @param likeVo
	* @return
	* Method 설명 : 해당 글에 로그인한 멤버가 좋아요를 했는지 않했는지를 체크
	*/
	@Override
	public LikeVO likeCheckByMemIdAndLikeRelId(LikeVO likeVo) {
		
		LikeVO resultLikeVo = null;
		
		try {
			
			resultLikeVo = template.selectOne("likeSQL.likeCheckByMemIdAndLikeRelId", likeVo);
			
		} catch (Exception e) {
			e.printStackTrace();
			return resultLikeVo;
		}
		
		return resultLikeVo;
	}
}
