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

	
}
