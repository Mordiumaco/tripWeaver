package kr.co.tripweaver.board.service;

import org.springframework.beans.factory.annotation.Autowired;

import kr.co.tripweaver.board.dao.IBoardDao;

public class BoardService implements IBoardService{

	@Autowired
	IBoardDao boardDao;
	
}
