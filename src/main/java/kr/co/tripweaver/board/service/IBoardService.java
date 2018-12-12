package kr.co.tripweaver.board.service;

import java.util.List;

import kr.co.tripweaver.board.model.BoardVO;

public interface IBoardService {

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
	
	
	/**
	* Method : updateBoard
	* 작성자 : pc23
	* 변경이력 :
	* @param boardVo
	* @return
	* Method 설명 : 게시판 수정
	*/
	public int updateBoard(BoardVO boardVo);
	
	
	/**
	* Method : deleteBoard
	* 작성자 : pc23
	* 변경이력 :
	* @param boardVo
	* @return
	* Method 설명 : 게시판 삭제
	*/
	public int deleteBoard(BoardVO boardVo);
	
}
