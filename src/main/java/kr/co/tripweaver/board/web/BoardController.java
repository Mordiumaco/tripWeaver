package kr.co.tripweaver.board.web; 

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.tripweaver.board.model.BoardVO;
import kr.co.tripweaver.board.service.IBoardService;
import kr.co.tripweaver.member.model.MemberVO;

@RequestMapping("/board")
@Controller
public class BoardController {
	
	Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Resource(name="boardService")
	private IBoardService boardService;
	
	@RequestMapping(value="/boardCreate", method=RequestMethod.GET)
	public String boardCreateView(@RequestParam(value="mem_id", required=false)String mem_id, HttpServletRequest request) {
		
		List<BoardVO> boardList = boardService.selectBoardAllList();
		request.setAttribute("gnb", 2);
		request.setAttribute("boardList", boardList);
		
		return "admin/board/create_board";
	}
	
	@RequestMapping(value="/boardCreate", method=RequestMethod.POST)
	public String boardCreate(HttpSession session, @RequestParam("board_title")String board_title, @RequestParam("board_use")String board_use, HttpServletRequest request) {
		
		MemberVO memberVo = (MemberVO)session.getAttribute("loginInfo");
		
		logger.debug("memberVo[loginInfo] : {} ", memberVo);
		
		String mem_id = memberVo.getMem_id(); 
		
		BoardVO boardVo = new BoardVO();
		boardVo.setBoard_title(board_title);
		boardVo.setBoard_use(board_use);
		boardVo.setMem_id(mem_id);
		
		int insertCnt = boardService.insertBoard(boardVo);
		
		List<BoardVO> boardList = boardService.selectBoardAllList();
		request.setAttribute("gnb", 2);
		request.setAttribute("boardList", boardList);
		
		return "admin/board/create_board";
	}
	
	@RequestMapping(value="/boardUpdate", method=RequestMethod.POST)
	public String boardUpdate(HttpSession session, @RequestParam("board_title")String board_title, @RequestParam("board_use")String board_use, @RequestParam("board_id") String board_id, HttpServletRequest request) {
		
		MemberVO memberVo = (MemberVO)session.getAttribute("loginInfo");
		
		logger.debug("board_use : {}", board_use); 
		logger.debug("board_title : {}", board_title); 
		
		
		String mem_id = memberVo.getMem_id();
		
		BoardVO boardVo = new BoardVO();
		boardVo.setBoard_id(board_id);
		boardVo.setBoard_title(board_title);
		boardVo.setBoard_use(board_use);
		boardVo.setMem_id(mem_id);
		
		int updateCnt = boardService.updateBoard(boardVo);
		
		List<BoardVO> boardList = boardService.selectBoardAllList();
		request.setAttribute("gnb", 2);
		request.setAttribute("boardList", boardList);
		
		return "admin/board/create_board";
		
	}

	@RequestMapping(value="/boardDelete", method=RequestMethod.GET)
	public String boardDelete(HttpSession session, @RequestParam("board_id")String board_id, HttpServletRequest request) {
		
		MemberVO memberVo = (MemberVO)session.getAttribute("loginInfo");
		
		String mem_id = memberVo.getMem_id();
		
		BoardVO boardVo = new BoardVO();
		boardVo.setBoard_id(board_id);
		boardVo.setMem_id(mem_id);
		
		int deleteCnt = boardService.deleteBoard(boardVo);
		
		List<BoardVO> boardList = boardService.selectBoardAllList();
		request.setAttribute("gnb", 2);
		request.setAttribute("boardList", boardList);
		
		return "admin/board/create_board";
		
	}
	
}
