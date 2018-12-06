package kr.co.tripweaver.board.web; 

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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
	
	@Resource(name="boardService")
	private IBoardService boardService;
	
	@RequestMapping(value="/boardCreate", method=RequestMethod.POST)
	public String boardCreate(HttpServletRequest request, @RequestParam("board_title")String board_title, @RequestParam("board_use")String board_use) {
		
		MemberVO memberVo = (MemberVO)request.getAttribute("loginInfo");
		
		BoardVO boardVo = new BoardVO();
		boardVo.setBoard_title(board_title);
		boardVo.setBoard_use(board_use);
		
		return null;
	}

}
