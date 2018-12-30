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
	
	
	/**
	 * Method : selectBoardByBoardId
	 * 작성자 : Jae Hyeon Choi
	 * 생성날짜 : 2018. 12. 30.
	 * 변경이력 : 
	 * @param board_id
	 * @return
	 * 해당 board_id 에 해당하는 객체를 받아온다. 
	 */
	public BoardVO selectBoardByBoardId(String board_id);
}
