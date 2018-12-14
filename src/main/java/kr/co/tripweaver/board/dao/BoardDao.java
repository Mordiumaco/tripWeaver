package kr.co.tripweaver.board.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.tripweaver.board.model.BoardVO;

@Repository
public class BoardDao implements IBoardDao{
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;

	@Override
	public List<BoardVO> selectBoardAllList() {
		return template.selectList("boardSQL.selectBoardAllList");
	}
	
	@Override
	public int insertBoard(BoardVO boardVo) {
		return template.insert("boardSQL.insertBoard", boardVo);
	}

	@Override
	public int updateBoard(BoardVO boardVo) {
		return template.update("boardSQL.updateBoard", boardVo);
	}

	@Override
	public int deleteBoard(BoardVO boardVo) {
		return template.delete("boardSQL.deleteBoard", boardVo);
	}

	
	
}
