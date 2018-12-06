package kr.co.tripweaver.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tripweaver.board.dao.IBoardDao;
import kr.co.tripweaver.board.model.BoardVO;

@Service
public class BoardService implements IBoardService{

	@Autowired
	IBoardDao boardDao;

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
	
}
