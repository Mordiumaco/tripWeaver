package kr.co.tripweaver.mymenu.mypage.message.web;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.tripweaver.member.model.MemberVO;
import kr.co.tripweaver.mymenu.mypage.message.service.IMessageService;

@RequestMapping("/message")
@Controller
public class MessageController {
	
	@Autowired
	private IMessageService messageService;
	
	@RequestMapping("/mainView")
	public String messageView(MemberVO memberVO, Model model) {
		Map<String, Object> resultMap = messageService.messagePageView(memberVO.getMem_id());
		model.addAllAttributes(resultMap);
		
		return "mypage/message/message";
	}
	
	@RequestMapping("/chatRoomListView")
	public String chattingView() {
		return "mypage/message/chatting";
	}
	
	@RequestMapping("/chatRoomDetailView")
	public String chatting_viewView() {
		return "mypage/message/chatting_view";
	}
}
