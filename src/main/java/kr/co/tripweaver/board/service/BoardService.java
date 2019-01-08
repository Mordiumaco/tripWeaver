package kr.co.tripweaver.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tripweaver.board.dao.IBoardDao;
import kr.co.tripweaver.board.model.BoardVO;

@Service
public class BoardService implements IBoardService{

	@Autowired
	IBoardDao boardDao;

	/**
	* Method : selectBoardAllList
	* 작성자 : pc23
	* 변경이력 :
	* @return
	* Method 설명 : 게시판 전체 불러오기
	*/
	@Override
	public List<BoardVO> selectBoardAllList() {
		return boardDao.selectBoardAllList();
	}
	
	/**
	* Method : insertBoard
	* 작성자 : pc23
	* 변경이력 :
	* @return
	* Method 설명 : 게시판 생성
	*/
	@Override
	public int insertBoard(BoardVO boardVo) {
		return boardDao.insertBoard(boardVo);
	}

	/**
	* Method : updateBoard
	* 작성자 : pc23
	* 변경이력 :
	* @param boardVo
	* @return
	* Method 설명 : 게시판 수정
	*/
	@Override
	public int updateBoard(BoardVO boardVo) {
		return boardDao.updateBoard(boardVo);
	}

	/**
	* Method : deleteBoard
	* 작성자 : pc23
	* 변경이력 :
	* @param boardVo
	* @return
	* Method 설명 : 게시판 삭제
	*/
	@Override
	public int deleteBoard(BoardVO boardVo) {
		return boardDao.deleteBoard(boardVo);
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
	public BoardVO selectBoardByBoardId(String board_id){
		return boardDao.selectBoardByBoardId(board_id);
	}

	/**
	* Method : boardUseCnt
	* 작성자 : pc23
	* 변경이력 :
	* @param board_use
	* @return
	* Method 설명 : 게시판 사용갯수
	*/
	@Override
	public int boardUseCnt() {
		return boardDao.boardUseCnt();
	}
	
	/**
	* Method : boardNotUseCnt
	* 작성자 : pc23
	* 변경이력 :
	* @return
	* Method 설명 : 게시판 비사용갯수
	*/
	public int boardNotUseCnt() {
		return boardDao.boardNotUseCnt();
	}
	
	/**
	* Method : boardAllCnt
	* 작성자 : pc23
	* 변경이력 :
	* @return
	* Method 설명 : 게시판 전체 갯수
	*/
	public int boardAllCnt() {
		return boardDao.boardAllCnt();
	}
}
