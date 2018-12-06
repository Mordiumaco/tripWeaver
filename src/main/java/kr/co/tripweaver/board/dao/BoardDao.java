package kr.co.tripweaver.board.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.tripweaver.board.model.BoardVO;

@Repository
public class BoardDao implements IBoardDao{
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;

	@Override
	public int insertBoard(BoardVO boardVo) {
		return template.insert("boardSQL.insertBoard");
	}

	
	
}
