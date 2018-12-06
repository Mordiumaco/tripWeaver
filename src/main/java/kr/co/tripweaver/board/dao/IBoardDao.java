package kr.co.tripweaver.board.dao;

import kr.co.tripweaver.board.model.BoardVO;

public interface IBoardDao {

	/**
	* Method : insertBoard
	* 작성자 : pc23
	* 변경이력 :
	* @return
	* Method 설명 : 게시판 생성
	*/
	public int insertBoard(BoardVO boardVo);
	
}
