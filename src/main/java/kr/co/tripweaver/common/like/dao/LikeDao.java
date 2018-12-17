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

}
