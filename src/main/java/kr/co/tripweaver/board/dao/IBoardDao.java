package kr.co.tripweaver.board.dao;

import java.util.List;

import kr.co.tripweaver.board.model.BoardVO;

public interface IBoardDao {

	/**
	* Method : selectBoardAllList
	* 작성자 : pc23
	* 변경이력 :
	* @return
	* Method 설명 : 게시판 전체 불러오기
	*/
	public List<BoardVO> selectBoardAllList();
	
	/**
	* Method : insertBoard
	* 작성자 : pc23
	* 변경이력 :
	* @return
	* Method 설명 : 게시판 생성
	*/
	public int insertBoard(BoardVO boardVo);
	
}
