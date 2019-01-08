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

	/**
	 * Method : selectBoardByBoardId
	 * 작성자 : Jae Hyeon Choi
	 * 생성날짜 : 2018. 12. 30.
	 * 변경이력 : 
	 * @param board_id
	 * @return
	 * 해당 board_id 에 해당하는 객체를 받아온다. 
	 */
	@Override
	public BoardVO selectBoardByBoardId(String board_id){
		
		BoardVO boardVo = null;
		
		try {
			
			boardVo = template.selectOne("boardSQL.selectBoardByBoardId", board_id);
			
		} catch (Exception e) {
			e.printStackTrace();
			return boardVo;
		}
		
		return boardVo;
	}

	/**
	* Method : boardUseCnt
	* 작성자 : pc23
	* 변경이력 :
	* @return
	* Method 설명 : 게시판 사용갯수
	*/
	@Override
	public int boardUseCnt() {
		
		int boardUseCnt = 0;
		
		try {
			
			boardUseCnt = template.selectOne("boardSQL.boardUseCnt");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return boardUseCnt;
	}

	/**
	* Method : boardNotUseCnt
	* 작성자 : pc23
	* 변경이력 :
	* @return
	* Method 설명 : 게시판 비사용갯수
	*/
	@Override
	public int boardNotUseCnt() {
		
		int boardNotUseCnt = 0;
		
		try {
			
			boardNotUseCnt = template.selectOne("boardSQL.boardNotUseCnt");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return boardNotUseCnt;
	}

	@Override
	public int boardAllCnt() {
		
		int boardAllCnt = 0;
		
		try {
			
			boardAllCnt = template.selectOne("boardSQL.boardAllCnt");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return boardAllCnt;
	}
	
}
